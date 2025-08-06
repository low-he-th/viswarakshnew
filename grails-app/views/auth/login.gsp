<!DOCTYPE html>
<html lang="en">
<head>
    <g:include view="layouts/head.gsp"/>
</head>
<body class="bg-green-50 natural-bg">
<g:include view="layouts/topBar.gsp"/>
<g:include view="layouts/sidebar.gsp"/>

<!-- Login Page -->
<div id="loginPage">
    <section class="py-16">
        <div class="max-w-md mx-auto bg-white rounded-xl shadow-lg p-8">
            <div class="text-center mb-8">
                <div class="text-4xl mb-4">🌿</div>
                <h2 class="text-2xl font-bold text-gray-900">Welcome Back</h2>
                <p class="text-gray-600">Sign in with your phone number</p>
            </div>

            <div id="loginPhoneStep">
                <form onsubmit="sendLoginOTP(event)">
                    <div class="mb-6">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Phone Number</label>
                        <div class="flex">
                            <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-lg">+91</span>
                            <input type="tel" id="loginPhone" required pattern="[0-9]{10}" maxlength="10"
                                   class="flex-1 px-3 py-2 border border-gray-300 rounded-r-lg focus:outline-none focus:border-green-500"
                                   placeholder="Enter 10-digit mobile number">
                        </div>
                    </div>
                    <button type="submit"
                            class="w-full bg-green-600 text-white py-2 rounded-lg font-semibold hover:bg-green-700 transition duration-300">
                        Send OTP
                    </button>
                </form>
            </div>

            <div id="loginOTPStep" class="hidden">
                <form onsubmit="verifyLoginOTP(event)">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Enter OTP</label>
                        <input type="text" id="loginOTP" required pattern="[0-9]{6}" maxlength="6"
                               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500 text-center text-2xl tracking-widest"
                               placeholder="000000">
                        <p class="text-sm text-gray-600 mt-2">OTP sent to <span id="loginPhoneDisplay"></span></p>
                    </div>
                    <div class="flex space-x-3">
                        <button type="button" onclick="showLoginPhoneStep()"
                                class="flex-1 border border-gray-300 text-gray-700 py-2 rounded-lg font-semibold hover:bg-gray-50 transition duration-300">
                            Change Number
                        </button>
                        <button type="submit"
                                class="flex-1 bg-green-600 text-white py-2 rounded-lg font-semibold hover:bg-green-700 transition duration-300">
                            Verify OTP
                        </button>
                    </div>
                    <div class="text-center mt-4">
                        <button type="button" onclick="resendLoginOTP()"
                                class="text-green-600 hover:text-green-800 text-sm">Resend OTP
                        </button>
                    </div>
                </form>
            </div>

            <div class="text-center mt-6">
                <p class="text-gray-600">Don't have an account?
                    <button onclick="showPage('register')" class="text-green-600 hover:text-green-800 font-medium">
                        Register here
                    </button>
                </p>
            </div>
        </div>
    </section>
</div>

<!-- Register Page -->
<div id="registerPage" class="page">
    <section class="py-16">
        <div class="max-w-md mx-auto bg-white rounded-xl shadow-lg p-8">
            <div class="text-center mb-8">
                <div class="text-4xl mb-4">🌿</div>
                <h2 class="text-2xl font-bold text-gray-900">Join VISHWARAKSHA</h2>
                <p class="text-gray-600">Create your account for natural wellness</p>
            </div>

            <div id="registerDetailsStep">
                <form onsubmit="sendRegisterOTP(event)">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Full Name</label>
                        <input type="text" id="registerName" required
                               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"
                               placeholder="Enter your full name">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Email Address</label>
                        <input type="email" id="registerEmail" required
                               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"
                               placeholder="Enter your email">
                    </div>
                    <div class="mb-6">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Phone Number</label>
                        <div class="flex">
                            <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-lg">+91</span>
                            <input type="tel" id="registerPhone" required pattern="[0-9]{10}" maxlength="10"
                                   class="flex-1 px-3 py-2 border border-gray-300 rounded-r-lg focus:outline-none focus:border-green-500"
                                   placeholder="Enter 10-digit mobile number">
                        </div>
                    </div>
                    <button type="submit"
                            class="w-full bg-green-600 text-white py-2 rounded-lg font-semibold hover:bg-green-700 transition duration-300">
                        Send OTP
                    </button>
                </form>
            </div>

            <div id="registerOTPStep" class="hidden">
                <form onsubmit="verifyRegisterOTP(event)">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Enter OTP</label>
                        <input type="text" id="registerOTP" required pattern="[0-9]{6}" maxlength="6"
                               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500 text-center text-2xl tracking-widest"
                               placeholder="000000">
                        <p class="text-sm text-gray-600 mt-2">OTP sent to <span id="registerPhoneDisplay"></span></p>
                    </div>
                    <div class="flex space-x-3">
                        <button type="button" onclick="showRegisterDetailsStep()"
                                class="flex-1 border border-gray-300 text-gray-700 py-2 rounded-lg font-semibold hover:bg-gray-50 transition duration-300">
                            Back
                        </button>
                        <button type="submit"
                                class="flex-1 bg-green-600 text-white py-2 rounded-lg font-semibold hover:bg-green-700 transition duration-300">
                            Create Account
                        </button>
                    </div>
                    <div class="text-center mt-4">
                        <button type="button" onclick="resendRegisterOTP()"
                                class="text-green-600 hover:text-green-800 text-sm">Resend OTP
                        </button>
                    </div>
                </form>
            </div>

            <div class="text-center mt-6">
                <p class="text-gray-600">Already have an account?
                    <button onclick="showPage('login')" class="text-green-600 hover:text-green-800 font-medium">Sign in
                    here
                    </button>
                </p>
            </div>
        </div>
    </section>
</div>

<g:include view="layouts/footer.gsp"/>
<script>

</script>
</body>
</html>