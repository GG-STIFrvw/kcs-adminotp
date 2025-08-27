<?php
// Lightweight notification helper functions
// Depends on an existing PDO instance $pdo and a valid session user where needed

if (!function_exists('notify_user')) {
    function notify_user(PDO $pdo, int $userId, string $message): void {
        $stmt = $pdo->prepare("INSERT INTO notifications (user_id, message, status) VALUES (?, ?, 'unread')");
        $stmt->execute([$userId, $message]);
    }
}

if (!function_exists('notify_users_by_role')) {
    function notify_users_by_role(PDO $pdo, array $roles, string $message): void {
        if (empty($roles)) {
            return;
        }
        $placeholders = implode(',', array_fill(0, count($roles), '?'));
        $stmt = $pdo->prepare("SELECT id FROM users WHERE role IN ($placeholders)");
        $stmt->execute($roles);
        $userIds = $stmt->fetchAll(PDO::FETCH_COLUMN);
        if (!$userIds) {
            return;
        }
        $insert = $pdo->prepare("INSERT INTO notifications (user_id, message, status) VALUES (?, ?, 'unread')");
        foreach ($userIds as $uid) {
            $insert->execute([$uid, $message]);
        }
    }
}

?>
