import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget(
      {super.key,
      required this.productImage,
      required this.title,
      required this.price,
      required this.rating,
      required this.count});

  final String productImage;
  final String title;
  final double price;
  final double rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Image(
                    image: NetworkImage(productImage),
                    fit: BoxFit.contain,
                    height: 100,
                  ),
                ),
              ],
            ),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis),
            RatingBar.builder(
              initialRating: rating,
              minRating: 0,
              ignoreGestures: true,
              itemSize: 25,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (r){},
            ),

            Text("\$$price", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
          ],
        ),
    );
  }
}
