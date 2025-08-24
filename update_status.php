<?php
require_once 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $quote_id = intval($_POST['quote_id']);
    $status = $_POST['status'];
    $note = $_POST['note'] ?? '';

    $stmt = $pdo->prepare("UPDATE quotations SET status = ?, decline_note = ? WHERE id = ?");
    $stmt->execute([$status, $note, $quote_id]);

    header("Location: staff_view.php"); 
    exit();
}
?>
