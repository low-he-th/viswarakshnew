<!DOCTYPE html>
<html lang="en">
<head>
    <g:include view="layouts/head.gsp"/>
</head>
<body class="bg-green-50 natural-bg">
<g:include view="layouts/topBar.gsp"/>
<g:include view="layouts/sidebar.gsp"/>
<!-- Products Page -->
<div id="productsPage">
    <section class="py-16">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <h3 class="text-3xl font-bold text-center mb-12 text-gray-900">Our Natural Products</h3>

            <!-- Products Grid -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 mb-8" id="productGrid">
                <!-- Products will be populated by JavaScript -->
            </div>

            <!-- Pagination -->
            <div class="flex justify-center items-center space-x-2" id="pagination">
                <!-- Pagination will be populated by JavaScript -->
            </div>
        </div>
    </section>
</div>

<g:include view="layouts/footer.gsp"/>

<script>
    let cart = [];
    $(document).ready(function () {
        getProducts()
        function getProducts() {


            $.ajax({
                url: "get/userproduct",
                method: "POST",
                dataType: "json",
                success: function (response) {
                    if (Array.isArray(response) && response.length === 0) {
                        var html = '<p>No Product available</p>';
                        $('#productGrid').html(html); // Replace with your actual container ID
                    } else {
                        renderProducts(response);
                        renderPagination();
                    }

                },
                error: function () {

                }
            });

        }

    });

    let currentPage = 'home';
    let currentProductPage = 1;
    const productsPerPage = 8;
    let totalPages = 0

    const products =[]

    // Render products with pagination
    function renderProducts(products) {
        const startIndex = (currentProductPage - 1) * productsPerPage;
        const endIndex = startIndex + productsPerPage;
        const currentProducts = products.slice(startIndex, endIndex);
        totalPages=Math.ceil(products.length / productsPerPage);
        const productGrid = document.getElementById('productGrid');
        productGrid.innerHTML = currentProducts.map(function(product) {
            var html = '<div class="product-card bg-white rounded-xl shadow-lg overflow-hidden hover:shadow-xl transition-all duration-300">';
            html += '<div class="relative">';
            html += '<img src="api/media/product_image/' + product.image + '" alt="' + product.name + '" class="product-image" onerror="this.onerror=null; this.src=\'https://placehold.co/400\'; this.alt=\'Product image not available\';">';
            if (product.offer > 0) {
                html += '<div class="absolute top-2 right-2 bg-red-500 text-white px-2 py-1 rounded-full text-xs font-bold">' + product.offer + '% OFF</div>';
            }
            html += '</div>';

            html += '<div class="p-4">';
            html += '<h4 class="text-lg font-bold mb-2 text-gray-900">' + product.name + '</h4>';
            html += '<p class="text-gray-600 text-sm mb-3">' + product.description.substring(0, 80) + '...</p>';

            html += '<div class="flex justify-between items-center mb-3">';
            html += '<div class="flex items-center space-x-2">';
            if (product.offer > 0) {
                var discountedPrice = Math.round(product.price * (1 - product.offer / 100));
                html += '<span class="text-lg font-bold text-green-600">₹' + discountedPrice + '</span>';
                html += '<span class="text-sm text-gray-500 line-through">₹' + product.price + '</span>';
            } else {
                html += '<span class="text-lg font-bold text-green-600">₹' + product.price + '</span>';
            }
            html += '</div>';
            html += '<span class="text-xs text-gray-500">' + product.weight + '</span>';
            html += '</div>';

            html += '<div class="flex space-x-2">';
            html += '<button onclick="window.location.href=\'productview?id=' + product.id + '\'" ' +
                'class="flex-1 bg-gray-100 text-gray-700 px-3 py-2 rounded-lg text-sm hover:bg-gray-200 transition duration-300">' +
                'View Details</button>';

            html += '<button onclick="addToCart(' + product.id + ')" class="flex-1 bg-green-600 text-white px-3 py-2 rounded-lg text-sm hover:bg-green-700 transition duration-300">Add to Cart</button>';
            html += '</div>';

            html += '</div>';
            html += '</div>';
            return html;
        }).join('');

        renderPagination();
    }


    function renderPagination() {
        const pagination = document.getElementById('pagination');
        let paginationHTML = '';

        if (currentProductPage > 1) {
            paginationHTML += '<button onclick="changePage(' + (currentProductPage - 1) + ')" class="pagination-btn px-3 py-2 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition duration-300">Previous</button>';
        }

        for (let i = 1; i <= totalPages; i++) {
            if (i === currentProductPage) {
                paginationHTML += '<button class="px-3 py-2 bg-green-600 text-white rounded-lg">' + i + '</button>';
            } else if (i === 1 || i === totalPages || (i >= currentProductPage - 1 && i <= currentProductPage + 1)) {
                paginationHTML += '<button onclick="changePage(' + i + ')" class="pagination-btn px-3 py-2 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition duration-300">' + i + '</button>';
            } else if (i === currentProductPage - 2 || i === currentProductPage + 2) {
                paginationHTML += '<span class="px-3 py-2">...</span>';
            }
        }

        if (currentProductPage < totalPages) {
            paginationHTML += '<button onclick="changePage(' + (currentProductPage + 1) + ')" class="pagination-btn px-3 py-2 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition duration-300">Next</button>';
        }

        pagination.innerHTML = paginationHTML;
    }

    // Add to cart
    function addToCart(productId) {
        const product = products.find(p => p.id === productId);
        const existingItem = cart.find(item => item.id === productId);

        if (existingItem) {
            existingItem.quantity += 1;
        } else {
            cart.push({...product, quantity: 1});
        }

        updateCartUI();
        showCartNotification();
    }


    // Update cart UI
    function updateCartUI() {
        const cartCount = document.getElementById('cartCount');
        const cartItems = document.getElementById('cartItems');
        const cartTotal = document.getElementById('cartTotal');

        const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
        const totalPrice = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);

        cartCount.textContent = totalItems;
        cartTotal.textContent = '₹' + totalPrice.toFixed(2);

        if (cart.length === 0) {
            cartItems.innerHTML = '<p class="text-gray-500 text-center">Your cart is empty</p>';
        } else {
            var html = '';
            cart.forEach(function(item) {
                html += '<div class="flex items-center justify-between py-4 border-b">';
                html += '<div class="flex items-center space-x-3">';
                html += '<img src="' + item.image + '" alt="' + item.name + '" class="w-16 h-16 object-cover rounded-lg" onerror="this.src=\'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjRjNGNEY2Ii8+CjxwYXRoIGQ9Ik0zMiAzMkMzNS4zMTM3IDMyIDM4IDM1LjMxMzcgMzggMzhDMzggNDAuNjg2MyAzNS4zMTM3IDQzIDMyIDQzQzI4LjY4NjMgNDMgMjYgNDAuNjg2MyAyNiAzOEMyNiAzNS4zMTM3IDI4LjY4NjMgMzIgMzIgMzJaIiBmaWxsPSIjOUNBM0FGIi8+Cjwvc3ZnPgo=\'; this.alt=\'Product image not available\';">';
                html += '<div>';
                html += '<h5 class="font-medium">' + item.name + '</h5>';
                html += '<p class="text-sm text-gray-600">₹' + item.price + ' (' + item.weight + ')</p>';
                html += '</div>';
                html += '</div>';
                html += '<div class="flex items-center space-x-2">';
                html += '<button onclick="updateQuantity(' + item.id + ', -1)" class="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center hover:bg-gray-300">-</button>';
                html += '<span class="w-8 text-center">' + item.quantity + '</span>';
                html += '<button onclick="updateQuantity(' + item.id + ', 1)" class="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center hover:bg-gray-300">+</button>';
                html += '<button onclick="removeFromCart(' + item.id + ')" class="ml-2 text-red-500 hover:text-red-700">🗑️</button>';
                html += '</div>';
                html += '</div>';
            });
            cartItems.innerHTML = html;
        }
    }

    // Show cart notification
    function showCartNotification() {
        const cartCount = document.getElementById('cartCount');
        cartCount.classList.add('cart-badge');
        setTimeout(() => {
            cartCount.classList.remove('cart-badge');
        }, 300);
    }


    // Remove from cart
    function removeFromCart(productId) {
        cart = cart.filter(item => item.id !== productId);
        updateCartUI();
    }

    // Update quantity
    function updateQuantity(productId, change) {
        const item = cart.find(item => item.id === productId);
        if (item) {
            item.quantity += change;
            if (item.quantity <= 0) {
                removeFromCart(productId);
            } else {
                updateCartUI();
            }
        }
    }
</script>
</body>
</html>