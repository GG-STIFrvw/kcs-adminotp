<?php
require_once 'config.php';

// Note: Add session validation here to ensure only authorized users can access this page.
// session_start();
// if (!isset($_SESSION['user']) || $_SESSION['user']['role'] !== 'admin') {
//     header("Location: index.php");
//     exit();
// }

$message = '';
$message_type = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action']) && $_POST['action'] === 'add') {
        $item_name = trim($_POST['item_name']);
        $quantity = intval($_POST['quantity']);
        $price = floatval($_POST['price']);

        if (!empty($item_name) && $quantity >= 0 && $price >= 0) {
            $stmt = $pdo->prepare("INSERT INTO inventory (item_name, quantity, price) VALUES (?, ?, ?)");
            if ($stmt->execute([$item_name, $quantity, $price])) {
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

        if (!empty($item_name) && $quantity >= 0 && $price >= 0) {
            $stmt = $pdo->prepare("UPDATE inventory SET item_name = ?, quantity = ?, price = ? WHERE id = ?");
            if ($stmt->execute([$item_name, $quantity, $price, $id])) {
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

$items = $pdo->query("SELECT * FROM inventory ORDER BY id DESC")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Inventory</title>
    <link rel="stylesheet" href="css/manage_inventory.css">
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

        <div class="form-container">
            <h2>Add New Item</h2>
            <form class="add-form" method="POST">
                <input type="hidden" name="action" value="add">
                <div class="form-row">
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
                    <button type="submit">Add Item</button>
                </div>
            </form>
        </div>

        <div class="table-container">
            <h2>Inventory List</h2>
            <table class="inventory-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Price (₱)</th>
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
                                    <input type="text" name="item_name" value="<?= htmlspecialchars($item['item_name']) ?>" required>
                                </td>
                                <td>
                                    <input type="number" name="quantity" value="<?= $item['quantity'] ?>" min="0" required>
                                </td>
                                <td>
                                    <input type="number" step="0.01" name="price" value="<?= $item['price'] ?>" min="0" required>
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

</body>
</html>