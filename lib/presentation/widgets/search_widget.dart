import 'package:flutter/material.dart';



class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey
        )
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         
         const Expanded(child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey, size: 25,),
                hintText: "Search on Amazon...",
                border: InputBorder.none
              ),
            ),),
          


          Row(
            children: [
              IconButton(onPressed: (){}, icon: Image.asset("assets/images/Scan.png")),
          IconButton(onPressed: (){}, icon: Image.asset("assets/images/Microphone.png"))
            ],
          )
        ],
      ),
    );
  }
}