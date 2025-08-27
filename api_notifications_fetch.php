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
    $countStmt = $pdo->prepare("SELECT COUNT(*) FROM notifications WHERE user_id = ? AND status = 'unread'");
    $countStmt->execute([$userId]);
    $unreadCount = (int) $countStmt->fetchColumn();

    $listStmt = $pdo->prepare("SELECT id, message, status, created_at FROM notifications WHERE user_id = ? ORDER BY created_at DESC LIMIT 20");
    $listStmt->execute([$userId]);
    $notifications = $listStmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        'unread_count' => $unreadCount,
        'notifications' => $notifications,
    ]);
} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Failed to fetch notifications']);
}

?>
