import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/dashboard/model.dart';
import 'package:sparepart/dashboard/provider.dart';
import 'package:sparepart/screens/profile_screen/payment/payment_screen.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';


class CartScreen extends StatefulWidget {

  const CartScreen({Key key,}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<ProductModel> items = [
    ProductModel(
      name: ProductModel().name,
      imgUrl: ProductModel().imgUrl,
      price: ProductModel().price)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/4,
                decoration: BoxDecoration(
                  color: AppColor.purple,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,color: AppColor.yellow,),
                      onPressed: ()=>Navigator.pop(context),),
                    TextViewWidget(
                      text: "Cart",
                      color: AppColor.yellow,
                      fontWeight: FontWeight.bold,
                      textSize: 24,),
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(AppAssets.pic),
                        ),

                      ),
                    ),

                  ],
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  orderItemContainer(),
                  Padding(
                    padding: const EdgeInsets.only(left:10,right: 10.0,top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextViewWidget(
                          text: 'Total: N70,000',
                          color: AppColor.black,
                          textSize: 20,
                          fontWeight: FontWeight.bold,),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaymentScreen()),
                            );
                          },
                          child: Container(
                            width: 90,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: AppColor.purple,
                            ),
                            child: Center(
                              child: TextViewWidget(
                                  text: 'Purchase',
                                  textSize: 18,

                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  Widget orderItemContainer()=>Container(
    color: Colors.white,
    child: ListView.builder(
      shrinkWrap: true,
      itemCount:items.length,
      itemBuilder: (context,index){
        var item = items[index];
        return Consumer<TopProductProvider>(builder: (context,cartProvider,child){
          return ListTile(
            leading: Container(
              width: 100,
              height: 100,
              child: CachedNetworkImage(
                imageUrl: '${item.imgUrl}',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            title: TextViewWidget(
              text: '${item.name}',
              textSize: 15, color: AppColor.black,),
            subtitle: TextViewWidget(
              text: '${item.price}',
              textSize: 15, color: AppColor.black,),
            trailing:  Column(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: ()=>cartProvider.add(item),
                  color: AppColor.black,),
                SizedBox(
                  height: 20,width: 15,
                  child: Container(
                    color: AppColor.purple,
                    child:TextViewWidget(
                      text: '${cartProvider.count}',
                      textSize: 9,
                      color: Colors.white,
                    ),),),
                IconButton(
                  icon: Icon(Icons.minimize_sharp),
                  onPressed: (){},
                  color: AppColor.black,)
              ],
            ),
          );
        });
      },
      // Column(
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Image(
      //           image: AssetImage(
      //             AppAssets.tyreWheel,
      //           ),
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             TextViewWidget(
      //                 text: 'Wheels & Tires',
      //                 textSize: 18,
      //                 fontWeight: FontWeight.w500,
      //                 color: AppColor.black),
      //             SizedBox(height: 10,),
      //             TextViewWidget(
      //                 text: 'Spare Part',
      //                 textSize: 17,
      //                 color: AppColor.grey),
      //             SizedBox(height: 10,),
      //             TextViewWidget(
      //                 text: 'N10000',
      //                 fontWeight: FontWeight.bold,
      //                 color: AppColor.purple),
      //
      //           ],
      //         ),
      //         Column(
      //           children: [
      //             IconButton(
      //               icon: Icon(Icons.add),
      //               onPressed: (){},
      //             color: AppColor.black,),
      //             SizedBox(
      //               height: 20,width: 15,
      //               child: Container(color: AppColor.purple,),),
      //             IconButton(
      //                 icon: Icon(Icons.minimize_sharp),
      //                 onPressed: (){},
      //             color: AppColor.black,)
      //           ],
      //         ),
      //       ],
      //     ),
      //     Divider(thickness: 0.5, color: Colors.black26,)
      //   ],
      // ),
    ),
  );
}
