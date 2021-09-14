import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/dashboard/provider.dart';
import 'package:sparepart/screens/profile_screen/offer/on_pressed_discount_screen.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen_brands.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen_categories.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen_feeatured_product.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';
import 'package:sparepart/dashboard/provider/brand_provider.dart';
import 'package:sparepart/dashboard/provider/brand_id_provider.dart';
import 'package:sparepart/screens/profile_screen/car_brands/car_brand_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  TopProductProvider topProductProvider;
  FeaturedProductProvider featuredProductProvider;
  BrandsProvider brandsProvider;
  CategoriesProvider categoriesProvider;
  BrandIdProvider brandIdProvider;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    topProductProvider =
        Provider.of<TopProductProvider>(context, listen: false);
    topProductProvider.init(context);
    topProductProvider.topProductProvider();
    featuredProductProvider =
        Provider.of<FeaturedProductProvider>(context, listen: false);
    featuredProductProvider.init(context);
    featuredProductProvider.featuredProductProvider();
    brandsProvider = Provider.of<BrandsProvider>(context, listen: false);
    brandsProvider.init(context);
    brandsProvider.brandsProvider();
    categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    categoriesProvider.init(context);
    brandIdProvider = Provider.of<BrandIdProvider>(context, listen: false);
    brandIdProvider.init(context);
    categoriesProvider.categoriesProvider();
    super.initState();
  }

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
                height: 290,
                decoration: BoxDecoration(
                  color: AppColor.purple,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage(AppAssets.yellowLogo),
                              height: 150,
                              width: 200,
                            ),
                            ClipOval(
                              child: Image(
                                image: AssetImage(AppAssets.pic),
                                height: 90,
                                width: 90,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, right: 18, bottom: 5),
                      child: EditTextWidget(
                        err: '',
                        textInputType: TextInputType.text,
                        controller: controller,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customCardTopProduct(titleText: 'Top Products'),
                      customCardFeaturedProduct(titleText: 'Featured Products'),
                      customCardBrands(titleText: 'Brands'),
                      customCardCategories(titleText: 'Categories')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customCardTopProduct({String titleText}) {
    return Consumer<TopProductProvider>(
      builder: (_, provider, __) {
        if (provider.productModel == null) {
          return Container();
        } else {
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
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderScreen(
                                        screenTitle: titleText,
                                      ))),
                          child: Row(
                            children: <Widget>[
                              TextViewWidget(
                                text: titleText,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600,
                                textSize: 18,
                              ),
                              Spacer(),
                              Text(
                                'See all',
                                style: GoogleFonts.abel(
                                  textStyle: TextStyle(
                                      color: AppColor.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: .0),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: AppColor.black,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: provider.productModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              var productLog = provider.productModel[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            color: AppColor.purple,
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OnPressedDiscountScreen(
                                                            imageText:
                                                                productLog
                                                                    .imgUrl,
                                                            priceText:
                                                                productLog.price
                                                                    .toString(),
                                                            descriptionText:
                                                                productLog
                                                                    .description,
                                                            categoryText:
                                                                productLog
                                                                    .category,
                                                            nameText:
                                                                productLog.name,
                                                          ))),
                                              child: Card(
                                                elevation: 3,
                                                shadowColor:
                                                    AppColor.editTextBackground,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      '$url${productLog?.imgUrl ?? ''}',
                                                  placeholder: (context, url) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      InkWell(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OnPressedDiscountScreen(
                                                        imageText:
                                                            productLog.imgUrl,
                                                        priceText: productLog
                                                            .price
                                                            .toString(),
                                                        descriptionText:
                                                            productLog
                                                                .description,
                                                        categoryText:
                                                            productLog.category,
                                                        nameText:
                                                            productLog.name,
                                                      ))),
                                          child: Text(
                                            productLog?.name ?? '',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.andika(
                                              textStyle: TextStyle(
                                                  color: AppColor.black,
                                                  letterSpacing: .0),
                                            ),
                                          ))
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    )),
              ));
        }
      },
    );
  }

  Widget customCardFeaturedProduct({String titleText}) {
    return Consumer<FeaturedProductProvider>(
      builder: (_, provider, __) {
        if (provider.featuredProductModel == null) {
          return Center(
              child: SpinKitCircle(
            color: AppColor.purple,
            size: 50,
          ));
        } else {
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
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OrderScreenFeaturedProduct(
                                        screenTitle: titleText,
                                      ))),
                          child: Row(
                            children: <Widget>[
                              TextViewWidget(
                                text: titleText,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600,
                                textSize: 18,
                              ),
                              Spacer(),
                              Text(
                                'See all',
                                style: GoogleFonts.abel(
                                  textStyle: TextStyle(
                                      color: AppColor.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: .0),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: AppColor.black,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: provider.featuredProductModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              var productLog =
                                  provider.featuredProductModel[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            color: AppColor.purple,
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OnPressedDiscountScreen(
                                                            imageText:
                                                                productLog
                                                                    .imgUrl,
                                                            priceText:
                                                                productLog.price
                                                                    .toString(),
                                                            descriptionText:
                                                                productLog
                                                                    .description,
                                                            categoryText:
                                                                productLog
                                                                    .category,
                                                            nameText:
                                                                productLog.name,
                                                          ))),
                                              child: Card(
                                                elevation: 3,
                                                shadowColor:
                                                    AppColor.editTextBackground,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      '$url${productLog?.imgUrl ?? ''}',
                                                  placeholder: (context, url) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OnPressedDiscountScreen(
                                                      imageText:
                                                          productLog.imgUrl,
                                                      priceText: productLog
                                                          .price
                                                          .toString(),
                                                      descriptionText:
                                                          productLog
                                                              .description,
                                                      categoryText:
                                                          productLog.category,
                                                      nameText: productLog.name,
                                                    ))),
                                        child: Text(
                                          productLog?.name ?? '',
                                          style: GoogleFonts.andika(
                                            textStyle: TextStyle(
                                                color: AppColor.black,
                                                letterSpacing: .0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    )),
              ));
        }
      },
    );
  }

  Widget customCardBrands({String titleText}) {
    return Consumer<BrandsProvider>(
      builder: (_, provider, __) {
        if (provider.brandsModel == null) {
          return Container();
        } else {
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
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderScreenBrands(
                                        screenTitle: titleText,
                                      ))),
                          child: Row(
                            children: <Widget>[
                              TextViewWidget(
                                text: titleText,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600,
                                textSize: 18,
                              ),
                              Spacer(),
                              Text(
                                'See all',
                                style: GoogleFonts.abel(
                                  textStyle: TextStyle(
                                      color: AppColor.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: .0),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: AppColor.black,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: provider.brandsModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              var productLog = provider.brandsModel[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            color: AppColor.purple,
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CarBrandScreen(
                                                            id: productLog.id,
                                                          ))),
                                              child: Card(
                                                elevation: 3,
                                                shadowColor:
                                                    AppColor.editTextBackground,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      '$url${productLog?.imgUrl ?? ''}',
                                                  placeholder: (context, url) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OnPressedDiscountScreen(
                                                      descriptionText: productLog
                                                              ?.description ??
                                                          '',
                                                      categoryText: '',
                                                      priceText: '',
                                                      imageText:
                                                          productLog.imgUrl,
                                                      nameText: productLog.name,
                                                    ))),
                                        child: Text(
                                          productLog?.name ?? '',
                                          style: GoogleFonts.andika(
                                            textStyle: TextStyle(
                                                color: AppColor.black,
                                                letterSpacing: .0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    )),
              ));
        }
      },
    );
  }

  Widget customCardCategories({String titleText}) {
    return Consumer<CategoriesProvider>(
      builder: (_, provider, __) {
        if (provider.categoriesModel == null) {
          return Container();
        } else {
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
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderScreenCategories(
                                        screenTitle: titleText,
                                      ))),
                          child: Row(
                            children: <Widget>[
                              TextViewWidget(
                                text: titleText,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600,
                                textSize: 18,
                              ),
                              Spacer(),
                              Text(
                                'See all',
                                style: GoogleFonts.abel(
                                  textStyle: TextStyle(
                                      color: AppColor.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: .0),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: AppColor.black,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: provider.categoriesModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              var productLog = provider.categoriesModel[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            color: AppColor.purple,
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OnPressedDiscountScreen(
                                                            imageText:
                                                                productLog
                                                                    .imgUrl,
                                                            priceText: '',
                                                            descriptionText: '',
                                                            categoryText: '',
                                                            nameText: productLog
                                                                .title,
                                                          ))),
                                              child: Card(
                                                elevation: 3,
                                                shadowColor:
                                                    AppColor.editTextBackground,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      '$url${productLog?.imgUrl ?? ''}',
                                                  placeholder: (context, url) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OnPressedDiscountScreen(
                                                      imageText:
                                                          productLog.imgUrl,
                                                      nameText:
                                                          productLog.title,
                                                      descriptionText: '',
                                                      categoryText: '',
                                                      priceText: '',
                                                    ))),
                                        child: Text(
                                          productLog?.title ?? '',
                                          style: GoogleFonts.andika(
                                            textStyle: TextStyle(
                                                color: AppColor.black,
                                                letterSpacing: .0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    )),
              ));
        }
      },
    );
  }
}
