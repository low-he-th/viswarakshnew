<!DOCTYPE html>
<html lang="en">
<head>
    <g:include view="layouts/head.gsp"/>
</head>
<body class="bg-green-50 natural-bg">
<g:include view="layouts/topBar.gsp"/>
<g:include view="layouts/sidebar.gsp"/>
<!-- Home Page -->
<div id="homePage" class="page active">
    <!-- Hero Section -->
    <section class="herbal-gradient text-white py-20">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <div class="text-6xl mb-6">🌿</div>
            <h2 class="text-5xl font-bold mb-4">VISHWARAKSHA</h2>
            <p class="text-2xl mb-8 text-green-100">~ NATURALLY NOURISHING YOUR HEALTH ~</p>
            <p class="text-xl mb-8 max-w-3xl mx-auto">Experience the power of nature with our 100% pure, natural &
            chemical-free herbal products</p>
            <button onclick="showPage('products')"
                    class="bg-white text-green-700 px-8 py-3 rounded-lg font-semibold hover:bg-green-50 transition duration-300">
                Shop Natural Products
            </button>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-20 bg-gradient-to-br from-green-50 via-white to-green-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-16">
                <div class="inline-block p-3 bg-green-100 rounded-full mb-4">
                    <div class="text-4xl">🌿</div>
                </div>
                <h3 class="text-4xl font-bold mb-4 text-gray-900">Why Choose VISHWARAKSHA?</h3>
                <div class="w-24 h-1 bg-gradient-to-r from-green-400 to-green-600 mx-auto rounded-full"></div>
                <p class="text-xl text-gray-600 mt-4 max-w-2xl mx-auto">Experience the power of nature with our premium
                herbal products</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="group relative bg-white rounded-2xl p-8 shadow-lg border-2 border-green-100 hover:border-green-300 hover:shadow-2xl transform hover:-translate-y-2 transition-all duration-300 cursor-pointer overflow-hidden">
                    <!-- Decorative background pattern -->
                    <div class="absolute top-0 right-0 w-20 h-20 bg-gradient-to-br from-green-100 to-green-200 rounded-full -mr-10 -mt-10 opacity-50 group-hover:opacity-70 transition-opacity duration-300"></div>
                    <div class="absolute bottom-0 left-0 w-16 h-16 bg-gradient-to-tr from-green-50 to-green-100 rounded-full -ml-8 -mb-8 opacity-30 group-hover:opacity-50 transition-opacity duration-300"></div>

                    <div class="relative z-10 text-center">
                        <div class="inline-block p-4 bg-gradient-to-br from-green-100 to-green-200 rounded-full mb-6 group-hover:scale-110 transition-transform duration-300">
                            <div class="text-5xl">🌿</div>
                        </div>
                        <h4 class="text-2xl font-bold mb-4 text-gray-900 group-hover:text-green-700 transition-colors duration-300">
                            100% Natural</h4>
                        <div class="w-12 h-0.5 bg-green-400 mx-auto mb-4 group-hover:w-16 transition-all duration-300"></div>
                        <p class="text-gray-600 leading-relaxed group-hover:text-gray-700 transition-colors duration-300">
                            Pure herbal ingredients with no chemicals or artificial additives for your natural
                            wellness</p>


                    </div>
                </div>

                <div class="group relative bg-white rounded-2xl p-8 shadow-lg border-2 border-blue-100 hover:border-blue-300 hover:shadow-2xl transform hover:-translate-y-2 transition-all duration-300 cursor-pointer overflow-hidden">
                    <!-- Decorative background pattern -->
                    <div class="absolute top-0 right-0 w-20 h-20 bg-gradient-to-br from-blue-100 to-blue-200 rounded-full -mr-10 -mt-10 opacity-50 group-hover:opacity-70 transition-opacity duration-300"></div>
                    <div class="absolute bottom-0 left-0 w-16 h-16 bg-gradient-to-tr from-blue-50 to-blue-100 rounded-full -ml-8 -mb-8 opacity-30 group-hover:opacity-50 transition-opacity duration-300"></div>

                    <div class="relative z-10 text-center">
                        <div class="inline-block p-4 bg-gradient-to-br from-blue-100 to-blue-200 rounded-full mb-6 group-hover:scale-110 transition-transform duration-300">
                            <div class="text-5xl">🧪</div>
                        </div>
                        <h4 class="text-2xl font-bold mb-4 text-gray-900 group-hover:text-blue-700 transition-colors duration-300">
                            Chemical Free</h4>
                        <div class="w-12 h-0.5 bg-blue-400 mx-auto mb-4 group-hover:w-16 transition-all duration-300"></div>
                        <p class="text-gray-600 leading-relaxed group-hover:text-gray-700 transition-colors duration-300">
                            Safe for all hair types with traditional herbal formulations tested by generations</p>


                    </div>
                </div>

                <div class="group relative bg-white rounded-2xl p-8 shadow-lg border-2 border-purple-100 hover:border-purple-300 hover:shadow-2xl transform hover:-translate-y-2 transition-all duration-300 cursor-pointer overflow-hidden">
                    <!-- Decorative background pattern -->
                    <div class="absolute top-0 right-0 w-20 h-20 bg-gradient-to-br from-purple-100 to-purple-200 rounded-full -mr-10 -mt-10 opacity-50 group-hover:opacity-70 transition-opacity duration-300"></div>
                    <div class="absolute bottom-0 left-0 w-16 h-16 bg-gradient-to-tr from-purple-50 to-purple-100 rounded-full -ml-8 -mb-8 opacity-30 group-hover:opacity-50 transition-opacity duration-300"></div>

                    <div class="relative z-10 text-center">
                        <div class="inline-block p-4 bg-gradient-to-br from-purple-100 to-purple-200 rounded-full mb-6 group-hover:scale-110 transition-transform duration-300">
                            <div class="text-5xl">♻️</div>
                        </div>
                        <h4 class="text-2xl font-bold mb-4 text-gray-900 group-hover:text-purple-700 transition-colors duration-300">
                            Eco Friendly</h4>
                        <div class="w-12 h-0.5 bg-purple-400 mx-auto mb-4 group-hover:w-16 transition-all duration-300"></div>
                        <p class="text-gray-600 leading-relaxed group-hover:text-gray-700 transition-colors duration-300">
                            Sustainable packaging and environmentally conscious production for a better tomorrow</p>


                    </div>
                </div>
            </div>

            <!-- Additional trust indicators -->
            <div class="mt-16 text-center">
                <!-- Desktop version -->
                <div class="hidden sm:inline-flex items-center space-x-8 bg-white rounded-full px-8 py-4 shadow-lg border border-gray-100">
                    <div class="flex items-center space-x-2 text-green-600">
                        <div class="text-2xl">✅</div>
                        <span class="font-medium">Lab Tested</span>
                    </div>
                    <div class="w-px h-6 bg-gray-200"></div>
                    <div class="flex items-center space-x-2 text-blue-600">
                        <div class="text-2xl">🏆</div>
                        <span class="font-medium">Quality Assured</span>
                    </div>
                    <div class="w-px h-6 bg-gray-200"></div>
                    <div class="flex items-center space-x-2 text-purple-600">
                        <div class="text-2xl">🌿</div>
                        <span class="font-medium">Ayurvedic</span>
                    </div>
                </div>

                <!-- Mobile version -->
                <div class="sm:hidden space-y-4">
                    <div class="flex items-center justify-center space-x-2 bg-white rounded-full px-6 py-3 shadow-lg border border-gray-100 text-green-600">
                        <div class="text-2xl">✅</div>
                        <span class="font-medium">Lab Tested</span>
                    </div>
                    <div class="flex items-center justify-center space-x-2 bg-white rounded-full px-6 py-3 shadow-lg border border-gray-100 text-blue-600">
                        <div class="text-2xl">🏆</div>
                        <span class="font-medium">Quality Assured</span>
                    </div>
                    <div class="flex items-center justify-center space-x-2 bg-white rounded-full px-6 py-3 shadow-lg border border-gray-100 text-purple-600">
                        <div class="text-2xl">🌿</div>
                        <span class="font-medium">Ayurvedic</span>
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