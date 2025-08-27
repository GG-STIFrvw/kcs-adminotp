document.addEventListener('DOMContentLoaded', () => {
    const bell = document.getElementById('notif-bell');
    const badge = document.getElementById('notif-badge');
    const dropdown = document.getElementById('notif-dropdown');

    if (!bell || !badge || !dropdown) return;

    async function fetchNotifications() {
        try {
            const res = await fetch('api_notifications_fetch.php', { credentials: 'same-origin' });
            if (!res.ok) return;
            const data = await res.json();
            updateUI(data);
        } catch (e) {
            // Silently ignore
        }
    }

    function updateUI(data) {
        const count = data.unread_count || 0;
        badge.textContent = count > 99 ? '99+' : String(count);
        badge.style.display = count > 0 ? 'inline-flex' : 'none';

        const list = data.notifications || [];
        const container = dropdown.querySelector('.notif-items');
        if (!container) return;
        container.innerHTML = '';
        if (list.length === 0) {
            const empty = document.createElement('div');
            empty.className = 'px-4 py-3 text-sm text-gray-500';
            empty.textContent = 'No notifications';
            container.appendChild(empty);
            return;
        }
        list.forEach(n => {
            const item = document.createElement('div');
            item.className = `px-4 py-3 text-sm ${n.status === 'unread' ? 'bg-gray-50 font-medium' : 'bg-white'}`;
            const date = new Date(n.created_at);
            const time = isNaN(date) ? '' : ` · ${date.toLocaleString()}`;
            item.textContent = `${n.message}${time}`;
            container.appendChild(item);
        });
    }

    async function markRead() {
        try {
            await fetch('api_notifications_mark_read.php', { method: 'POST', credentials: 'same-origin' });
            fetchNotifications();
        } catch (e) {}
    }

    bell.addEventListener('click', () => {
        dropdown.classList.toggle('hidden');
        if (!dropdown.classList.contains('hidden')) {
            markRead();
        }
    });

    document.addEventListener('click', (e) => {
        if (!dropdown.contains(e.target) && !bell.contains(e.target)) {
            dropdown.classList.add('hidden');
        }
    });

    fetchNotifications();
    setInterval(fetchNotifications, 15000);
});

