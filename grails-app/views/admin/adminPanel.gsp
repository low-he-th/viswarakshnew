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
                        <button onclick="openAddProductModal()"
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

        <form id="productForm">
            <input type="hidden" id="productId" name="id" value="">

            <!-- Product Image Upload -->
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-medium mb-2">Product Image</label>
                <div class="flex items-center space-x-4">
                    <div class="flex-1">
                        <input type="file" id="productImageFile" name="imageFile" accept="image/*" onchange="previewImage(this)"
                               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                        <p class="text-xs text-gray-500 mt-1">Upload product image (JPG, PNG)</p>
                    </div>
                </div>
                <input type="hidden" id="productImage" name="image" value="">
            </div>

            <!-- Name and Price -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Product Name</label>
                    <input type="text" id="productName" name="name" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>

                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Price (₹)</label>
                    <input type="number" id="productPrice" name="price" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>
            </div>

            <!-- Weight and Stock -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Weight</label>
                    <input type="text" id="productWeight" name="weight" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>

                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Stock Quantity</label>
                    <input type="number" id="productStock" name="stock" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>
            </div>

            <!-- Description -->
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-medium mb-2">Description</label>
                <textarea id="productDescription" name="desc" rows="3" required
                          class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"></textarea>
            </div>

            <!-- Ingredients -->
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-medium mb-2">Ingredients</label>
                <textarea id="productIngredients" name="ingredients" rows="3" required
                          class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"></textarea>
            </div>

            <!-- Benefits -->
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-medium mb-2">Benefits (one per line)</label>
                <textarea id="productBenefits" name="benefits" rows="4" required
                          class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"></textarea>
            </div>

            <!-- MFG and Expiry Dates -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Manufacturing Date</label>
                    <input type="date" id="productMfgDate" name="mfgDate" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>

                <div>
                    <label class="block text-gray-700 text-sm font-medium mb-2">Expiry Date</label>
                    <input type="date" id="productExpiry" name="expiry" required
                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                </div>
            </div>

            <!-- Offer -->
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-medium mb-2">Special Offer (%)</label>
                <input type="number" id="productOffer" name="offer" min="0" max="100"
                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
            </div>

            <!-- isHidden -->
            <div class="mb-6">
                <label class="inline-flex items-center">
                    <input type="checkbox" id="productIsHidden" name="isHidden" class="form-checkbox h-5 w-5 text-green-600">
                    <span class="ml-2 text-gray-700 text-sm">Hide this product from users</span>
                </label>
            </div>

            <!-- Submit Buttons -->
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
    let currentAdminTab = 'overview';
    fetchProducts()
    // Admin data
    let adminData = {
        orders: [
            {
                id: 'ORD001',
                customer: 'Rajesh Kumar',
                products: 'Shikakai Paste x2',
                amount: 478,
                status: 'Delivered',
                date: '2024-01-15'
            },
            {
                id: 'ORD002',
                customer: 'Priya Sharma',
                products: 'Shikakai Powder x1',
                amount: 239,
                status: 'Processing',
                date: '2024-01-14'
            },
            {
                id: 'ORD003',
                customer: 'Amit Singh',
                products: 'Shikakai Paste x1, Powder x1',
                amount: 478,
                status: 'Shipped',
                date: '2024-01-13'
            },
            {
                id: 'ORD004',
                customer: 'Sunita Devi',
                products: 'Shikakai Powder x3',
                amount: 717,
                status: 'Delivered',
                date: '2024-01-12'
            },
            {
                id: 'ORD005',
                customer: 'Vikram Patel',
                products: 'Shikakai Paste x1',
                amount: 239,
                status: 'Processing',
                date: '2024-01-11'
            }
        ],
        payments: [
            {id: 'TXN001', customer: 'Rajesh Kumar', amount: 478, method: 'UPI', status: 'Success', date: '2024-01-15'},
            {
                id: 'TXN002',
                customer: 'Priya Sharma',
                amount: 239,
                method: 'Card',
                status: 'Success',
                date: '2024-01-14'
            },
            {
                id: 'TXN003',
                customer: 'Amit Singh',
                amount: 478,
                method: 'Net Banking',
                status: 'Success',
                date: '2024-01-13'
            },
            {id: 'TXN004', customer: 'Sunita Devi', amount: 717, method: 'COD', status: 'Pending', date: '2024-01-12'},
            {id: 'TXN005', customer: 'Vikram Patel', amount: 239, method: 'UPI', status: 'Success', date: '2024-01-11'}
        ],
        recentActivity: [
            {type: 'order', message: 'New order #ORD001 received from Rajesh Kumar', time: '2 hours ago'},
            {type: 'payment', message: 'Payment of ₹478 received via UPI', time: '2 hours ago'},
            {type: 'product', message: 'Shikakai Paste stock updated', time: '4 hours ago'},
            {type: 'customer', message: 'New customer Priya Sharma registered', time: '6 hours ago'},
            {type: 'order', message: 'Order #ORD002 shipped successfully', time: '1 day ago'}
        ]
    };

    function showAdminTab(tabName) {
        // Hide all admin content
        document.querySelectorAll('.admin-content').forEach(content => {
            content.classList.remove('active');
        });

        // Remove active class from all tabs
        document.querySelectorAll('.admin-tab').forEach(tab => {
            tab.classList.remove('active');
            tab.classList.remove('text-green-600', 'border-green-600');
            tab.classList.add('text-gray-600');
        });

        // Show selected content
        document.getElementById('admin' + tabName.charAt(0).toUpperCase() + tabName.slice(1)).classList.add('active');

        // Activate selected tab
        const activeTab = document.getElementById(tabName + 'Tab');
        activeTab.classList.add('active', 'text-green-600', 'border-green-600');
        activeTab.classList.remove('text-gray-600');

        currentAdminTab = tabName;
    }

    function renderAdminOverview() {
        const recentActivity = document.getElementById('recentActivity');
        recentActivity.innerHTML = adminData.recentActivity.map(function (activity) {
            return '<div class="flex items-center space-x-3 p-3 bg-gray-50 rounded-lg">' +
                '<div class="text-2xl">' +
                (activity.type === 'order' ? '📦' :
                    activity.type === 'payment' ? '💳' :
                        activity.type === 'product' ? '🌿' : '👥') +
                '</div>' +
                '<div class="flex-1">' +
                '<p class="text-sm text-gray-900">' + activity.message + '</p>' +
                '<p class="text-xs text-gray-500">' + activity.time + '</p>' +
                '</div>' +
                '</div>';
        }).join('');
    }

    let products = [];

    function fetchProducts() {
        fetch('/getproducts?draw=1&start=0&length=100') // adjust length or pagination as needed
            .then(response => response.json())
            .then(data => {
                products = data.data; // assuming Grails returns products inside "data"
                renderProductsTable();
            })
            .catch(error => {
                console.error('Error fetching products:', error);
                document.getElementById('productsTable').innerHTML =
                    '<tr><td colspan="5" class="text-center py-4 text-red-600">No products Available.</td></tr>';
            });
    }

    function renderProductsTable() {
        const productsTable = document.getElementById('productsTable');
        productsTable.innerHTML = products.map(function (product) {
            return '<tr>' +
                '<td class="px-2 md:px-4 py-3">' +
                '<div class="flex items-center space-x-2 md:space-x-3">' +
                '<img src="api/media/product_image/' + product.image + '" alt="' + product.name + '" class="w-16 h-16 object-cover rounded-lg" />' +
                '<div class="min-w-0 flex-1">' +
                '<p class="font-medium text-gray-900 text-sm md:text-base truncate">' + product.name + '</p>' +
                // '<p class="text-xs md:text-sm text-gray-600 hidden sm:block">' + product.description + '</p>' +
                '</div>' +
                '</div>' +
                '</td>' +
                '<td class="px-2 md:px-4 py-3">' +
                '<span class="text-sm md:text-lg font-semibold text-green-600">₹' + product.price + '</span>' +
                (product.offer > 0
                    ? '<span class="text-xs md:text-sm text-red-500 block md:ml-2">' + product.offer + '% OFF</span>'
                    : '') +
                '</td>' +
                '<td class="hidden sm:table-cell px-2 md:px-4 py-3 text-gray-900 text-sm md:text-base">' + product.weight + '</td>' +
                '<td class="px-2 md:px-4 py-3">' +
                '<span class="px-1 md:px-2 py-1 text-xs rounded-full ' +
                (product.stock > 20 ? 'bg-green-100 text-green-800' :
                    product.stock > 10 ? 'bg-yellow-100 text-yellow-800' : 'bg-red-100 text-red-800') +
                '">' + product.stock + '</span>' +
                '</td>' +
                '<td class="px-2 md:px-4 py-3">' +
                '<div class="flex flex-col sm:flex-row space-y-1 sm:space-y-0 sm:space-x-2">' +
                '<button onclick="editProduct(' + product.id + ')" class="text-blue-600 hover:text-blue-800 text-xs md:text-sm">Edit</button>' +
                '<button onclick="deleteProduct(' + product.id + ')" class="text-red-600 hover:text-red-800 text-xs md:text-sm">Delete</button>' +
                '</div>' +
                '</td>' +
                '</tr>';
        }).join('');
    }

    $('#productForm').submit(function (e) {
        e.preventDefault();
        const productId = $('#productId').val();
        const formData = new FormData(this);
        const url = productId ? "updateproduct" : "addproduct";
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                console.log(response);
                closeProductModal()
                var message = productId ? "Product Updated" : "Product Added"
                showNotification(message);
                fetchProducts();
            },
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
                closeProductModal()
                showNotification("An error occurred")
            }
        });

    });

    function closeProductModal() {
        document.getElementById('productModal').classList.add('hidden');
    }

    function openAddProductModal() {
        closeProductModal(); // clears previous data
        $('#productModal').removeClass('hidden');
    }

    function deleteProduct(id) {
        $.ajax({
            url: 'deleteproducts', // or '/product/delete' if it's in a namespaced controller
            type: 'POST',
            data: { id: id },
            success: function (response, status, xhr) {
                // if (response.status === 200) {
                    // You can either:
                    // Option 1: Refresh the full table
                    showNotification("Product Deleted")
                    fetchProducts();
                // } else {
                //     showNotification("Delete failed")
                // }
            },
            error: function (xhr, status, error) {
                showNotification("Error while deleting product")
            }
        });
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


    function editProduct(id) {
        const product = products.find(p => p.id === id);
        if (!product) return;

        // Set form fields
        $('#productId').val(product.id);
        $('#productName').val(product.name);
        $('#productPrice').val(product.price);
        $('#productWeight').val(product.weight);
        $('#productStock').val(product.stock);
        $('#productDescription').val(product.description);
        $('#productIngredients').val(product.ingredients);
        $('#productBenefits').val(product.benefits); // convert array to text
        $('#productMfgDate').val(product.mfgDate);  // Ensure backend returns yyyy-mm-dd
        $('#productExpiry').val(product.expiry);
        $('#productOffer').val(product.offer);
        $('#productIsHidden').prop('checked', product.isHidden);

        // Set preview image
        if (product.image) {
            $('#previewImg').attr('src', product.image).show();
        } else {
            $('#previewImg').hide();
        }

        // Show modal
        $('#productModal').removeClass('hidden');
        $('#modalTitle').text('Edit Product');
    }

    function closeProductModal() {
        // Hide modal
        $('#productModal').addClass('hidden');

        // Reset form
        $('#productForm')[0].reset();
        $('#productId').val('');
        $('#previewImg').hide().attr('src', '');
        $('#modalTitle').text('Add New Product');
    }


    function renderOrdersTable() {
        const ordersTable = document.getElementById('ordersTable');
        ordersTable.innerHTML = adminData.orders.map(function (order) {
            return '<tr>' +
                '<td class="px-2 md:px-4 py-3 font-medium text-gray-900 text-sm md:text-base">' + order.id + '</td>' +
                '<td class="px-2 md:px-4 py-3 text-gray-900 text-sm md:text-base">' + order.customer + '</td>' +
                '<td class="hidden lg:table-cell px-2 md:px-4 py-3 text-gray-600 text-sm">' + order.products + '</td>' +
                '<td class="px-2 md:px-4 py-3 font-semibold text-green-600 text-sm md:text-base">₹' + order.amount + '</td>' +
                '<td class="px-2 md:px-4 py-3">' +
                '<span class="px-1 md:px-2 py-1 text-xs rounded-full ' +
                (order.status === 'Delivered' ? 'bg-green-100 text-green-800' :
                    order.status === 'Shipped' ? 'bg-blue-100 text-blue-800' :
                        order.status === 'Processing' ? 'bg-yellow-100 text-yellow-800' : 'bg-gray-100 text-gray-800') +
                '">' + order.status + '</span>' +
                '</td>' +
                '<td class="hidden sm:table-cell px-2 md:px-4 py-3 text-gray-600 text-xs md:text-sm">' + order.date + '</td>' +
                '</tr>';
        }).join('');
    }

    function renderPaymentsTable() {
        const paymentsTable = document.getElementById('paymentsTable');
        paymentsTable.innerHTML = adminData.payments.map(function (payment) {
            return '<tr>' +
                '<td class="px-2 md:px-4 py-3 font-medium text-gray-900 text-sm md:text-base">' + payment.id + '</td>' +
                '<td class="px-2 md:px-4 py-3 text-gray-900 text-sm md:text-base">' + payment.customer + '</td>' +
                '<td class="px-2 md:px-4 py-3 font-semibold text-green-600 text-sm md:text-base">₹' + payment.amount + '</td>' +
                '<td class="hidden sm:table-cell px-2 md:px-4 py-3">' +
                '<span class="px-1 md:px-2 py-1 text-xs rounded-full bg-blue-100 text-blue-800">' +
                payment.method +
                '</span>' +
                '</td>' +
                '<td class="px-2 md:px-4 py-3">' +
                '<span class="px-1 md:px-2 py-1 text-xs rounded-full ' +
                (payment.status === 'Success' ? 'bg-green-100 text-green-800' :
                    payment.status === 'Pending' ? 'bg-yellow-100 text-yellow-800' :
                        'bg-red-100 text-red-800') +
                '">' + payment.status + '</span>' +
                '</td>' +
                '<td class="hidden lg:table-cell px-2 md:px-4 py-3 text-gray-600 text-xs md:text-sm">' + payment.date + '</td>' +
                '</tr>';
        }).join('');
    }
</script>
</body>
</html>