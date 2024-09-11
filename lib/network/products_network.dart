import 'package:flutter_structure/utils/endpoints.dart';

class ProductsNetwork {


  Future<List<dynamic>> requestProducts()async{
    final res = await Endpoints.client.get(Endpoints.PRODUCTS);
    return res.data;
  }
}

// http
// dio

// get
// post
// put
// delete


// patch
// headers