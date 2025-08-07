package viswaraksh

class PaymentController {

    def payment() {
        String userId = session.getAttribute("userId")

            render(view: "payment", model: [userId: userId])

    }


    def addToCart(){

    }


    def addToCartIncrement(){

    }

    def addToCartDecrement(){

    }

    def addToCartRemove(){

    }



}
