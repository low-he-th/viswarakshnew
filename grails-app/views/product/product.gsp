<!DOCTYPE html>
<html lang="en">
<head>
    <g:include view="layouts/head.gsp"/>
</head>
<body class="bg-green-50 natural-bg">
<g:include view="layouts/topBar.gsp"/>
<g:include view="layouts/sidebar.gsp"/>
<!-- Products Page -->
<div id="productsPage" class="page">
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

</script>
</body>
</html>