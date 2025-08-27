<!-- navbar.php -->
<div class="navbar">
    <div class="logo">
        <img src="https://i.ibb.co/mVz8zFGw/logo.png" alt="KCS Logo">
    </div>

    <div class="theme-toggle-container">
        <label for="theme" class="theme">
            <span class="theme__toggle-wrap">
                <input id="theme" class="theme__toggle" type="checkbox" role="switch" name="theme" value="dark">
                <span class="theme__fill"></span>
                <span class="theme__icon">
                    <span class="theme__icon-part"></span>
                    <span class="theme__icon-part"></span>
                    <span class="theme__icon-part"></span>
                    <span class="theme__icon-part"></span>
                    <span class="theme__icon-part"></span>
                    <span class="theme__icon-part"></span>
                    <span class="theme__icon-part"></span>
                    <span class="theme__icon-part"></span>
                    <span class="theme__icon-part"></span>
                </span>
            </span>
        </label>
    </div>
    <div class="ml-auto flex items-center gap-4" style="margin-left:auto; display:flex; align-items:center; gap:12px;">
        <div id="notif-bell" class="relative cursor-pointer" style="position:relative; cursor:pointer;">
            <i class="fas fa-bell" style="font-size:18px;"></i>
            <span id="notif-badge" style="display:none; position:absolute; top:-6px; right:-6px; background:#e11d48; color:#fff; border-radius:9999px; padding:0 6px; font-size:10px; line-height:16px; min-width:16px; text-align:center;"></span>
        </div>
        <div id="notif-dropdown" class="hidden" style="position:absolute; right:16px; top:56px; width:320px; background:#fff; border:1px solid #e5e7eb; box-shadow:0 10px 25px rgba(0,0,0,0.1); border-radius:8px; z-index:1000;">
            <div class="px-4 py-3 border-b border-gray-200" style="padding:12px 16px; border-bottom:1px solid #e5e7eb;">
                <span style="font-weight:600;">Notifications</span>
            </div>
            <div class="notif-items" style="max-height:360px; overflow:auto;"></div>
        </div>
    </div>
</div>
<script src="assets/notifications.js"></script>
</div>
