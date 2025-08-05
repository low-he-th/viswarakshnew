<!DOCTYPE html>
<html lang="en">
<head>
    <g:include view="layouts/head.gsp"/>
</head>
<body class="bg-green-50 natural-bg">
<g:include view="layouts/topBar.gsp"/>
<g:include view="layouts/sidebar.gsp"/>
<!-- Contact Page -->
<div id="contactPage" class="page">
    <section class="py-16">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-12">
                <div class="text-6xl mb-6">📞</div>
                <h2 class="text-4xl font-bold text-gray-900 mb-4">Contact Us</h2>
                <p class="text-xl text-gray-600">We'd love to hear from you</p>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
                <!-- Contact Form -->
                <div class="bg-white rounded-xl shadow-lg p-8">
                    <h3 class="text-2xl font-bold text-gray-900 mb-6">Send us a Message</h3>
                    <form onsubmit="handleContactForm(event)">
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-medium mb-2">Full Name</label>
                            <input type="text" required
                                   class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"
                                   placeholder="Enter your full name">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-medium mb-2">Email Address</label>
                            <input type="email" required
                                   class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"
                                   placeholder="Enter your email">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-medium mb-2">Phone Number</label>
                            <input type="tel"
                                   class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"
                                   placeholder="Enter your phone number">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-medium mb-2">Subject</label>
                            <select class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500">
                                <option>Product Inquiry</option>
                                <option>Order Support</option>
                                <option>General Question</option>
                                <option>Feedback</option>
                                <option>Other</option>
                            </select>
                        </div>
                        <div class="mb-6">
                            <label class="block text-gray-700 text-sm font-medium mb-2">Message</label>
                            <textarea required rows="4"
                                      class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"
                                      placeholder="Enter your message"></textarea>
                        </div>
                        <button type="submit"
                                class="w-full bg-green-600 text-white py-3 rounded-lg font-semibold hover:bg-green-700 transition duration-300">
                            Send Message
                        </button>
                    </form>
                </div>

                <!-- Contact Information -->
                <div class="space-y-8">
                    <div class="bg-white rounded-xl shadow-lg p-8">
                        <h3 class="text-2xl font-bold text-gray-900 mb-6">Get in Touch</h3>
                        <div class="space-y-4">
                            <div class="flex items-start space-x-3">
                                <div class="text-2xl">🏭</div>
                                <div>
                                    <h4 class="font-semibold text-gray-900">Manufacturing Unit</h4>
                                    <p class="text-gray-600">Sri Raghavendra Soap Nut Works</p>
                                    <p class="text-gray-600">Siddanahalli, Madhugiri (Taluk)</p>
                                    <p class="text-gray-600">Tumkur - 572175, Karnataka</p>
                                </div>
                            </div>
                            <div class="flex items-start space-x-3">
                                <div class="text-2xl">📞</div>
                                <div>
                                    <h4 class="font-semibold text-gray-900">Phone Numbers</h4>
                                    <p class="text-gray-600">7019327963</p>
                                    <p class="text-gray-600">9353092862</p>
                                </div>
                            </div>
                            <div class="flex items-start space-x-3">
                                <div class="text-2xl">📧</div>
                                <div>
                                    <h4 class="font-semibold text-gray-900">Email Addresses</h4>
                                    <p class="text-gray-600">kesharaksha123@gmail.com</p>
                                    <p class="text-gray-600">vishwaraksha.cosmetic@gmail.com</p>
                                </div>
                            </div>
                            <div class="flex items-start space-x-3">
                                <div class="text-2xl">🕒</div>
                                <div>
                                    <h4 class="font-semibold text-gray-900">Business Hours</h4>
                                    <p class="text-gray-600">Monday - Saturday: 9:00 AM - 6:00 PM</p>
                                    <p class="text-gray-600">Sunday: Closed</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="bg-green-50 rounded-xl p-6">
                        <h4 class="text-lg font-bold text-green-800 mb-3">Quick Response Promise</h4>
                        <p class="text-gray-700 text-sm mb-3">
                            We value your time and strive to respond to all inquiries within 24 hours.
                            For urgent matters, please call us directly.
                        </p>
                        <div class="flex space-x-4 text-sm">
                            <div>📱 WhatsApp Available</div>
                            <div>📞 Call Support</div>
                            <div>📧 Email Support</div>
                        </div>
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