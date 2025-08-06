package viswaraksh

import products.Product

import java.text.SimpleDateFormat


class ProductController {

    def product() {}

    def addToCart() {
        try {
            Product product = new Product()
            product.setName(params.name)
            product.setDescription(params.desc)
            def price = params.double("price")
            product.setPrice(price)
            product.setWeight(params.weight)
            product.setIngredients(params.ingredients)
            product.setBenefits(params.benefits)
            product.setExpiry(params.expiry)
            def offer = params.int("offer")
            product.setOffer(offer)
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy")
            if(params.mfgDate != null)
            {
                product.setMfgDate(formatter.parse(params.mfgDate))
            }

        }
        catch (Exception ex) {

        }
    }
}
