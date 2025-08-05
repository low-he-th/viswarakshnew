
<!-- Shopping Cart Sidebar -->
<div id="cartSidebar"
     class="fixed right-0 top-0 h-full w-96 bg-white shadow-2xl transform translate-x-full transition-transform duration-300 z-50">
    <div class="p-6 border-b">
        <div class="flex justify-between items-center">
            <h3 class="text-xl font-semibold">Shopping Cart</h3>
            <button onclick="toggleCart()" class="text-gray-500 hover:text-gray-700">✕</button>
        </div>
    </div>
    <div id="cartItems" class="flex-1 overflow-y-auto p-6">
        <p class="text-gray-500 text-center">Your cart is empty</p>
    </div>
    <div class="border-t p-6">
        <div class="flex justify-between items-center mb-4">
            <span class="text-lg font-semibold">Total: </span>
            <span id="cartTotal" class="text-lg font-bold text-green-600">₹0.00</span>
        </div>
        <button onclick="proceedToPayment()"
                class="w-full bg-green-600 text-white py-3 rounded-lg font-semibold hover:bg-green-700 transition duration-300">
            Proceed to Payment
        </button>
    </div>
</div>
<!-- Cart Overlay -->
<div id="cartOverlay" class="fixed inset-0 bg-black bg-opacity-50 z-40 hidden" onclick="toggleCart()"></div>
