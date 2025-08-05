<!-- Header -->
<header class="bg-white shadow-lg sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
            <div class="flex items-center cursor-pointer" onclick="showPage('home')">
                <div class="text-2xl mr-2">🌿</div>
                <div>
                    <h1 class="text-xl font-bold text-green-800">VISHWARAKSHA</h1>
                    <p class="text-xs text-green-600">Naturally Nourishing Your Health</p>
                </div>
            </div>
            <nav class="hidden md:flex space-x-6">
                <a href="#" onclick="showPage('home')" class="text-gray-700 hover:text-green-600 font-medium">Home</a>
                <a href="#" onclick="showPage('products')" class="text-gray-700 hover:text-green-600 font-medium">Products</a>
                <a href="#" onclick="showPage('about')" class="text-gray-700 hover:text-green-600 font-medium">About</a>
                <a href="#" onclick="showPage('contact')"
                   class="text-gray-700 hover:text-green-600 font-medium">Contact</a>
                <a href="#" onclick="showPage('admin')" class="text-gray-700 hover:text-green-600 font-medium">Admin</a>
            </nav>
            <div class="flex items-center space-x-4">
                <button onclick="showPage('login')"
                        class="hidden sm:block text-green-600 hover:text-green-800 font-medium">Login
                </button>
                <button onclick="toggleCart()" class="relative p-2 text-gray-700 hover:text-green-600">
                    🛒
                    <span id="cartCount"
                          class="absolute -top-1 -right-1 bg-red-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center cart-badge">0</span>
                </button>
                <button onclick="toggleMobileMenu()" class="md:hidden p-2 text-gray-700 hover:text-green-600">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M4 6h16M4 12h16M4 18h16"></path>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div id="mobileMenu" class="md:hidden hidden bg-white border-t border-gray-200">
            <div class="px-4 py-2 space-y-1">
                <a href="#" onclick="showPage('home'); toggleMobileMenu()"
                   class="block px-3 py-2 text-gray-700 hover:text-green-600 hover:bg-green-50 rounded-md font-medium">Home</a>
                <a href="#" onclick="showPage('products'); toggleMobileMenu()"
                   class="block px-3 py-2 text-gray-700 hover:text-green-600 hover:bg-green-50 rounded-md font-medium">Products</a>
                <a href="#" onclick="showPage('about'); toggleMobileMenu()"
                   class="block px-3 py-2 text-gray-700 hover:text-green-600 hover:bg-green-50 rounded-md font-medium">About</a>
                <a href="#" onclick="showPage('contact'); toggleMobileMenu()"
                   class="block px-3 py-2 text-gray-700 hover:text-green-600 hover:bg-green-50 rounded-md font-medium">Contact</a>
                <a href="#" onclick="showPage('admin'); toggleMobileMenu()"
                   class="block px-3 py-2 text-gray-700 hover:text-green-600 hover:bg-green-50 rounded-md font-medium">Admin</a>
                <a href="#" onclick="showPage('login'); toggleMobileMenu()"
                   class="block px-3 py-2 text-green-600 hover:text-green-800 hover:bg-green-50 rounded-md font-medium sm:hidden">Login</a>
            </div>
        </div>
    </div>
</header>
