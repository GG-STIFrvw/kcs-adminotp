<?php
session_start();
require_once 'config.php';
include 'header.php';

if (!isset($_SESSION['user']) || $_SESSION['user']['role'] != 'customer') {
    header("Location: login.php");
    exit();
}

// Assuming $pdo is available from a config.php included in the main script
// If $pdo is not globally available, you might need to pass it or include config.php here
// For this component, we'll assume config.php is included in the parent script.

$userId = $_SESSION['user']['id'];

// Mark notifications as read
$updateStmt = $pdo->prepare("UPDATE notifications SET status = 'read' WHERE user_id = ? AND status = 'unread'");
$updateStmt->execute([$userId]);

// Fetch confirmed or declined appointments and related quotations for the current customer
$stmt = $pdo->prepare("
    SELECT 
        a.id, a.scheduled_date, a.scheduled_time, a.status, a.notes,
        v.brand, v.model, v.plate_number,
        s.name AS service_names,
        q.id AS quotation_id, q.amount AS quotation_amount, q.status AS quotation_status
    FROM appointments a
    JOIN vehicles v ON a.vehicle_id = v.id
    JOIN services s ON a.service_id = s.id
    LEFT JOIN job_orders jo ON a.id = jo.appointment_id
    LEFT JOIN quotations q ON jo.id = q.job_order_id
    WHERE a.user_id = ? AND (a.status IN ('confirmed', 'declined', 'completed', 'done') OR q.id IS NOT NULL)
    GROUP BY a.id, q.id
    ORDER BY a.scheduled_date DESC, a.scheduled_time DESC
");
$stmt->execute([$userId]);
$bookingStatuses = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<br><br>

<div class="booking-status-display" style="margin-top: 20px; padding: 15px; border: 1px solid #ddd; border-radius: 5px; background-color: #f9f9f9;">
<h2 class="text-2xl font-semibold mb-6">Your Notifcations Updates</h2>

    <?php if (!empty($bookingStatuses)): ?>
        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr style="background-color: #f2f2f2;">
                    <th style="padding: 10px; border: 1px solid #ddd; text-align: left;">Appointment ID</th>
                    <th style="padding: 10px; border: 1px solid #ddd; text-align: left;">Vehicle</th>
                    <th style="padding: 10px; border: 1px solid #ddd; text-align: left;">Services</th>
                    <th style="padding: 10px; border: 1px solid #ddd; text-align: left;">Scheduled</th>
                    <th style="padding: 10px; border: 1px solid #ddd; text-align: left;">Status</th>
                    <th style="padding: 10px; border: 1px solid #ddd; text-align: left;">Details</th>
                </tr>
            </thead>
            <tbody>
        <?php foreach ($bookingStatuses as $booking): ?>
            <tr>
                <td style="padding: 10px; border: 1px solid #ddd;"><?= htmlspecialchars($booking['id']) ?></td>
                <td style="padding: 10px; border: 1px solid #ddd;"><?= htmlspecialchars($booking['brand']) ?> <?= htmlspecialchars($booking['model']) ?> (<?= htmlspecialchars($booking['plate_number']) ?>)</td>
                <td style="padding: 10px; border: 1px solid #ddd;"><?= htmlspecialchars($booking['service_names']) ?: 'N/A' ?></td>
                <td style="padding: 10px; border: 1px solid #ddd;"><?= htmlspecialchars($booking['scheduled_date']) ?> at <?= htmlspecialchars($booking['scheduled_time']) ?></td>
                <td style="padding: 10px; border: 1px solid #ddd;">
                    <?php
                        $status_color = 'black'; // Default color
                        if ($booking['status'] == 'confirmed') {
                            $status_color = 'green';
                        } elseif ($booking['status'] == 'declined') {
                            $status_color = 'red';
                        } elseif (in_array($booking['status'], ['completed', 'done'])) {
                            $status_color = 'blue';
                        }
                    ?>
                    <span style="color: <?= $status_color ?>; font-weight: bold;">
                        <?= ucfirst(htmlspecialchars($booking['status'])) ?>
                    </span>
                </td>
                <td style="padding: 10px; border: 1px solid #ddd;">
                    <?php if (!empty($booking['quotation_id'])): ?>
                        <div class="quotation-info">
                            <strong>Quotation Received:</strong><br>
                            <strong>Amount:</strong> ₱<?= htmlspecialchars(number_format($booking['quotation_amount'], 2)) ?><br>
                            <strong>Status:</strong> <?= ucfirst(htmlspecialchars($booking['quotation_status'])) ?><br>
                            <a href="customer_view_quote.php" style="text-decoration: none; color: #007bff; font-weight: bold;">View Details</a>
                        </div>
                    <?php endif; ?>
                    <?php if (!empty($booking['notes'])): ?>
                        <p style="margin: 0;"><strong>Notes:</strong> <?= htmlspecialchars($booking['notes']) ?></p>
                    <?php endif; ?>
                </td>
            </tr>
        <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p style="color: #888; text-align: center; padding: 10px;">No confirmed or declined booking updates at this time.</p>
    <?php endif; ?>
</div>