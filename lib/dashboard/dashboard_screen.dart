import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/dashboard/provider.dart';
import 'package:sparepart/screens/profile_screen/offer/on_pressed_discount_screen.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  TopProductProvider topProductProvider;
  TextEditingController controller = TextEditingController();
  String url = 'https://gapaautoparts.com';

  @override
  void initState() {
    topProductProvider = Provider.of<TopProductProvider>(context, listen: false);
    topProductProvider.init(context);
    topProductProvider.topProductProvider();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 290,
              decoration: BoxDecoration(
                color: AppColor.purple,
              ),
              // stack and add image profile and position it
              child: Padding(
                padding: const EdgeInsets.only(top: 185,left: 25,right: 25),
                child: EditTextWidget(
                  err: '', textInputType: TextInputType.text,
                  controller: controller,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))
                ),
                child: Column(
                  children: [
                    customCard(titleText: 'Top Products'),
                    Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customCard({String titleText}) {
    return  Consumer<TopProductProvider>(
      builder: (_,provider,__) {
        if (provider.productModel == null) {
          return Center(
              child: SpinKitCircle(
                color: AppColor.purple,
                size: 50,
              ));
        }else{
          return Container(
            height: 220,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: AppColor.yellow,
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap:()=> Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OrderScreen(
                                    screenTitle: titleText,
                                  ))),
                      child: Row(
                        children: <Widget>[
                          TextViewWidget(
                            text: titleText,
                            color: AppColor.black,
                            fontWeight: FontWeight.w500,
                            textSize: 16,),
                          Spacer(),
                          TextViewWidget(
                            text: 'See all',
                            color: AppColor.purple,
                            textSize: 14,)
                        ],
                      ),
                    ),
                    Divider(thickness: 0.5,color: AppColor.black,),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: provider.productModel.length,
                        itemBuilder: (BuildContext context, int index){
                          var productLog = provider.productModel[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      color:AppColor.purple,
                                      height: 152,
                                      width: 115,
                                      child: InkWell(
                                        onTap: ()=>Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OnPressedDiscountScreen(
                                                      imageText: productLog.imgUrl,
                                                      priceText: productLog.price.toString(),
                                                      descriptionText: productLog.description,
                                                      categoryText: productLog.category,
                                                      nameText: productLog.name,
                                                    ))),
                                        child: CachedNetworkImage(
                                          imageUrl: '$url${productLog?.imgUrl ?? ''}',
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                          // maxHeightDiskCache: 115,
                                          // maxWidthDiskCache: 110,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 14,),
                                  InkWell(
                                    onTap:()=>Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OnPressedDiscountScreen(
                                                  imageText: productLog.imgUrl,
                                                  priceText: productLog.price.toString(),
                                                  descriptionText: productLog.description,
                                                  categoryText: productLog.category,
                                                  nameText: productLog.name,
                                                ))),
                                    child: TextViewWidget(
                                        text: productLog?.name??'', color: AppColor.black,textSize: 14),
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                )
              )
              ,
            )
          );
        }
      },
    );
  }
}