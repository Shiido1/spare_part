import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/dashboard/spare_part/spare_part_provider.dart';
import 'package:sparepart/screens/profile_screen/offer/on_pressed_discount_screen.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/widgets/text_widget.dart';

class OrderScreenSparePart extends StatefulWidget {
  final String screenTitle;
  const OrderScreenSparePart({Key key, this.screenTitle}) : super(key: key);

  @override
  _OrderScreenSparePartState createState() => _OrderScreenSparePartState();
}

class _OrderScreenSparePartState extends State<OrderScreenSparePart> {
  bool isOnTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  color: AppColor.purple,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.screenTitle == null
                          ? Container()
                          : IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: AppColor.yellow,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                      TextViewWidget(
                        text: widget.screenTitle == null
                            ? "Order"
                            : widget.screenTitle,
                        color: AppColor.yellow,
                        fontWeight: FontWeight.bold,
                        textSize: 24,
                      ),
                      SizedBox(
                        height: 70,
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
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        container(text: 'All Order'),
                        container(text: 'Pending'),
                        container(text: 'Processing'),
                        container(
                          text: 'Delivery',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    orderItemContainer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget container({String text}) => InkWell(
        onTap: () {
          setState(() {
            isOnTap = !isOnTap;
          });
        },
        child: Container(
          height: 25,
          width: 75,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.black),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: isOnTap == true ? AppColor.purple : Colors.white),
          child: Center(
            child: TextViewWidget(
              text: '$text',
              color: isOnTap == true ? AppColor.yellow : AppColor.black,
            ),
          ),
        ),
      );

  Widget orderItemContainer() => Consumer<SparePartProvider>(
        builder: (BuildContext context, provider1, Widget child) {
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: provider1.sparePartModel.products.length,
            itemBuilder: (BuildContext context, int index) {
              var productLog = provider1.sparePartModel.products[index];
              return InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>OnPressedDiscountScreen(
                    id: productLog.id,
                    imageText: productLog.imgUrl,
                    priceText: productLog.price,
                    descriptionText: productLog.description,
                    categoryText: productLog.category,
                    nameText: productLog.name,
                    discount: productLog.discount,
                    year: productLog.year,
                    weight: productLog.weightInKg,
                  )
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 2,
                        shadowColor: AppColor.grey,
                        child: CachedNetworkImage(
                          imageUrl: '$url${productLog.imgUrl}',
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextViewWidget(
                            text: '${productLog.name}',
                            color: AppColor.black,
                            textSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextViewWidget(
                              text:
                                  getNairaSign(context, '${productLog.price}'),
                              fontWeight: FontWeight.bold,
                              textSize: 16,
                              color: AppColor.purple),
                        ],
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      width: 15,
                    )),
                    Column(
                      children: [
                        TextViewWidget(
                            text: '${productLog?.price??''}',
                            color: AppColor.black),
                        TextViewWidget(
                            text: '${productLog?.year??''}',
                            color: AppColor.black),
                        TextViewWidget(
                            text: '${productLog?.weightInKg??''}',
                            color: AppColor.black)
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 0.7,
                color: Colors.black26,
              );
            },
          );
        },
      );
}
