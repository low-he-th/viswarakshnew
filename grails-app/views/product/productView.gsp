<!DOCTYPE html>
<html lang="en">
<head>
    <g:include view="layouts/head.gsp"/>
</head>
<body class="bg-green-50 natural-bg">
<g:include view="layouts/topBar.gsp"/>
<g:include view="layouts/sidebar.gsp"/>
<!-- Product Detail Page -->
<div id="productDetailPage">
    <section class="py-16">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="mb-6">
                <button onclick="window.location.href='userproduct'" class="text-green-600 hover:text-green-800 font-medium">
                    ← Back to Products
                </button>
            </div>

            <div id="productDetailContent">
                <!-- Product detail content will be populated by JavaScript -->
            </div>
        </div>
    </section>
</div>

<g:include view="layouts/footer.gsp"/>
<%
    def userId = session.getAttribute('userId')

%>
<script>
    var userId = '${userId ?: ''}';
    var redirectUrl = userId ? 'payment' : 'login'

    $(document).ready(function () {
        getProducts();

        function getProducts() {
            $.ajax({
                url: "get/product/view",
                method: "POST",
                dataType: "json",
                data: {
                    productId: ${productId} // Make sure 'productId' is defined above
                },
                success: function (response) {
                    products.push(response);
                    viewProductDetail(response)
                },
                error: function () {
                    // handle error
                }
            });
        }
    });
    const products =[]
    let cart = [];
    function viewProductDetail(product) {
        if (!product) return;

        const productDetailContent = document.getElementById('productDetailContent');
        var html = '';

        html += '<div class="grid grid-cols-1 lg:grid-cols-2 gap-12">';
        html += '<div class="space-y-4">';
        html += '<div class="relative">';

        const imageSrc = product.image ? 'api/media/product_image/' + product.image : 'https://placehold.co/400';
        const imageAlt = product.name || 'Product image not available';

        html += '<img src="' + imageSrc + '" alt="' + imageAlt + '" class="w-full h-96 object-cover rounded-xl shadow-lg" loading="lazy" ';
        html += 'onerror="this.src=\'https://placehold.co/400\'; this.alt=\'Product image not available\';">';

        if (product.offer > 0) {
            html += '<div class="absolute top-4 right-4 bg-red-500 text-white px-3 py-2 rounded-full font-bold">' + product.offer + '% OFF</div>';
        }

        html += '</div>'; // close .relative
        html += '</div>'; // close left side column

        // Made this section scrollable with max height and overflow
        html += '<div class="space-y-6 <!--max-h-96 overflow-y-auto pr-2-->">';
        html += '<div>';
        html += '<h1 class="text-3xl font-bold text-gray-900 mb-2">' + (product.name || 'Not Available') + '</h1>';
        html += '<p class="text-gray-600 text-lg">' + (product.description || 'Not Available') + '</p>';
        html += '</div>';

        html += '<div class="flex items-center space-x-4">';
        if (product.offer > 0 && product.price) {
            var discountedPrice = Math.round(product.price * (1 - product.offer / 100));
            html += '<span class="text-3xl font-bold text-green-600">₹' + discountedPrice + '</span>';
            html += '<span class="text-xl text-gray-500 line-through">₹' + product.price + '</span>';
            html += '<span class="bg-red-100 text-red-800 px-2 py-1 rounded-full text-sm font-semibold">' + product.offer + '% OFF</span>';
        } else {
            html += '<span class="text-3xl font-bold text-green-600">₹' + (product.price || 'Not Available') + '</span>';
        }
        html += '</div>';

        html += '<div class="flex items-center space-x-4 text-sm text-gray-600">';
        html += '<span><strong>Weight:</strong> ' + (product.weight || 'Not Available') + '</span>';
        html += '<span><strong>Stock:</strong> ' + (product.stock || 'Not Available') + ' Available</span>';
        html += '</div>';

        html += '<div class="flex space-x-4">'
        html += '<button onclick="addToCart(' + (product.id || 0) + ');" class="flex-1 bg-green-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-green-700 transition duration-300">Add to Cart</button>'
        html += '<button onclick="addToCart(' + (product.id || 0) + '); window.location.href=\'' + (typeof redirectUrl !== 'undefined' ? redirectUrl : '#') + '\'" class="flex-1 bg-blue-600 text-white px-6 py-3 rounded-lg font-semibold hover:blue-700 transition duration-300">Buy Now</button>'
        html += '</div>'

        // ✅ Benefits Section
        html += '<div class="bg-white border rounded-xl p-6">';
        html += '<h5 class="font-semibold text-gray-900 mb-3">Description:</h5>';
        html += '<ul class="space-y-2">';
        html += '<li class="text-gray-700">' + (product.benefits || 'Not Available') + '</li>';
        html += '</ul>';
        html += '</div>';

        // ✅ Product Info
        html += '<div class="bg-white border rounded-xl p-6">';
        html += '<h5 class="font-semibold text-gray-900 mb-3">Product Information:</h5>';
        html += '<div class="space-y-2 text-sm">';
        html += '<p><strong>Manufacturing Date:</strong> ' + (product.mfgDate ? product.mfgDate.split(' ')[0] : 'Not Available') + '</p>';
        html += '<p><strong>Expiry:</strong> ' + (product.expiry ? product.expiry.split(' ')[0] : 'Not Available') + '</p>';
        html += '<p><strong>MRP:</strong> ₹' + (product.price || 'Not Available') + '.00</p>';
        html += '</div>';
        html += '</div>';

        // ✅ Ingredients
        html += '<div class="bg-white border rounded-xl p-6">';
        html += '<h5 class="font-semibold text-blue-900 mb-3">Ingredients:</h5>';
        html += '<p class="text-blue-800 text-sm">' + (product.ingredients || 'Not Available') + '</p>';
        html += '</div>';

        html += '</div>'; // close right column (now scrollable)
        html += '</div>'; // close grid

        productDetailContent.innerHTML = html;
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
                html += '<img src="api/media/product_image/' + item.image + '" alt="' + item.name + '" class="w-16 h-16 object-cover rounded-lg" loading="lazy" onerror="this.src=\'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjRjNGNEY2Ii8+CjxwYXRoIGQ9Ik0zMiAzMkMzNS4zMTM3IDMyIDM4IDM1LjMxMzcgMzggMzhDMzggNDAuNjg2MyAzNS4zMTM3IDQzIDMyIDQzQzI4LjY4NjMgNDMgMjYgNDAuNjg2MyAyNiAzOEMyNiAzNS4zMTM3IDI4LjY4NjMgMzIgMzIgMzJaIiBmaWxsPSIjOUNBM0FGIi8+Cjwvc3ZnPgo=\'; this.alt=\'Product image not available\';">';
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