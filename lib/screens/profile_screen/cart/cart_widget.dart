import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/dashboard/provider.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

import 'add_to_cart_screen.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key key}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.add_shopping_cart,color: AppColor.black,),
          onPressed:()=>
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              ),),
        Positioned(
          right: 1,
          top: 3,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.red
            ),
            child: Consumer<TopProductProvider>(
              builder: (context,cartProvider,child){
                return TextViewWidget(
                  text: '${cartProvider.count}',
                  textSize: 9,
                  color: Colors.white,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
