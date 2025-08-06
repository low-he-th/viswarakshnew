<!DOCTYPE html>
<html lang="en">
<head>
    <g:include view="layouts/head.gsp"/>
</head>
<body class="bg-green-50 natural-bg">
<g:include view="layouts/topBar.gsp"/>
<g:include view="layouts/sidebar.gsp"/>

<!-- Admin Dashboard Page -->
<div id="adminPage">
    <section class="py-8">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-8">
                <div class="text-4xl mb-4">👨‍💼</div>
                <h2 class="text-3xl font-bold text-gray-900 mb-4">Admin Dashboard</h2>
                <p class="text-gray-600">Manage your VISHWARAKSHA business</p>
            </div>

            <!-- Admin Navigation Tabs -->
            <div class="bg-white rounded-xl shadow-lg mb-8">
                <!-- Mobile Tab Selector -->
                <div class="md:hidden border-b">
                    <select onchange="showAdminTab(this.value)"
                            class="w-full px-4 py-3 text-gray-700 bg-white border-0 focus:outline-none">
                        <option value="overview">📊 Overview</option>
                        <option value="products">📦 Products</option>
                        <option value="orders">🛒 Orders</option>
                        <option value="payments">💳 Payments</option>
                        <option value="analytics">📈 Analytics</option>
                    </select>
                </div>

                <!-- Desktop Tabs -->
                <div class="hidden md:flex border-b overflow-x-auto">
                    <button onclick="showAdminTab('overview')" id="overviewTab"
                            class="admin-tab active px-4 lg:px-6 py-4 font-medium text-green-600 border-b-2 border-green-600 whitespace-nowrap">
                        📊 Overview
                    </button>
                    <button onclick="showAdminTab('products')" id="productsTab"
                            class="admin-tab px-4 lg:px-6 py-4 font-medium text-gray-600 hover:text-green-600 whitespace-nowrap">
                        📦 Products
                    </button>
                    <button onclick="showAdminTab('orders')" id="ordersTab"
                            class="admin-tab px-4 lg:px-6 py-4 font-medium text-gray-600 hover:text-green-600 whitespace-nowrap">
                        🛒 Orders
                    </button>
                    <button onclick="showAdminTab('payments')" id="paymentsTab"
                            class="admin-tab px-4 lg:px-6 py-4 font-medium text-gray-600 hover:text-green-600 whitespace-nowrap">
                        💳 Payments
                    </button>
                    <button onclick="showAdminTab('analytics')" id="analyticsTab"
                            class="admin-tab px-4 lg:px-6 py-4 font-medium text-gray-600 hover:text-green-600 whitespace-nowrap">
                        📈 Analytics
                    </button>
                </div>
            </div>

            <!-- Overview Tab -->
            <div id="adminOverview" class="admin-content active">
                <!-- Stats Cards -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mb-8">
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <div class="flex items-center justify-between">
                            <div class="flex-1 min-w-0">
                                <p class="text-gray-600 text-xs md:text-sm truncate">Total Revenue</p>
                                <p class="text-xl md:text-2xl font-bold text-green-600" id="totalRevenue">₹45,280</p>
                                <p class="text-green-500 text-xs md:text-sm">+12% from last month</p>
                            </div>
                            <div class="text-2xl md:text-3xl ml-2">💰</div>
                        </div>
                    </div>
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <div class="flex items-center justify-between">
                            <div class="flex-1 min-w-0">
                                <p class="text-gray-600 text-xs md:text-sm truncate">Total Orders</p>
                                <p class="text-xl md:text-2xl font-bold text-blue-600" id="totalOrders">189</p>
                                <p class="text-green-500 text-xs md:text-sm">+8% from last month</p>
                            </div>
                            <div class="text-2xl md:text-3xl ml-2">📦</div>
                        </div>
                    </div>
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <div class="flex items-center justify-between">
                            <div class="flex-1 min-w-0">
                                <p class="text-gray-600 text-xs md:text-sm truncate">Active Products</p>
                                <p class="text-xl md:text-2xl font-bold text-purple-600" id="activeProducts">2</p>
                                <p class="text-gray-500 text-xs md:text-sm">In stock</p>
                            </div>
                            <div class="text-2xl md:text-3xl ml-2">🌿</div>
                        </div>
                    </div>
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <div class="flex items-center justify-between">
                            <div class="flex-1 min-w-0">
                                <p class="text-gray-600 text-xs md:text-sm truncate">Customers</p>
                                <p class="text-xl md:text-2xl font-bold text-orange-600" id="totalCustomers">156</p>
                                <p class="text-green-500 text-xs md:text-sm">+15% from last month</p>
                            </div>
                            <div class="text-2xl md:text-3xl ml-2">👥</div>
                        </div>
                    </div>
                </div>

                <!-- Charts Row -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 md:gap-8 mb-8">
                    <!-- Revenue Chart -->
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <h3 class="text-base md:text-lg font-bold text-gray-900 mb-4">Revenue Trends</h3>
                        <div class="relative h-48 md:h-64">
                            <canvas id="revenueChart" class="w-full h-full"></canvas>
                        </div>
                    </div>

                    <!-- Orders Chart -->
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <h3 class="text-base md:text-lg font-bold text-gray-900 mb-4">Order Distribution</h3>
                        <div class="relative h-48 md:h-64">
                            <canvas id="ordersChart" class="w-full h-full"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity -->
                <div class="bg-white rounded-xl shadow-lg p-6">
                    <h3 class="text-lg font-bold text-gray-900 mb-4">Recent Activity</h3>
                    <div class="space-y-4" id="recentActivity">
                        <!-- Activity items will be populated here -->
                    </div>
                </div>
            </div>

            <!-- Products Management Tab -->
            <div id="adminProducts" class="admin-content hidden">
                <div class="bg-white rounded-xl shadow-lg p-6 mb-6">
                    <div class="flex justify-between items-center mb-6">
                        <h3 class="text-xl font-bold text-gray-900">Product Management</h3>
                        <button onclick="showAddProductForm()"
                                class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition duration-300">
                            + Add New Product
                        </button>
                    </div>

                    <!-- Products Table -->
                    <div class="overflow-x-auto -mx-4 md:mx-0">
                        <div class="inline-block min-w-full align-middle">
                            <table class="min-w-full">
                                <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Product
                                    </th>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Price
                                    </th>
                                    <th class="hidden sm:table-cell px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Weight
                                    </th>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Stock
                                    </th>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Actions
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="productsTable" class="divide-y divide-gray-200 bg-white">
                                <!-- Products will be populated here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Orders Management Tab -->
            <div id="adminOrders" class="admin-content hidden">
                <div class="bg-white rounded-xl shadow-lg p-6">
                    <h3 class="text-xl font-bold text-gray-900 mb-6">Order Management</h3>
                    <div class="overflow-x-auto -mx-4 md:mx-0">
                        <div class="inline-block min-w-full align-middle">
                            <table class="min-w-full">
                                <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Order ID
                                    </th>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Customer
                                    </th>
                                    <th class="hidden lg:table-cell px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Products
                                    </th>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Amount
                                    </th>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Status
                                    </th>
                                    <th class="hidden sm:table-cell px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Date
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="ordersTable" class="divide-y divide-gray-200 bg-white">
                                <!-- Orders will be populated here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Payments Tab -->
            <div id="adminPayments" class="admin-content hidden">
                <!-- Payment Stats -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4 md:gap-6 mb-8">
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <h4 class="text-base md:text-lg font-semibold text-gray-900 mb-2">Daily Earnings</h4>
                        <p class="text-xl md:text-2xl font-bold text-green-600" id="dailyEarnings">₹1,250</p>
                        <p class="text-xs md:text-sm text-gray-600">Today's revenue</p>
                    </div>
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <h4 class="text-base md:text-lg font-semibold text-gray-900 mb-2">Monthly Earnings</h4>
                        <p class="text-xl md:text-2xl font-bold text-blue-600" id="monthlyEarnings">₹28,450</p>
                        <p class="text-xs md:text-sm text-gray-600">This month's revenue</p>
                    </div>
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <h4 class="text-base md:text-lg font-semibold text-gray-900 mb-2">Yearly Earnings</h4>
                        <p class="text-xl md:text-2xl font-bold text-purple-600" id="yearlyEarnings">₹3,42,680</p>
                        <p class="text-xs md:text-sm text-gray-600">This year's revenue</p>
                    </div>
                </div>

                <!-- Payment Methods Chart -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 md:gap-8 mb-8">
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <h3 class="text-base md:text-lg font-bold text-gray-900 mb-4">Payment Methods</h3>
                        <div class="relative h-48 md:h-64">
                            <canvas id="paymentMethodsChart" class="w-full h-full"></canvas>
                        </div>
                    </div>
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <h3 class="text-base md:text-lg font-bold text-gray-900 mb-4">Monthly Revenue Trend</h3>
                        <div class="relative h-48 md:h-64">
                            <canvas id="monthlyRevenueChart" class="w-full h-full"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Recent Payments -->
                <div class="bg-white rounded-xl shadow-lg p-6">
                    <h3 class="text-lg font-bold text-gray-900 mb-4">Recent Payments</h3>
                    <div class="overflow-x-auto">
                        <div class="inline-block min-w-full align-middle">
                            <table class="min-w-full">
                                <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Transaction ID
                                    </th>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Customer
                                    </th>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Amount
                                    </th>
                                    <th class="hidden sm:table-cell px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Method
                                    </th>
                                    <th class="px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Status
                                    </th>
                                    <th class="hidden lg:table-cell px-2 md:px-4 py-3 text-left text-xs md:text-sm font-medium text-gray-900">
                                        Date
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="paymentsTable" class="divide-y divide-gray-200 bg-white">
                                <!-- Payments will be populated here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Analytics Tab -->
            <div id="adminAnalytics" class="admin-content hidden">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 md:gap-8 mb-8">
                    <!-- Customer Growth -->
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <h3 class="text-base md:text-lg font-bold text-gray-900 mb-4">Customer Growth</h3>
                        <div class="relative h-48 md:h-64">
                            <canvas id="customerGrowthChart" class="w-full h-full"></canvas>
                        </div>
                    </div>

                    <!-- Product Performance -->
                    <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                        <h3 class="text-base md:text-lg font-bold text-gray-900 mb-4">Product Performance</h3>
                        <div class="relative h-48 md:h-64">
                            <canvas id="productPerformanceChart" class="w-full h-full"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Detailed Analytics -->
                <div class="bg-white rounded-xl shadow-lg p-4 md:p-6">
                    <h3 class="text-base md:text-lg font-bold text-gray-900 mb-4">Detailed Analytics</h3>
                    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6">
                        <div class="text-center p-3 md:p-4 bg-green-50 rounded-lg">
                            <div class="text-xl md:text-2xl font-bold text-green-600">94.5%</div>
                            <div class="text-xs md:text-sm text-gray-600">Customer Satisfaction</div>
                        </div>
                        <div class="text-center p-3 md:p-4 bg-blue-50 rounded-lg">
                            <div class="text-xl md:text-2xl font-bold text-blue-600">2.3 min</div>
                            <div class="text-xs md:text-sm text-gray-600">Avg. Session Duration</div>
                        </div>
                        <div class="text-center p-3 md:p-4 bg-purple-50 rounded-lg">
                            <div class="text-xl md:text-2xl font-bold text-purple-600">68%</div>
                            <div class="text-xs md:text-sm text-gray-600">Return Customer Rate</div>
                        </div>
                        <div class="text-center p-3 md:p-4 bg-orange-50 rounded-lg">
                            <div class="text-xl md:text-2xl font-bold text-orange-600">₹239</div>
                            <div class="text-xs md:text-sm text-gray-600">Average Order Value</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Add/Edit Product Modal -->
<div id="productModal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden flex items-center justify-center">
    <div class="bg-white rounded-xl shadow-2xl p-8 max-w-2xl w-full mx-4 max-h-screen overflow-y-auto">
        <div class="flex justify-between items-center mb-6">
            <h3 id="modalTitle" class="text-2xl font-bold text-gray-900">Add New Product</h3>
            <button onclick="closeProductModal()" class="text-gray-500 hover:text-gray-700 text-2xl">×</button>
        </div>

        <form id="productForm" onsubmit="saveProduct(event)">
            <input type="hidden" id="productId" value="">

            <!-- Product Image Upload -->
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-medium mb-2">Product Image</label>
                <div class="flex items-center space-x-4">
                    <div class="flex-1">
                        <input type="file" id="productImageFile" accept="image/*" onchange="previewImage(this)"
                               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                        <p class="text-xs text-gray-500 mt-1">Upload product image (JPG, PNG, GIF)</p>
                    </div>
                    <!--                        <div id="imagePreview" class="hidden">-->
                    <!--                            <img id="previewImg" class="image-preview border border-gray-300" alt="Preview">-->
                    <!--                        </div>-->
                </div>
                <input type="hidden" id="productImage" value="">
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Product Name</label>
                    <input type="text" id="productName" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>
                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Price (₹)</label>
                    <input type="number" id="productPrice" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Weight</label>
                    <input type="text" id="productWeight" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>
                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Stock Quantity</label>
                    <input type="number" id="productStock" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>
            </div>

            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-medium mb-2">Description</label>
                <textarea id="productDescription" rows="3" required
                          class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"></textarea>
            </div>

            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-medium mb-2">Ingredients</label>
                <textarea id="productIngredients" rows="3" required
                          class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"></textarea>
            </div>

            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-medium mb-2">Benefits (one per line)</label>
                <textarea id="productBenefits" rows="4" required
                          class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"></textarea>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Manufacturing Date</label>
                    <input type="text" id="productMfgDate" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>
                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Expiry Info</label>
                    <input type="text" id="productExpiry" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>
            </div>

            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-medium mb-2">Special Offer (%)</label>
                <input type="number" id="productOffer" min="0" max="100"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
            </div>

            <div class="flex justify-end space-x-4">
                <button type="button" onclick="closeProductModal()"
                        class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50">
                    Cancel
                </button>
                <button type="submit" class="px-6 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
                    Save Product
                </button>
            </div>
        </form>
    </div>
</div>

<g:include view="layouts/footer.gsp"/>
<script>

</script>
</body>
</html>