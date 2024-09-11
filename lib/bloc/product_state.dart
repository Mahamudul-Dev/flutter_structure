part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

// loading
final class Loading extends ProductState {}

// loaded
final class Loaded extends ProductState {
  final List<ProductModel> products;
  Loaded(this.products);
}


// failed
final class Failed extends ProductState {
  final String message;
  Failed(this.message);
}