import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {

  bool isExpanded=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shpping Cart"),
      ),
      body: Center(
        child: GestureDetector(

          onTap: (){
            setState(() {
              isExpanded=!isExpanded;
            });
          },

          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: isExpanded?200:80,
            height: 60,
            decoration: BoxDecoration(
              color: isExpanded?Colors.green:Colors.blue,
              borderRadius: BorderRadius.circular(isExpanded?30:10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(isExpanded?Icons.check:Icons.shopping_cart,color: Colors.white,),
                if(isExpanded)
                  Text("Added to cart!",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
              ],
            )
          ),
        ),
      ),
    );
  }
}
