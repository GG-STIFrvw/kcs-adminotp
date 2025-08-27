<?php
session_start();
header('Content-Type: application/json');

require_once __DIR__ . '/config.php';

if (!isset($_SESSION['user']['id'])) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized']);
    exit();
}

$userId = (int) $_SESSION['user']['id'];

try {
    $stmt = $pdo->prepare("UPDATE notifications SET status = 'read' WHERE user_id = ? AND status = 'unread'");
    $stmt->execute([$userId]);
    echo json_encode(['ok' => true]);
} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Failed to update notifications']);
}

?>
