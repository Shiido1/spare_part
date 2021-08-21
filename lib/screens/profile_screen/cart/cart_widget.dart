import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/dashboard/provider.dart';
import 'package:sparepart/screens/profile_screen/offer/add_to_cart_provider.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'add_to_cart_screen.dart';


class CartWidget extends StatelessWidget {
  const CartWidget({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<Count>(
      builder: (_,provider,__){
        return Padding(
          padding: const EdgeInsets.only(right:10.0,top: 5),
          child: Stack(
            children: [
              IconButton(
                icon: Icon(Icons.add_shopping_cart,color: AppColor.black,),
                onPressed:()=>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    ),),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.red
                  ),
                  child: Consumer<TopProductProvider>(
                    builder: (context,cartProvider,child){
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextViewWidget(
                          text: '${provider.count.toString()}',
                          textSize: 10,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
