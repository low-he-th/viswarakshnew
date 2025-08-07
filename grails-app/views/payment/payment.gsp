<!DOCTYPE html>
<html lang="en">
<head>
    <g:include view="layouts/head.gsp"/>
</head>
<body class="bg-green-50 natural-bg">
<g:include view="layouts/topBar.gsp"/>
<g:include view="layouts/sidebar.gsp"/>
<!-- Payment Page -->
<div id="paymentPage" class="page">
    <section class="py-16">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-8">
                <div class="text-4xl mb-4">💳</div>
                <h2 class="text-3xl font-bold text-gray-900 mb-4">Secure Checkout</h2>
                <p class="text-gray-600">Complete your order safely and securely</p>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                <!-- Payment Form -->
                <div class="bg-white rounded-xl shadow-lg p-8">
                    <h3 class="text-xl font-bold text-gray-900 mb-6">Payment Details</h3>

                    <!-- Payment Method Selection -->
                    <div class="mb-6">
                        <label class="block text-gray-700 text-sm font-medium mb-3">Select Payment Method</label>
                        <div class="space-y-3">
                            <label class="flex items-center p-3 border rounded-lg cursor-pointer hover:bg-gray-50">
                                <input type="radio" name="paymentMethod" value="card" class="mr-3" checked>
                                <div class="flex items-center">
                                    <span class="text-2xl mr-2">💳</span>
                                    <span>Credit/Debit Card</span>
                                </div>
                            </label>
                            <label class="flex items-center p-3 border rounded-lg cursor-pointer hover:bg-gray-50">
                                <input type="radio" name="paymentMethod" value="upi" class="mr-3">
                                <div class="flex items-center">
                                    <span class="text-2xl mr-2">📱</span>
                                    <span>UPI Payment</span>
                                </div>
                            </label>
                            <label class="flex items-center p-3 border rounded-lg cursor-pointer hover:bg-gray-50">
                                <input type="radio" name="paymentMethod" value="netbanking" class="mr-3">
                                <div class="flex items-center">
                                    <span class="text-2xl mr-2">🏦</span>
                                    <span>Net Banking</span>
                                </div>
                            </label>
                            <label class="flex items-center p-3 border rounded-lg cursor-pointer hover:bg-gray-50">
                                <input type="radio" name="paymentMethod" value="cod" class="mr-3">
                                <div class="flex items-center">
                                    <span class="text-2xl mr-2">💰</span>
                                    <span>Cash on Delivery</span>
                                </div>
                            </label>
                        </div>
                    </div>

                    <!-- Card Details Form -->
                    <div id="cardForm" class="space-y-4">
                        <div>
                            <label class="block text-gray-700 text-sm font-medium mb-2">Card Number</label>
                            <input type="text" placeholder="1234 5678 9012 3456"
                                   class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                        </div>
                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <label class="block text-gray-700 text-sm font-medium mb-2">Expiry Date</label>
                                <input type="text" placeholder="MM/YY"
                                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                            </div>
                            <div>
                                <label class="block text-gray-700 text-sm font-medium mb-2">CVV</label>
                                <input type="text" placeholder="123"
                                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                            </div>
                        </div>
                        <div>
                            <label class="block text-gray-700 text-sm font-medium mb-2">Cardholder Name</label>
                            <input type="text" placeholder="Enter name on card"
                                   class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                        </div>
                    </div>

                    <!-- Billing Address -->
                    <div class="mt-6">
                        <h4 class="text-lg font-semibold text-gray-900 mb-4">Billing Address</h4>
                        <div class="space-y-4">
                            <div>
                                <label class="block text-gray-700 text-sm font-medium mb-2">Full Name</label>
                                <input type="text"
                                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                            </div>
                            <div>
                                <label class="block text-gray-700 text-sm font-medium mb-2">Address</label>
                                <textarea rows="2"
                                          class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"></textarea>
                            </div>
                            <div class="grid grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-gray-700 text-sm font-medium mb-2">City</label>
                                    <input type="text"
                                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                                </div>
                                <div>
                                    <label class="block text-gray-700 text-sm font-medium mb-2">PIN Code</label>
                                    <input type="text"
                                           class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                                </div>
                            </div>
                            <div>
                                <label class="block text-gray-700 text-sm font-medium mb-2">Phone Number</label>
                                <input type="tel"
                                       class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order Summary -->
                <div class="bg-white rounded-xl shadow-lg p-8">
                    <h3 class="text-xl font-bold text-gray-900 mb-6">Order Summary</h3>
                    <div id="paymentOrderSummary" class="space-y-4 mb-6">
                        <!-- Order items will be populated here -->
                    </div>

                    <div class="border-t pt-4 space-y-2">
                        <div class="flex justify-between text-gray-600">
                            <span>Subtotal:</span>
                            <span id="paymentSubtotal">₹0.00</span>
                        </div>
                        <div class="flex justify-between text-gray-600">
                            <span>Shipping:</span>
                            <span>₹50.00</span>
                        </div>
                        <div class="flex justify-between text-gray-600">
                            <span>Tax (GST 18%):</span>
                            <span id="paymentTax">₹0.00</span>
                        </div>
                        <div class="border-t pt-2 flex justify-between text-lg font-bold text-gray-900">
                            <span>Total:</span>
                            <span id="paymentGrandTotal">₹0.00</span>
                        </div>
                    </div>

                    <div class="mt-6 p-4 bg-green-50 rounded-lg">
                        <div class="flex items-center mb-2">
                            <span class="text-green-600 mr-2">🔒</span>
                            <span class="text-sm font-medium text-green-800">Secure Payment</span>
                        </div>
                        <p class="text-xs text-green-700">Your payment information is encrypted and secure. We never
                        store your card details.</p>
                    </div>

                    <button onclick="processPayment()"
                            class="w-full mt-6 bg-green-600 text-white py-3 rounded-lg font-semibold hover:bg-green-700 transition duration-300">
                        Complete Payment
                    </button>

                    <div class="mt-4 text-center">
                        <button onclick="showPage('home'); toggleCart()"
                                class="text-gray-500 hover:text-gray-700 text-sm">← Back to Cart
                        </button>
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