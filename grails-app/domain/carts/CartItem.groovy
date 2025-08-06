package carts

import products.Product

class CartItem {
    Product product
    Integer quantity

    static constraints = {
        product nullable: false
        quantity min: 1
    }

    static mapWith = "mongo"

}
