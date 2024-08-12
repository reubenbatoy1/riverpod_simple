import 'package:riverpod/riverpod.dart';
import 'package:riverpod_simple/services/customer_service.dart';
import 'package:riverpod_simple/services/product_service.dart';
import 'package:riverpod_simple/services/purchase_service.dart';

final productServiceProvider = Provider((ref) => ProductService(ref));
final customerServiceProvider = Provider((ref) => CustomerService(ref));
final purchaseServiceProvider = Provider((ref) => PurchaseService(ref));

