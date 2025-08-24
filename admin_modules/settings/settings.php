<?php
session_start();

if (!isset($_SESSION['user'])) {
    header("Location: ../../login.php");
    exit();
}

include('../../config.php');  // Adjust path to your config.php

$user = $_SESSION['user'];
$userId = $user['id'];

$profile_dir = '../../profile_pics/'; // folder on server where pics are saved

// Make sure the profile_pics directory exists
if (!is_dir($profile_dir)) {
    mkdir($profile_dir, 0755, true);
}

$message = '';
$message_type = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['profile_picture'])) {
    $file = $_FILES['profile_picture'];

    // Validate file upload success
    if ($file['error'] === UPLOAD_ERR_OK) {
        $tmp_name = $file['tmp_name'];
        $original_name = basename($file['name']);
        $ext = strtolower(pathinfo($original_name, PATHINFO_EXTENSION));

        // Allow only certain image types
        $allowed = ['jpg', 'jpeg', 'png', 'gif'];
        if (!in_array($ext, $allowed)) {
            $message = "Only JPG, PNG, and GIF files are allowed.";
            $message_type = "error";
        } else {
            // Create unique filename to avoid collisions
            $new_filename = $userId . '_pic.' . $ext;
            $destination = $profile_dir . $new_filename;

            // Move uploaded file
            if (move_uploaded_file($tmp_name, $destination)) {
                // Update database record for user
                $stmt = $pdo->prepare("UPDATE users SET profile_picture = ? WHERE id = ?");
                $stmt->execute([$new_filename, $userId]);

                // Update session immediately so dashboard sees new pic
                $_SESSION['user']['profile_picture'] = $new_filename;

                $message = "Profile picture updated successfully.";
                $message_type = "success";
            } else {
                $message = "Failed to move uploaded file.";
                $message_type = "error";
            }
        }
    } else {
        $message = "File upload error code: " . $file['error'];
        $message_type = "error";
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Settings</title>
<link rel="stylesheet" href="settings.css">
</head>
<body>

<div class="header">
    <h1>User Settings</h1>
    <a href="../../dashboard.php" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
</div>

<div class="container">
    <?php if ($message): ?>
        <div class="message <?php echo $message_type; ?>">
            <?php echo htmlspecialchars($message); ?>
        </div>
    <?php endif; ?>

    <div class="form-section">
        <h2>Update Profile Picture</h2>
        <form method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="profile_picture">Select New Profile Picture:</label>
                <input type="file" name="profile_picture" id="profile_picture" accept="image/*" required>
            </div>
            <div class="form-group">
                <button type="submit">Upload Picture</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>