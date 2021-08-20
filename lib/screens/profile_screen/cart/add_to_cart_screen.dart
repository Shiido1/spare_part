import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sparepart/dashboard/model/model.dart';
import 'package:sparepart/main.dart';
import 'package:sparepart/screens/profile_screen/payment/payment_screen.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/widgets/text_widget.dart';


class CartScreen extends StatefulWidget {

  const CartScreen({Key key,}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: orderItemContainer()),
    );
  }

  Widget orderItemContainer()=>Column(
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
      ValueListenableBuilder(
        valueListenable: Hive.box<ProductModel>(productName).listenable(),

        builder: (BuildContext context,  Box<ProductModel> box, _) {
          if (box.values.isEmpty)
            return Center(
              child: Text(
                'No item',
                style: TextStyle(color: AppColor.black),),
            );
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:box.values.length,
            itemBuilder: (context,index){
              ProductModel item = box.get(index);
              return Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10,left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: CachedNetworkImage(
                              imageUrl: '${item?.imgUrl??''}',
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextViewWidget(
                                text: '${item?.name??''}',
                                textSize: 15, color: AppColor.black,),
                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: TextViewWidget(
                                  text: '\u20A6${item?.price??''}',
                                  textSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: AppColor.black,),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: (){},
                                color: AppColor.black,),
                              SizedBox(
                                height: 20,width: 15,
                                child: Container(
                                  color: AppColor.purple,
                                  child:TextViewWidget(
                                    text: '',
                                    textSize: 9,
                                    color: Colors.white,
                                  ),),),
                              IconButton(
                                icon: Icon(Icons.minimize_sharp),
                                onPressed: (){},
                                color: AppColor.black,)
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:100,right: 15),
                      child: Divider(thickness: 0.2,color: AppColor.black,),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.only(left:20,right: 20.0,top: 40,bottom: 40),
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
      )
    ],
  );
}
