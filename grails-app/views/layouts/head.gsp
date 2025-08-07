<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="${assetPath(src: "favicon.png")}" type="image/png"/>
<title>VISHWARAKSHA - Naturally Nourishing Your Health</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

body {
    font-family: 'Poppins', sans-serif;
}

.herbal-gradient {
    background: linear-gradient(135deg, #2d5016 0%, #4a7c59 50%, #6b8e23 100%);
}

.product-card:hover {
    transform: translateY(-4px);
    transition: all 0.3s ease;
}

.cart-badge {
    animation: bounce 0.3s ease-in-out;
}

@keyframes bounce {
    0%, 100% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.1);
    }
}

.page {
    display: none;
}

.page.active {
    display: block;
}

.natural-bg {
    background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="leaf" patternUnits="userSpaceOnUse" width="20" height="20"><path d="M10 2C6 6 6 14 10 18C14 14 14 6 10 2Z" fill="%23f0f9ff" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23leaf)"/></svg>');
}

.admin-tab.active {
    color: #059669;
    border-bottom-color: #059669;
}

.admin-content {
    display: none;
}

.admin-content.active {
    display: block;
}
</style>

