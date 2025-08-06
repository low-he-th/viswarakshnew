<!DOCTYPE html>
<html lang="en">
<head>
    <g:include view="layouts/head.gsp"/>
</head>
<body class="bg-green-50 natural-bg">
<g:include view="layouts/topBar.gsp"/>
<g:include view="layouts/sidebar.gsp"/>

<!-- About Page -->
<div id="aboutPage">
    <section class="py-16">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-12">
                <div class="text-6xl mb-6">🌿</div>
                <h2 class="text-4xl font-bold text-gray-900 mb-4">About VISHWARAKSHA</h2>
                <p class="text-xl text-gray-600">Naturally Nourishing Your Health Since 2023</p>
            </div>


            <div class="bg-white rounded-xl shadow-lg p-8 mb-8">
                <h3 class="text-2xl font-bold text-green-800 mb-4">Our Story</h3>
                <p class="text-gray-700 mb-4">
                    VISHWARAKSHA was born from a deep commitment to bringing the ancient wisdom of Ayurveda to modern
                    hair care.
                    We believe that nature provides the best solutions for healthy, beautiful hair, and our products are
                    crafted
                    with this philosophy at heart.
                </p>
                <p class="text-gray-700 mb-4">
                    Our journey began with the simple belief that chemical-free, natural products should be accessible
                    to everyone.
                    Using traditional recipes passed down through generations, we create herbal formulations that
                    nourish your hair
                    from root to tip.
                </p>
                <div class="flex items-center space-x-4">
                    <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center">
                        <div class="text-2xl">🏆</div>
                    </div>
                    <div>
                        <h4 class="font-semibold text-gray-900">Quality Assured</h4>
                        <p class="text-gray-600 text-sm">100% Natural & Chemical Free</p>
                    </div>
                </div>
                <div class="relative mt-2">
                    <img src="api/media/about_company_photo.jpeg"
                         onerror="this.onerror=null; this.src='https://placehold.co/400';"
                         alt="Natural herbs"
                         class="w-full h-80 object-cover rounded-xl shadow-lg">

                    <div class="absolute inset-0 bg-gradient-to-t from-green-900/20 to-transparent rounded-xl"></div>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">
                <div class="bg-white rounded-xl shadow-lg p-6">
                    <div class="text-3xl mb-4">🌱</div>
                    <h4 class="text-xl font-bold text-gray-900 mb-3">Our Mission</h4>
                    <p class="text-gray-700">
                        To provide 100% natural, chemical-free hair care solutions that promote healthy hair growth
                        while preserving traditional Ayurvedic wisdom for future generations.
                    </p>
                </div>
                <div class="bg-white rounded-xl shadow-lg p-6">
                    <div class="text-3xl mb-4">👁️</div>
                    <h4 class="text-xl font-bold text-gray-900 mb-3">Our Vision</h4>
                    <p class="text-gray-700">
                        To become the most trusted brand for natural hair care products, helping people embrace
                        their natural beauty through the power of herbs and traditional remedies.
                    </p>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-lg p-8 mb-8">
                <h3 class="text-2xl font-bold text-green-800 mb-4">Why Choose Natural?</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <h5 class="font-semibold text-gray-900 mb-2">✅ Chemical-Free Formula</h5>
                        <p class="text-gray-700 text-sm">No harsh chemicals, sulfates, or artificial additives</p>
                    </div>
                    <div>
                        <h5 class="font-semibold text-gray-900 mb-2">✅ Traditional Wisdom</h5>
                        <p class="text-gray-700 text-sm">Based on time-tested Ayurvedic formulations</p>
                    </div>
                    <div>
                        <h5 class="font-semibold text-gray-900 mb-2">✅ Sustainable Practices</h5>
                        <p class="text-gray-700 text-sm">Eco-friendly production and packaging</p>
                    </div>
                    <div>
                        <h5 class="font-semibold text-gray-900 mb-2">✅ Safe for All</h5>
                        <p class="text-gray-700 text-sm">Suitable for all hair types and ages</p>
                    </div>
                </div>
            </div>
            <div class="bg-white rounded-xl shadow-lg p-8 mb-8">
                <div class="relative grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Image Section -->
                    <div class="relative">
                        <h4 class="text-xl font-bold text-gray-900 mb-3 text-center">📷 Herbal Ingredients</h4>
                    <img src="api/media/about_herbal_Ingredients_photo.jpeg"
                         onerror="this.onerror=null; this.src='https://placehold.co/400';"
                         alt="Natural herbs"
                         class="w-full h-80 object-cover rounded-xl shadow-lg">


                        <div class="absolute inset-0 bg-gradient-to-t from-green-900/20 to-transparent rounded-xl"></div>
                    </div>

                    <!-- Video Section -->
                    <div class="relative">
                        <h4 class="text-xl font-bold text-gray-900 mb-3 text-center">🎥 Our Process</h4>

                                        <video controls class="w-full h-80 object-cover rounded-xl shadow-lg">
                                           <source src="api/media/about_our_process_video.mp4" type="video/mp4">

                    </video>
                        <div class="absolute inset-0 bg-gradient-to-t from-green-900/20 to-transparent rounded-xl pointer-events-none"></div>
                    </div>
                </div>
            </div>
            <div class="bg-white rounded-xl shadow-lg p-8 mb-8">

                <div class="bg-green-50 rounded-xl p-8 text-center">
                    <h3 class="text-2xl font-bold text-green-800 mb-4">Quality Assurance</h3>
                    <p class="text-gray-700 mb-4">
                        Every VISHWARAKSHA product undergoes rigorous quality testing to ensure purity,
                        effectiveness, and safety. We source our herbs from trusted suppliers and maintain
                        the highest standards in manufacturing.
                    </p>
                    <div class="flex justify-center space-x-8 text-sm text-gray-600">
                        <div>🧪 Lab Tested</div>
                        <div>🌿 Pure Herbs</div>
                        <div>✅ Quality Certified</div>
                        <div>🏭 Hygienic Production</div>
                    </div>
                </div>
            </div>

        </div>
    </section>
</div>

<g:include view="layouts/footer.gsp"/>

<script>

</script>
</body>
</html>