<!-- Header -->
<header class="bg-white shadow-lg sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
            <div class="flex items-center cursor-pointer" href="/">
                <div class="text-2xl mr-2">🌿</div>
                <div>
                    <h1 class="text-xl font-bold text-green-800">VISHWARAKSHA</h1>
                    <p class="text-xs text-green-600">Naturally Nourishing Your Health</p>
                </div>
            </div>
            <nav class="hidden md:flex space-x-6">
                <a href="/" class="text-gray-700 hover:text-green-600 font-medium">Home</a>
                <a href="userproduct" class="text-gray-700 hover:text-green-600 font-medium">Products</a>
                <a href="about" class="text-gray-700 hover:text-green-600 font-medium">About</a>
                <a href="contact"
                   class="text-gray-700 hover:text-green-600 font-medium">Contact</a>
                <a href="admin" class="text-gray-700 hover:text-green-600 font-medium">Admin</a>
            </nav>

            <div class="flex items-center space-x-4">
                <%
                    def userId = session.getAttribute('userId')
                    def name = session.getAttribute('name') ?: 'User'
                    def mobile = session.getAttribute('mobile') ?: 'NA'
                    def email = session.getAttribute('email') ?: 'NA'
                    def dateCreated = session.getAttribute('dateCreated') ?: 'NA'
                    def address = session.getAttribute('address') ?: 'NA'
                %>

                <g:if test="${userId}">
                    <div class="relative inline-block text-left">
                        <!-- Trigger -->
                        <button onclick="toggleDropdown()" id="userDropdownButton"
                                class="hidden sm:block text-green-600 hover:text-green-800 font-medium focus:outline-none">
                            ${name} ▼
                        </button>

                        <!-- Dropdown menu -->
                        <div id="userDropdownMenu"
                             class="hidden ">

                            <div id="profile-dropdown"
                                 class="absolute right-0 mt-6 w-96 bg-white rounded-2xl shadow-2xl border border-gray-100 transform transition-all duration-200 z-50 opacity-100 visible scale-100">

                                <!-- Profile Header -->
                                <div class="p-6 bg-gradient-to-r from-green-50 to-blue-50 rounded-t-2xl border-b border-gray-100">
                                    <div class="flex items-center space-x-4">
                                        <div class="relative">
                                            <div class="w-20 h-20 bg-gradient-to-r from-green-500 to-blue-500 rounded-full flex items-center justify-center shadow-lg">
                                                <span class="text-3xl font-bold text-white">
                                                    ${name[0]?.toUpperCase() ?: 'U'}
                                                </span>

                                            </div>

                                            <div class="absolute -bottom-1 -right-1 w-6 h-6 bg-green-500 rounded-full border-2 border-white flex items-center justify-center">
                                                <div class="w-2 h-2 bg-white rounded-full"></div>
                                            </div>
                                        </div>

                                        <div class="flex-1">
                                            <%
                                                int maxChars = 15
                                                String displayName = name?.length() > maxChars ? name.substring(0, maxChars) + "..." : name
                                                int maxCharss = 45
                                                String displayEmail = email?.length() > maxCharss ? email.substring(0, maxCharss) + "..." : email

                                                String displayAddress = address?.length() > maxCharss ? address.substring(0, maxCharss) + "..." : address
                                            %>
                                            <h3 class="text-xl font-bold text-gray-900 break-words whitespace-normal w-full max-w-sm" title="${name}">${displayName}</h3>


                                            <p class="text-sm text-green-600 font-medium">Member</p>

                                            <p class="text-xs text-gray-500 mt-1">${dateCreated}</p>
                                        </div>

                                        <div>

                                            <button onclick="editProfile()"
                                                    class="p-2 text-gray-400 hover:text-gray-600 hover:bg-white rounded-lg transition duration-200">
                                                <svg class="w-4 h-4" fill="none" stroke="currentColor"
                                                     viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-width="2"
                                                          d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>

                                </div>

                                <!-- Contact Info -->
                                <div class="p-4 border-b border-gray-100">
                                    <h4 class="text-sm font-semibold text-gray-900 mb-3">Contact Information</h4>

                                    <div class="space-y-2">
                                        <div class="flex items-center space-x-3 text-sm">
                                            <span class="text-black">📧</span>
                                            <span class="text-gray-700" title="${email}">${displayEmail}</span>
                                            <span class="text-xs bg-green-100 text-green-600 px-2 py-1 rounded-full">Verified</span>
                                        </div>

                                        <div class="flex items-center space-x-3 text-sm">
                                            <span class="text-black">📱</span>
                                            <span class="text-gray-700">${mobile}</span>
                                            <span class="text-xs bg-green-100 text-green-600 px-2 py-1 rounded-full">Verified</span>
                                        </div>

                                        <div class="flex items-center space-x-3 text-sm">
                                            <span class="text-black">📍</span>
                                            <span class="text-gray-700" title="${address}">${displayAddress}</span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Quick Actions -->
                                <div class="p-2">

                                    %{--                                <a href="#" class="flex items-center space-x-3 px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-lg transition duration-200">--}%
                                    %{--                                    <span class="text-black">🛍️</span>--}%
                                    %{--                                    <span>My Orders</span>--}%
                                    %{--                                    <span class="ml-auto text-xs bg-blue-100 text-blue-600 px-2 py-1 rounded-full">3 Active</span>--}%
                                    %{--                                </a>--}%
                                    %{--                                <a href="#" class="flex items-center space-x-3 px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-lg transition duration-200">--}%
                                    %{--                                    <span class="text-black">❤️</span>--}%
                                    %{--                                    <span>Wishlist</span>--}%
                                    %{--                                    <span class="ml-auto text-xs bg-red-100 text-red-600 px-2 py-1 rounded-full">8 Items</span>--}%
                                    %{--                                </a>--}%
                                    %{--                                <div class="border-t border-gray-100 my-2"></div>--}%
                                    <button onclick="handleLogout()"
                                            class="w-full flex items-center space-x-3 px-4 py-3 text-red-600 hover:bg-red-50 rounded-lg transition duration-200">
                                        <span class="text-black">🚪</span>
                                        <span>Logout</span>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>

                    <script>

                        function handleLogout() {
                            localStorage.clear();

                            $.ajax({
                                type: "POST",
                                url: "logout",
                                success: function (response) {
                                    window.location.href = '/';
                                },
                                error: function (xhr, status, error) {

                                }
                            });
                        }

                        function toggleDropdown() {
                            const menu = document.getElementById('userDropdownMenu');
                            menu.classList.toggle('hidden');
                        }

                        // Optional: close dropdown when clicking outside
                        document.addEventListener('click', function (event) {
                            const button = document.getElementById('userDropdownButton');
                            const menu = document.getElementById('userDropdownMenu');
                            if (!button.contains(event.target) && !menu.contains(event.target)) {
                                menu.classList.add('hidden');
                            }
                        });
                    </script>
                </g:if>

                <g:else>
                    <button onclick="window.location.href = 'login'"
                            class="hidden sm:block text-green-600 hover:text-green-800 font-medium">
                        Login
                    </button>
                </g:else>

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
                <a href="/" onclick="toggleMobileMenu()"
                   class="block px-3 py-2 text-gray-700 hover:text-green-600 hover:bg-green-50 rounded-md font-medium">Home</a>
                <a href="userproduct" onclick="toggleMobileMenu()"
                   class="block px-3 py-2 text-gray-700 hover:text-green-600 hover:bg-green-50 rounded-md font-medium">Products</a>
                <a href="about" onclick=" toggleMobileMenu()"
                   class="block px-3 py-2 text-gray-700 hover:text-green-600 hover:bg-green-50 rounded-md font-medium">About</a>
                <a href="contact" onclick="toggleMobileMenu()"
                   class="block px-3 py-2 text-gray-700 hover:text-green-600 hover:bg-green-50 rounded-md font-medium">Contact</a>
                <a href="admin" onclick=" toggleMobileMenu()"
                   class="block px-3 py-2 text-gray-700 hover:text-green-600 hover:bg-green-50 rounded-md font-medium">Admin</a>
                <a href="login" onclick="toggleMobileMenu()"
                   class="block px-3 py-2 text-green-600 hover:text-green-800 hover:bg-green-50 rounded-md font-medium sm:hidden">Login</a>
            </div>
        </div>
    </div>
</header>
<script>
    // Toggle cart
    function toggleCart() {
        const sidebar = document.getElementById('cartSidebar');
        const overlay = document.getElementById('cartOverlay');

        if (sidebar.classList.contains('translate-x-full')) {
            sidebar.classList.remove('translate-x-full');
            overlay.classList.remove('hidden');
        } else {
            sidebar.classList.add('translate-x-full');
            overlay.classList.add('hidden');
        }
    }

    // Toggle mobile menu
    function toggleMobileMenu() {
        const mobileMenu = document.getElementById('mobileMenu');
        mobileMenu.classList.toggle('hidden');
    }

    // Show notification
    function showNotification(message) {
        const notification = document.createElement('div');
        notification.className = 'fixed top-20 right-4 bg-green-600 text-white px-4 py-2 rounded-lg shadow-lg z-50';
        notification.textContent = message;
        document.body.appendChild(notification);

        setTimeout(() => {
            notification.remove();
        }, 3000);
    }

</script>