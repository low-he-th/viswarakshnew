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
                <button onclick="window.location.href='userproduct'" class="text-green-600 hover:text-green-800 font-medium">← Back to
                Products
                </button>
            </div>

            <div id="productDetailContent">
                <!-- Product detail content will be populated by JavaScript -->
            </div>
        </div>
    </section>
</div>

<g:include view="layouts/footer.gsp"/>
<script>
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
                    viewProductDetail(response)
                },
                error: function () {
                    // handle error
                }
            });
        }
    });

    function viewProductDetail(product) {
        if (!product) return;

        const productDetailContent = document.getElementById('productDetailContent');
        var html = '';

        html += '<div class="grid grid-cols-1 lg:grid-cols-2 gap-12">';
        html += '<div class="space-y-4">';
        html += '<div class="relative">';
        html += '<img src="' + product.image + '" alt="' + product.name + '" class="w-full h-96 object-cover rounded-xl shadow-lg" ';
        html += 'onerror="this.src=\'https://placehold.co/400\'; this.alt=\'Product image not available\';">';

        if (product.offer > 0) {
            html += '<div class="absolute top-4 right-4 bg-red-500 text-white px-3 py-2 rounded-full font-bold">' + product.offer + '% OFF</div>';
        }

        html += '</div>'; // close .relative
        html += '</div>'; // close left side column

        html += '<div class="space-y-6">';
        html += '<div>';
        html += '<h1 class="text-3xl font-bold text-gray-900 mb-2">' + product.name + '</h1>';
        html += '<p class="text-gray-600 text-lg">' + product.description + '</p>';
        html += '</div>';

        html += '<div class="flex items-center space-x-4">';
        if (product.offer > 0) {
            var discountedPrice = Math.round(product.price * (1 - product.offer / 100));
            html += '<span class="text-3xl font-bold text-green-600">₹' + discountedPrice + '</span>';
            html += '<span class="text-xl text-gray-500 line-through">₹' + product.price + '</span>';
            html += '<span class="bg-red-100 text-red-800 px-2 py-1 rounded-full text-sm font-semibold">' + product.offer + '% OFF</span>';
        } else {
            html += '<span class="text-3xl font-bold text-green-600">₹' + product.price + '</span>';
        }
        html += '</div>';

        html += '<div class="flex items-center space-x-4 text-sm text-gray-600">';
        html += '<span><strong>Weight:</strong> ' + product.weight + '</span>';
        html += '<span><strong>Stock:</strong> ' + product.stock + ' available</span>';
        html += '</div>';

        html += '<div class="flex space-x-4">';
        html += '<button onclick="addToCart(' + product.id + '); showPage(\'products\')" class="flex-1 bg-green-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-green-700 transition duration-300">Add to Cart</button>';
        html += '<button onclick="addToCart(' + product.id + '); proceedToPayment()" class="flex-1 bg-blue-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-blue-700 transition duration-300">Buy Now</button>';
        html += '</div>';

        // ✅ Benefits Section (Fixed to parse JSON string)
        html += '<div class="bg-white border rounded-xl p-6">';
        html += '<h5 class="font-semibold text-gray-900 mb-3">Key Benefits:</h5>';
        html += '<ul class="space-y-2">';
        try {
            const benefitsArray = JSON.parse(product.benefits);
            if (Array.isArray(benefitsArray)) {
                benefitsArray.forEach(benefit => {
                    if (benefit.trim()) {
                        html += '<li class="flex items-start space-x-2">';
                        html += '<span class="text-green-600 mt-1">•</span>';
                        html += '<span class="text-gray-700">' + benefit.trim() + '</span>';
                        html += '</li>';
                    }
                });
            } else {
                html += '<li class="text-gray-500">No benefits available.</li>';
            }
        } catch (e) {
            console.error("Error parsing benefits:", e);
            html += '<li class="text-gray-500">Error loading benefits.</li>';
        }
        html += '</ul>';
        html += '</div>';

        // ✅ Product Info
        html += '<div class="bg-gray-50 rounded-xl p-6">';
        html += '<h5 class="font-semibold text-gray-900 mb-3">Product Information:</h5>';
        html += '<div class="space-y-2 text-sm">';
        html += '<p><strong>Manufacturing Date:</strong> ' + product.mfgDate.split(' ')[0] + '</p>';
        html += '<p><strong>Expiry:</strong> ' + product.expiry.split(' ')[0] + '</p>';

        html += '<p><strong>MRP:</strong> ₹' + product.price + '.00</p>';
        html += '</div>';
        html += '</div>';

        // ✅ Ingredients
        html += '<div class="bg-blue-50 rounded-xl p-6">';
        html += '<h5 class="font-semibold text-blue-900 mb-3">Ingredients:</h5>';
        html += '<p class="text-blue-800 text-sm">' + product.ingredients + '</p>';
        html += '</div>';

        html += '</div>'; // close right column
        html += '</div>'; // close grid

        productDetailContent.innerHTML = html;
        // showPage('productDetail');
    }



</script>
</body>
</html>