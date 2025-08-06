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
                <form id="loginForm">
                    <div class="mb-6">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Phone Number</label>
                        <div class="flex">
                            <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-lg">+91</span>
                            <input type="number" id="loginPhone" name="loginPhone" required pattern="[0-9]{10}" maxlength="10" autocomplete="off"
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
                <form id="verifyLoginOTP">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Enter OTP</label>
                        <input type="number" id="loginOTP" name="loginOTP" required pattern="[0-9]{6}" maxlength="6"
                               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500 text-center text-2xl tracking-widest" autocomplete="off"
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
                    <button onclick="window.location.href='register'" class="text-green-600 hover:text-green-800 font-medium">
                        Register here
                    </button>
                </p>
            </div>
        </div>
    </section>
</div>



<g:include view="layouts/footer.gsp"/>
<script>


    function showLoginPhoneStep() {
        document.getElementById('loginPhoneStep').classList.remove('hidden');
        document.getElementById('loginOTPStep').classList.add('hidden');
    }

    function resendLoginOTP() {

        var mob = $('#loginPhone').val();

        $.ajax({
            url: "get/otp",
            method: "POST",
            data: { mob: mob },
            success: function (response) {
                if (response.success) {
                    showNotification('OTP resent!');
                } else {
                    showNotification("Phone number not registered.Please Register.");
                }
            },
            error: function () {
                showNotification("Phone number not registered.Please Register.");

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

    $(document).ready(function () {
        $('#loginForm').on("submit", function (e) {
            e.preventDefault(); // prevent page reload

            var mob = $('#loginPhone').val();
            if(mob.length!==10){
                showNotification("Wrong Phone Number..");
                return
            }
            $.ajax({
                url: "get/otp",
                method: "POST",
                dataType:"json",
                data: { mob: mob }, // send as form data
                success: function (response) {

                        document.getElementById('loginPhoneStep').classList.add('hidden');
                        document.getElementById('loginOTPStep').classList.remove('hidden');
                        showNotification('OTP sent to your phone!');

                },
                error: function () {
                    showNotification("Phone number not registered. Please Register.");
                }
            });

        });
        $('#verifyLoginOTP').on("submit", function (e) {
            e.preventDefault(); // prevent page reload
            var mob = $('#loginPhone').val();
            var loginOTP = $('#loginOTP').val();

            if(loginOTP.length!==5){
                showNotification("Wrong OTP..");
                return
            }
            if(mob.length!==10){
                showNotification("Wrong Phone Number..");
                return
            }

            $.ajax({
                url: "verify/otp",
                method: "POST",
             dataType:"json",
                data: { loginOTP: loginOTP,mob:mob}, // convert to JSON string
                success: function (response) {

                        showNotification('Login successful!');
                        window.location.href='/'

                },
                error: function () {
                    showNotification("Wrong OTP..");

                }
            });
        });
    });
</script>
</body>
</html>