import 'package:bloc/bloc.dart';
import 'package:flutter_structure/models/product_model.dart';
import 'package:flutter_structure/repository/products_repository.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  ProductsRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    

    on<ProductEvent>((event, emit)async{


      if(event is GetProduct){
        try {

        emit(Loading());
        final result = await repository.getProducts();
        emit(Loaded(result));


        } catch (e) {
          print(e.toString());
          emit(Failed("Request failed"));
        }
      }



    });



  }



}
