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
    $(document).ready(function () {
        getProducts()
        function getProducts() {


            $.ajax({
                url: "get/userproduct",
                method: "POST",
                dataType: "json",
                success: function (response) {
                    renderProducts(response)

                    renderPagination()

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
    // Show page function
    function showPage(pageName) {
        // Hide all pages
        document.querySelectorAll('.page').forEach(page => {
            page.classList.remove('active');
        });

        // Show selected page
        document.getElementById(pageName + 'Page').classList.add('active');
        currentPage = pageName;

        if (pageName === 'products') {
            renderProducts();
        } else if (pageName === 'admin') {
            initializeAdmin();
        }
    }

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
            html += '<img src="' + product.image + '" alt="' + product.name + '" class="product-image" onerror="this.onerror=null; this.src=\'https://placehold.co/400\'; this.alt=\'Product image not available\';">';
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

</script>
</body>
</html>