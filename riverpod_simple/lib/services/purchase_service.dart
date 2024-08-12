import 'package:riverpod/riverpod.dart';
import 'package:riverpod_simple/models/purchase.dart';

class PurchaseService {
  final Ref container;
  final List<Purchase> _purchases = [];

  PurchaseService(this.container);

  void addPurchase(String customerName, String productName) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    final customerService = container.read(customerServiceProvider);
    final productService = container.read(productServiceProvider);
    final customer = customerService.customers.firstWhereOrNull(
      (customer) => customer.name == customerName,
    );

    final product = productService.products.firstWhereOrNull(
      (product) => product.name == productName,
    );

    if (customer != null && product != null) {
      _purchases.add(Purchase(customer, product));
      print('${customer.name} bought ${product.name} (\$${product.price}).');
    } else {
      print('Customer or Product not found.');
    }
  }

  void viewPurchases() {
    if (_purchases.isEmpty) {
      print('No purchases available.');
    } else {
      print('Purchases:');
      for (var purchase in _purchases) {
        print(purchase);
      }
    }
  }

  List<Purchase> get purchases => _purchases;
}