import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sparepart/dashboard/model/model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import '../../../main.dart';
import 'add_to_cart_screen.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key key}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 5),
      child: Stack(
        children: [
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: AppColor.black,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            ),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.red),
              child: ValueListenableBuilder(
                valueListenable: Hive.box<ProductModel>(productName).listenable(),
                builder: (BuildContext context, Box<ProductModel> box, _) {
                  if (box.values.isEmpty)
                    return Container();
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextViewWidget(
                      text: '${box.values.length.toString()}',
                      textSize: 10,
                      color: Colors.white,
                    ),
                  );
                },),
            ),
          )
        ],
      ),
    );
  }
}
