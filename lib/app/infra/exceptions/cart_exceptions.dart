class CartException implements Exception {
  final String errorMessage;

  CartException([this.errorMessage = 'Error when running shopping cart']);

  factory CartException.fromCode(String code) {
    switch (code) {
      case 'product-in-cart':
        return CartException("Product is already in the cart");
      case 'add-to-cart':
        return CartException("Unable to add this product to cart");
      default:
        return CartException();
    }
  }
}
