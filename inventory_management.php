<?php
require_once 'config.php';

// Function to get ENUM values from a table column
function get_enum_values($pdo, $table, $column) {
    $stmt = $pdo->query("SHOW COLUMNS FROM `$table` LIKE '$column'");
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    $enum_list = str_replace("'", "", substr($row['Type'], 5, -1));
    return explode(",", $enum_list);
}

$location_enums = get_enum_values($pdo, 'inventory', 'location');
$supplier_enums = get_enum_values($pdo, 'inventory', 'supplier');

// Note: Add session validation here to ensure only authorized users can access this page.
session_start();
if (!isset($_SESSION['user']) || !in_array($_SESSION['user']['role'], ['admin', 'inventory_manager'])) {
    header("Location: index.php");
    exit();
}

$message = '';
$message_type = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action']) && $_POST['action'] === 'add') {
        $item_name = trim($_POST['item_name']);
        $quantity = intval($_POST['quantity']);
        $price = floatval($_POST['price']);
        $category = trim($_POST['category']);
        $reorder_threshold = intval($_POST['reorder_threshold']);
        $item_code = trim($_POST['item_code']);
        $location = trim($_POST['location']);
        $supplier = trim($_POST['supplier']);
        $lastPurchase_date = trim($_POST['lastPurchase_date']);
        $expiry_date = trim($_POST['expiry_date']);

        if (!empty($item_name) && $quantity >= 0 && $price >= 0) {
            $stmt = $pdo->prepare("INSERT INTO inventory (item_name, quantity, price, category, reorder_threshold, item_code, location, supplier, lastPurchase_date, expiry_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            if ($stmt->execute([$item_name, $quantity, $price, $category, $reorder_threshold, $item_code, $location, $supplier, $lastPurchase_date, $expiry_date])) {
                $message = "Item added successfully.";
                $message_type = 'success';
            } else {
                $message = "Error adding item.";
                $message_type = 'error';
            }
        } else {
            $message = "Invalid input. Please check all fields.";
            $message_type = 'error';
        }
    }

    if (isset($_POST['action']) && $_POST['action'] === 'edit') {
        $id = intval($_POST['id']);
        $item_name = trim($_POST['item_name']);
        $quantity = intval($_POST['quantity']);
        $price = floatval($_POST['price']);
        $category = trim($_POST['category']);
        $reorder_threshold = intval($_POST['reorder_threshold']);
        $item_code = trim($_POST['item_code']);
        $location = trim($_POST['location']);
        $supplier = trim($_POST['supplier']);
        $lastPurchase_date = trim($_POST['lastPurchase_date']);
        $expiry_date = trim($_POST['expiry_date']);

        if (!empty($item_name) && $quantity >= 0 && $price >= 0) {
            $stmt = $pdo->prepare("UPDATE inventory SET item_name = ?, quantity = ?, price = ?, category = ?, reorder_threshold = ?, item_code = ?, location = ?, supplier = ?, lastPurchase_date = ?, expiry_date = ? WHERE id = ?");
            if ($stmt->execute([$item_name, $quantity, $price, $category, $reorder_threshold, $item_code, $location, $supplier, $lastPurchase_date, $expiry_date, $id])) {
                $message = "Item #$id updated successfully.";
                $message_type = 'success';
            } else {
                $message = "Error updating item #$id.";
                $message_type = 'error';
            }
        } else {
            $message = "Invalid input for item #$id.";
            $message_type = 'error';
        }
    }
}

if (isset($_GET['action']) && $_GET['action'] === 'delete') {
    $deleteId = intval($_GET['id']);
    $stmt = $pdo->prepare("DELETE FROM inventory WHERE id = ?");
    if ($stmt->execute([$deleteId])) {
        $message = "Item #$deleteId has been deleted.";
        $message_type = 'success';
    } else {
        $message = "Error deleting item #$deleteId.";
        $message_type = 'error';
    }
}

// Search and filter logic
$search = isset($_GET['search']) ? trim($_GET['search']) : '';
$category_filter = isset($_GET['category']) ? trim($_GET['category']) : '';

$sql = "SELECT * FROM inventory";
$params = [];

if ($search) {
    $sql .= " WHERE item_name LIKE ?";
    $params[] = "%$search%";
}

if ($category_filter) {
    $sql .= ($search ? " AND" : " WHERE") . " category = ?";
    $params[] = $category_filter;
}

$sql .= " ORDER BY id ASC";

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$items = $stmt->fetchAll(PDO::FETCH_ASSOC);

$total_items = count($items);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Inventory</title>
    <link rel="stylesheet" href="css/manage_inventory.css">
    <style>
        .form-columns {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .form-column {
            flex: 0 0 48%;
            display: flex;
            flex-direction: column;
        }
        .form-column .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 1rem;
        }
        .form-column .form-group label {
            margin-bottom: 0.5rem;
        }
        .collapsible-container {
            display: none;
            overflow: hidden;
        }
        .collapsible-button {
            background-color: #28a745;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: auto;
            border: none;
            text-align: center;
            outline: none;
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 10px;
            border-radius: 10px;
        }
        .collapsible-button:hover {
            background-color: #269d41;
        }
        
    .button-container {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Inventory Management</h1>
        <a href="dashboard.php" class="back-link">Back to Dashboard</a>
    </div>

    <div class="container">

        <?php if ($message): ?>
            <div class="message <?= $message_type ?>"><?= htmlspecialchars($message) ?></div>
        <?php endif; ?>

        <div class="button-container">
            <button type="button" id="add-item-btn" class="collapsible-button">Add New Item</button>
            <a href="inventory_reports.php" class="collapsible-button" style="text-decoration: none;">View Reports</a>
        </div>
        <div id="add-item-container" class="collapsible-container">
            <div class="form-container">
                <form class="add-form" method="POST">
                    <input type="hidden" name="action" value="add">
                    <div class="form-columns">
                        <div class="form-column">
                            <div class="form-group">
                                <label for="item_code">Item Code</label>
                                <input type="text" id="item_code" name="item_code">
                            </div>
                            <div class="form-group">
                                <label for="item_name">Item Name</label>
                                <input type="text" id="item_name" name="item_name" required>
                            </div>
                            <div class="form-group">
                                <label for="quantity">Quantity</label>
                                <input type="number" id="quantity" name="quantity" min="0" required>
                            </div>
                            <div class="form-group">
                                <label for="price">Price (₱)</label>
                                <input type="number" id="price" step="0.01" name="price" min="0" required>
                            </div>
                            <div class="form-group">
                                <label for="category">Category</label>
                                <select id="category" name="category">
                                    <option value="">Select Category</option>
                                    <option value="non-moving">Non-Moving</option>
                                    <option value="slow-moving">Slow-Moving</option>
                                    <option value="fast-moving">Fast-Moving</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="reorder_threshold">Reorder Threshold</label>
                                <input type="number" id="reorder_threshold" name="reorder_threshold" min="0">
                            </div>
                        </div>
                        <div class="form-column">
                            <div class="form-group">
                                <label for="location">Location</label>
                                <select id="location" name="location">
                                    <option value="">Select Location</option>
                                    <?php foreach ($location_enums as $location_option): ?>
                                        <option value="<?= htmlspecialchars($location_option) ?>"><?= htmlspecialchars($location_option) ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="supplier">Supplier</label>
                                <select id="supplier" name="supplier">
                                    <option value="">Select Supplier</option>
                                    <?php foreach ($supplier_enums as $supplier_option): ?>
                                        <option value="<?= htmlspecialchars($supplier_option) ?>"><?= htmlspecialchars($supplier_option) ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="lastPurchase_date">Last Purchase Date</label>
                                <input type="date" id="lastPurchase_date" name="lastPurchase_date">
                            </div>
                            <div class="form-group">
                                <label for="expiry_date">Expiry Date</label>
                                <input type="date" id="expiry_date" name="expiry_date">
                            </div>
                            <button type="submit">Add Item</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="filters">
            <form method="GET" action="">
                <input type="text" name="search" placeholder="Search by item name..." value="<?= htmlspecialchars($search) ?>">
                <select name="category">
                    <option value="">All Categories</option>
                    <option value="non-moving" <?= $category_filter === 'non-moving' ? 'selected' : '' ?>>Non-Moving</option>
                    <option value="slow-moving" <?= $category_filter === 'slow-moving' ? 'selected' : '' ?>>Slow-Moving</option>
                    <option value="fast-moving" <?= $category_filter === 'fast-moving' ? 'selected' : '' ?>>Fast-Moving</option>
                </select>
                <button type="submit">Filter</button>
            </form>
        </div>

        <div class="table-container">
            <h2>Inventory List (<?= $total_items ?> items)</h2>
            <table class="inventory-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Item Code</th>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Price (₱)</th>
                        <th>Category</th>
                        <th>Reorder Threshold</th>
                        <th>Location</th>
                        <th>Supplier</th>
                        <th>Last Purchase Date</th>
                        <th>Expiry Date</th>
                        <th style="width: 200px;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                <?php if (empty($items)): ?>
                    <tr>
                        <td colspan="5" style="text-align:center;">No items found in inventory.</td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($items as $item): ?>
                        <tr>
                            <form method="POST">
                                <td><?= $item['id'] ?></td>
                                <td>
                                    <input type="text" name="item_code" value="<?= htmlspecialchars($item['item_code']) ?>">
                                </td>
                                <td>
                                    <input type="text" name="item_name" value="<?= htmlspecialchars($item['item_name']) ?>" required>
                                </td>
                                <td>
                                    <input type="number" name="quantity" value="<?= $item['quantity'] ?>" min="0" required>
                                </td>
                                <td>
                                    <input type="number" step="0.01" name="price" value="<?= $item['price'] ?>" min="0" required>
                                </td>
                                <td>
                                    <select name="category">
                                        <option value="" <?= !$item['category'] ? 'selected' : '' ?>>Select Category</option>
                                        <option value="non-moving" <?= $item['category'] === 'non-moving' ? 'selected' : '' ?>>Non-Moving</option>
                                        <option value="slow-moving" <?= $item['category'] === 'slow-moving' ? 'selected' : '' ?>>Slow-Moving</option>
                                        <option value="fast-moving" <?= $item['category'] === 'fast-moving' ? 'selected' : '' ?>>Fast-Moving</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="number" name="reorder_threshold" value="<?= $item['reorder_threshold'] ?>" min="0">
                                </td>
                                <td>
                                    <select name="location">
                                        <option value="">Select Location</option>
                                        <?php foreach ($location_enums as $location_option): ?>
                                            <option value="<?= htmlspecialchars($location_option) ?>" <?= ($item['location'] === $location_option) ? 'selected' : '' ?>><?= htmlspecialchars($location_option) ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </td>
                                <td>
                                    <select name="supplier">
                                        <option value="">Select Supplier</option>
                                        <?php foreach ($supplier_enums as $supplier_option): ?>
                                            <option value="<?= htmlspecialchars($supplier_option) ?>" <?= ($item['supplier'] === $supplier_option) ? 'selected' : '' ?>><?= htmlspecialchars($supplier_option) ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </td>
                                <td>
                                    <input type="date" name="lastPurchase_date" value="<?= $item['lastPurchase_date'] ?>">
                                </td>
                                <td>
                                    <input type="date" name="expiry_date" value="<?= $item['expiry_date'] ?>">
                                </td>
                                <td class="actions-cell">
                                    <input type="hidden" name="id" value="<?= $item['id'] ?>">
                                    <input type="hidden" name="action" value="edit">
                                    <button type="submit" class="update-btn">Update</button>
                                    <a href="?action=delete&id=<?= $item['id'] ?>" class="delete-btn" onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
                                </td>
                            </form>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
                </tbody>
            </table>
        </div>

    </div>

    <script>
        document.getElementById("add-item-btn").addEventListener("click", function() {
            var content = document.getElementById("add-item-container");
            if (content.style.display === "block") {
                content.style.display = "none";
            } else {
                content.style.display = "block";
            }
        });
    </script>

</body>
</html>