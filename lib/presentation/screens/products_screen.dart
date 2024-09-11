import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/bloc/product_bloc.dart';
import 'package:flutter_structure/presentation/widgets/product_card_widget.dart';
import 'package:flutter_structure/presentation/widgets/search_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(image: AssetImage('assets/images/logo.png')),
        actions: [
           const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Image(image: AssetImage('assets/images/Location-Icon.png'), height: 80,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deliver to"),
                  Text("New York 10150")
                ],
              )
            ],
          ),

          IconButton(onPressed: (){}, icon: const Image(image: AssetImage('assets/images/Notifications.png')))
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchWidget(),
            AspectRatio(aspectRatio: 16/9, child: Container(
              color: Colors.grey,
              alignment: Alignment.center,
              child: const Text('Slider placeholder'),
            ),),
        
        
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Today's Deal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
            ),
        
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state){
              if(state is Loaded){
                return SizedBox(
              height: MediaQuery.of(context).size.width * 0.6,
              child: ListView.builder(
                itemCount: state.products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                return ProductCardWidget(productImage: state.products[index].image, title: state.products[index].title, price: state.products[index].price, rating: state.products[index].rating.rate, count: state.products[index].rating.count);
              }),
            );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                  ],
                );
              }
            })
          ],
        ),
      )
    );
  }
}