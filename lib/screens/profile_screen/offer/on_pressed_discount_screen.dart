import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/screens/profile_screen/cart/cart_widget.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';
import 'add_to_cart_provider.dart';

class OnPressedDiscountScreen extends StatefulWidget {
  final String imageText;
  final String priceText;
  final String categoryText;
  final String nameText;
  final String descriptionText;

  const OnPressedDiscountScreen(
      {Key key,
      this.imageText,
      this.priceText,
      this.categoryText,
      this.nameText,
      this.descriptionText})
      : super(key: key);

  @override
  _OnPressedDiscountScreenState createState() =>
      _OnPressedDiscountScreenState();
}

class _OnPressedDiscountScreenState extends State<OnPressedDiscountScreen> {
  bool onTap = true;
  Count countProvider;

  @override
  void initState() {
    countProvider = Provider.of<Count>(context, listen: false);
    countProvider.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.yellow,
      appBar: AppBar(
        actions: [CartWidget()],
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<Count>(builder: (_, provider, __) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: CachedNetworkImage(
                  imageUrl: '$url${widget.imageText}',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 16.0),
                child: Container(
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: TextViewWidget(
                                          textAlign: TextAlign.center,
                                          text: widget.nameText == ''
                                              ? ''
                                              : widget.nameText,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.black,
                                          textSize: 22,
                                        ),
                                      ),
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextViewWidget(
                                              text: widget.priceText == ''
                                                  ? ''
                                                  : getNairaSign(context,
                                                      widget.priceText),
                                              color: AppColor.black,
                                              textSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: AppColor.yellow,
                                                  size: 20,
                                                ),
                                                TextViewWidget(
                                                  text: '4.5',
                                                  color: AppColor.black,
                                                  textSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      TextViewWidget(
                                        text: widget.categoryText == ''
                                            ? ''
                                            : widget.categoryText,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black,
                                        textSize: 17,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: AppColor.purple,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              // height: 70,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              setState(() => onTap = true),
                                          child: TextViewWidget(
                                            text: 'Details',
                                            color: onTap == true
                                                ? AppColor.black
                                                : AppColor.grey,
                                            textSize: 17,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () =>
                                              setState(() => onTap = false),
                                          child: TextViewWidget(
                                            text: 'Reviews (300)',
                                            color: onTap == true
                                                ? AppColor.grey
                                                : AppColor.black,
                                            textSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 0.5,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: onTap == true
                                    ? TextViewWidget(
                                        text: widget.descriptionText == null
                                            ? ''
                                            : widget.descriptionText,
                                        color: Colors.white,
                                        textSize: 17,
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16.0, 35, 16.0, 35),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            EditTextWidget(
                                              err: '',
                                              textInputType: null,
                                              controller: null,
                                            ),
                                            Container(
                                              width: 100,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: TextViewWidget(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.bold,
                                                  text: 'Summit',
                                                  textSize: 16,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: Container(
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextViewWidget(
                                text: widget.priceText == ''
                                    ? ''
                                    : getNairaSign(context, widget.priceText),
                                color: AppColor.black,
                                textSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              InkWell(
                                onTap: ()=>
                                  provider.addingToCart(
                                      name: widget.nameText,
                                      price: int.parse(widget.priceText),
                                      image: '$url${widget.imageText}'),
                                child: Container(
                                  width: 150,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: AppColor.purple,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.shoppingCart,
                                          color: Colors.white,
                                        ),
                                        TextViewWidget(
                                            text: 'Add To Cart',
                                            color: Colors.white)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
