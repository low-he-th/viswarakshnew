<!DOCTYPE html>
<html lang="en">
<head>
    <g:include view="layouts/head.gsp"/>
</head>
<body class="bg-green-50 natural-bg">
<g:include view="layouts/topBar.gsp"/>
<g:include view="layouts/sidebar.gsp"/>


<!-- Register Page -->
<div id="registerPage">
    <section class="py-16">
        <div class="max-w-md mx-auto bg-white rounded-xl shadow-lg p-8">
            <div class="text-center mb-8">
                <div class="text-4xl mb-4">🌿</div>
                <h2 class="text-2xl font-bold text-gray-900">Join VISHWARAKSHA</h2>
                <p class="text-gray-600">Create your account for natural wellness</p>
            </div>

            <div id="registerDetailsStep">
                <form id="registerForm">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Full Name</label>
                        <input type="text" id="registerName" required name="registerName" autocomplete="off"
                               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"
                               placeholder="Enter your full name">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Email Address</label>
                        <input type="email" id="registerEmail" required name="registerEmail" autocomplete="off"
                               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500"
                               placeholder="Enter your email">
                    </div>
                    <div class="mb-6">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Phone Number</label>
                        <div class="flex">
                            <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 border border-r-0 border-gray-300 rounded-l-lg">+91</span>
                            <input type="number" id="registerPhone" name="registerPhone" autocomplete="off"  required pattern="[0-9]{10}" maxlength="10"
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
                <form id="verifyRegisterOTP">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-medium mb-2">Enter OTP</label>
                        <input type="number" id="registerOTP" name="registerOTP" autocomplete="off" required pattern="[0-9]{6}" maxlength="6"
                               class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-green-500 text-center text-2xl tracking-widest"
                               placeholder="000000">
                        <p class="text-sm text-gray-600 mt-2">OTP sent to <span id="registerPhoneDisplay"></span></p>
                    </div>
                    <div class="flex space-x-3">
%{--                        <button type="button" onclick="showRegisterDetailsStep()"--}%
%{--                                class="flex-1 border border-gray-300 text-gray-700 py-2 rounded-lg font-semibold hover:bg-gray-50 transition duration-300">--}%
%{--                            Back--}%
%{--                        </button>--}%
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
                    <button onclick="window.location.href='login'" class="text-green-600 hover:text-green-800 font-medium">Sign in
                    here
                    </button>
                </p>
            </div>
        </div>
    </section>
</div>

<g:include view="layouts/footer.gsp"/>

<script>
    function showRegisterDetailsStep() {
        document.getElementById('registerDetailsStep').classList.remove('hidden');
        document.getElementById('registerOTPStep').classList.add('hidden');
    }

    function resendRegisterOTP() {

        var registerPhone = $('#registerPhone').val();
        var registerName = $('#registerName').val();
        var registerEmail = $('#registerEmail').val();

        $.ajax({
            url: "get/otp/register",
            method: "POST",
            dataType:"json",
            data:{resendOtp:true ,registerEmail: registerEmail,registerName:registerName,registerPhone:registerPhone }, // convert to JSON string
            success: function (response) {

                    // Show OTP step
                document.getElementById('registerDetailsStep').classList.add('hidden');
                document.getElementById('registerOTPStep').classList.remove('hidden');
                showNotification('OTP resent!');

            },
            error: function (jqXHR) {
                if (jqXHR.status === 401) {
                    showNotification("Phone number already registered.Please Login.");
                } else {
                    showNotification("An error occurred. Please try again.");
                }

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
        $('#registerForm').on("submit", function (e) {
            e.preventDefault(); // prevent page reload


            var registerPhone = $('#registerPhone').val();
            var registerName = $('#registerName').val();
            var registerEmail = $('#registerEmail').val();
            if(registerPhone.length!==10){
                showNotification("Wrong Phone Number..");
                return
            }
            $.ajax({
                url: "get/otp/register",
                method: "POST",
                dataType:"json",
                data:{ registerEmail: registerEmail,registerName:registerName,registerPhone:registerPhone }, // convert to JSON string
                success: function (response) {

                        document.getElementById('registerDetailsStep').classList.add('hidden');
                        document.getElementById('registerOTPStep').classList.remove('hidden');
                        showNotification('OTP sent to your phone!');

                },
                error: function () {
                    showNotification("Phone number not registered.Please Register.");

                }
            });
        });




        $('#verifyRegisterOTP').on("submit", function (e) {
            e.preventDefault(); // prevent page reload
            var registerPhone = $('#registerPhone').val();
            var registerOTP = $('#registerOTP').val();
            if(registerOTP.length!==5){
                showNotification("Wrong OTP..");
                return
            }
            if(registerPhone.length!==10){
                showNotification("Wrong Phone Number..");
                return
            }
            $.ajax({
                url: "verify/otp/register",
                method: "POST",
                dataType:"json",
                data: { registerOTP: registerOTP,registerPhone:registerPhone}, // convert to JSON string
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