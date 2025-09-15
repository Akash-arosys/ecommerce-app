class TPricingCalculator {
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    return 0.1;
  }

  static double getShippingCost(String location) {
    return 5.00;
  }

  static String calculateDiscountPercent(double price, double offerPrice) {
    if (price <= 0) return '0'; // Avoid division by zero or negative price
    double discount = price - offerPrice;
    double discountPercent = (discount / price) * 100;
    return '${discountPercent.ceil().toString()}%';
  }
}
