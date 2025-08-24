<?php 
session_start();
if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit();
}

$user = $_SESSION['user'];
if ($user['role'] != 'customer') {
    header("Location: dashboard.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="css/dashboard_customer.css">
</head>
<body>

    <div class="dashboard-header">
        <h1>KCS Auto Repair Shop</h1>
        <a href="logout.php" class="logout-link">Logout</a>
    </div>

    <div class="dashboard-container">
        <div class="welcome-message">
            <h2>Welcome, <?php echo htmlspecialchars($user['full_name']); ?>!</h2>
            <p>This is your personal dashboard. From here you can manage your appointments, view quotations, and check your billing information.</p>
        </div>

        <div class="dashboard-nav">
            <a href="book.php" class="nav-card">
                <h3>Book Appointment</h3>
                <p>Schedule a new service for your vehicle.</p>
            </a>
            <a href="view.php" class="nav-card">
                <h3>View Quotation</h3>
                <p>Check the status and details of your service quotations.</p>
            </a>
            <a href="Billing_Cust.php" class="nav-card">
                <h3>Billing</h3>
                <p>Access your billing history and view invoices.</p>
            </a>
            <a href="customer_profile.php" class="nav-card">
                <h3>Edit Profile</h3>
                <p>Update your personal information and profile picture.</p>
            </a>
        </div>
    </div>

</body>
</html>