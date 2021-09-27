import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/screens/product_screen/product_provider.dart';
import 'package:sparepart/screens/profile_screen/cart/cart_widget.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';
import 'add_to_cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class OnPressedDiscountScreen extends StatefulWidget {
  final String imageText;
  final int priceText;
  final String categoryText;
  final String nameText;
  final String descriptionText;
  final int discount;
  final String year;
  final String weight;
  final String id;

  const OnPressedDiscountScreen(
      {Key key,
      this.imageText,
      this.weight,
      this.year,
      this.priceText,
      this.categoryText,
      this.nameText,
      this.descriptionText,
      this.discount,
      this.id})
      : super(key: key);

  @override
  _OnPressedDiscountScreenState createState() =>
      _OnPressedDiscountScreenState();
}

class _OnPressedDiscountScreenState extends State<OnPressedDiscountScreen> {
  bool onTap, onTapRecentProduct = true;
  Count countProvider;
  double discountPrice;
  ProductProvider productProvider;

  calculateDiscount() {
    double discount = widget.discount * widget.priceText / 100;
    discountPrice = widget.priceText - discount;
    return discountPrice;
  }

  @override
  void initState() {
    countProvider = Provider.of<Count>(context, listen: false);
    countProvider.init(context);
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.init(context);
    productProvider.productProvider(widget.id);
    calculateDiscount();
    super.initState();
  }

  text(String text1, String text2) => RichText(
        text: new TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(
                text: '$text1',
                style: new TextStyle(fontWeight: FontWeight.w400)),
            new TextSpan(
                text: '$text2',
                style: new TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      );

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
      body: Consumer2<Count, ProductProvider>(
          builder: (_, provider, provider2, __) {
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
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Card(
                            elevation: 2,
                            shadowColor: AppColor.grey,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '$url${provider2?.gProductModel?.product?.imgUrl ?? ''}',
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Card(
                            elevation: 2,
                            shadowColor: AppColor.grey,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '$url${provider2?.gProductModel?.product?.imgUrl1 ?? ''}',
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Card(
                            elevation: 2,
                            shadowColor: AppColor.grey,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '$url${provider2?.gProductModel?.product?.imgUrl2 ?? ''}',
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
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
                          height: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: TextViewWidget(
                                          textAlign: TextAlign.center,
                                          text: widget.nameText == ''
                                              ? ''
                                              : widget.nameText,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.black,
                                          textSize: 21,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, top: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextViewWidget(
                                                    text: getNairaSign(
                                                        context, discountPrice),
                                                    color: AppColor.black,
                                                    textSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    getNairaSign(context,
                                                        widget.priceText),
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontSize: 15,
                                                        color: AppColor.grey),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  text('Maker:',
                                                      '${provider2?.gProductModel?.product?.maker?.name ?? ''}'),
                                                  text('Car:',
                                                      '${provider2?.gProductModel?.product?.model?.car?.name ?? ''}'),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TextViewWidget(
                                                        text: 'Year: ',
                                                        color: AppColor.black,
                                                        textSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      TextViewWidget(
                                                        text: widget.year ?? '',
                                                        color: AppColor.black,
                                                        textSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TextViewWidget(
                                                        text: 'Product Code: ',
                                                        color: AppColor.black,
                                                        textSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      TextViewWidget(
                                                        text: provider2
                                                                ?.gProductModel
                                                                ?.product
                                                                ?.productCode ??
                                                            '',
                                                        color: AppColor.black,
                                                        textSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TextViewWidget(
                                                        text: 'Weight: ',
                                                        color: AppColor.black,
                                                        textSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      TextViewWidget(
                                                        text: widget.weight ==
                                                                null
                                                            ? ''
                                                            : widget.weight +
                                                                'kg',
                                                        color: AppColor.black,
                                                        textSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color:
                                                              AppColor.yellow,
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 6,
                                                        ),
                                                        TextViewWidget(
                                                          text: '4.5',
                                                          color: AppColor.black,
                                                          textSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextViewWidget(
                                              text: widget.categoryText,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.black,
                                              textSize: 17,
                                            ),
                                            text('Model:',
                                                '${provider2?.gProductModel?.product?.model?.name ?? ''}')
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 190,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: AppColor.dividerColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Recent product',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                        color: AppColor.black, fontSize: 19),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: provider2?.gProductModel
                                          ?.recentProducts?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    var value = provider2
                                        .gProductModel.recentProducts[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OnPressedDiscountScreen(
                                                      id: value.id,
                                                      imageText: value.imgUrl,
                                                      priceText: value.price,
                                                      descriptionText:
                                                          value.description,
                                                      categoryText:
                                                          value.category,
                                                      nameText: value.name,
                                                      discount: value.discount,
                                                      weight: value.weightInKg,
                                                      year: value.year,
                                                    )));
                                      },
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Container(
                                                height: 70,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Card(
                                                  elevation: 3,
                                                  shadowColor: AppColor
                                                      .editTextBackground,
                                                  child: provider2.gProductModel
                                                                  .recentProducts ==
                                                              null ||
                                                          provider2
                                                              .gProductModel
                                                              .recentProducts
                                                              .isEmpty
                                                      ? Container()
                                                      : Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            CachedNetworkImage(
                                                              imageUrl:
                                                                  '$url${value?.imgUrl ?? ''}',
                                                              placeholder: (context,
                                                                      url) =>
                                                                  CircularProgressIndicator(),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error),
                                                            ),
                                                            CachedNetworkImage(
                                                              imageUrl:
                                                                  '$url${value?.imgUrl1 ?? ''}',
                                                              placeholder: (context,
                                                                      url) =>
                                                                  CircularProgressIndicator(),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error),
                                                            ),
                                                            CachedNetworkImage(
                                                              imageUrl:
                                                                  '$url${value?.imgUrl2 ?? ''}',
                                                              placeholder: (context,
                                                                      url) =>
                                                                  CircularProgressIndicator(),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error),
                                                            )
                                                          ],
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Text(
                                              '${value?.name ?? ''}',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.andika(
                                                textStyle: TextStyle(
                                                    color: AppColor.black,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: AppColor.purple,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
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
                                            text: 'Description',
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
                                text: getNairaSign(context, discountPrice),
                                color: AppColor.black,
                                textSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              InkWell(
                                onTap: () => provider.addingToCart(
                                    name: widget.nameText,
                                    price: discountPrice.toInt(),
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
