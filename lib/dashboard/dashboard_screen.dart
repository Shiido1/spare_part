import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/dashboard/provider.dart';
import 'package:sparepart/dashboard/spare_part/spare_part_provider.dart';
import 'package:sparepart/screens/profile_screen/offer/on_pressed_discount_screen.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen_brands.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen_categories.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen_feeatured_product.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen_spare_part.dart';
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
  SparePartProvider sparePartProvider;
  TextEditingController controller = TextEditingController();
  String image = '';

  @override
  void initState() {
    init();
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
    sparePartProvider = Provider.of<SparePartProvider>(context, listen: false);
    sparePartProvider.init(context);
    sparePartProvider.sparePartProvider();
    super.initState();
  }

  init() async {
    image = await preferencesHelper.getStringValues(key: 'profile_image');
    setState(() {});
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
                            Stack(
                              children: [
                                Positioned(
                                  bottom: 91,
                                  left: 10,
                                  child: Text(
                                    'Welcome',
                                    style: GoogleFonts.abrilFatface(
                                      textStyle: TextStyle(
                                          color: AppColor.yellow,
                                          fontSize: 27,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                Image(
                                  image: AssetImage(AppAssets.yellowLogo),
                                  height: 150,
                                  width: 200,
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 65,
                                width: 60,
                                child: image.isNotEmpty
                                    ? ClipOval(
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: image,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      )
                                    : Container()),
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
                      customCardCategories(titleText: 'Categories'),
                      customCardSparePartProduct(titleText: 'Spare Part')
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
                                                            id: productLog.id,
                                                            imageText:
                                                                productLog
                                                                    .imgUrl,
                                                            priceText:
                                                                productLog
                                                                    .price,
                                                            descriptionText:
                                                                productLog
                                                                    .description,
                                                            categoryText:
                                                                productLog
                                                                    .category,
                                                            nameText:
                                                                productLog.name,
                                                            discount: productLog
                                                                .discount,
                                                            year:
                                                                productLog.year,
                                                            weight: productLog
                                                                .weightInKg,
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
                                        height: 8,
                                      ),
                                      InkWell(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OnPressedDiscountScreen(
                                                        imageText:
                                                            productLog.imgUrl,
                                                        priceText:
                                                            productLog.price,
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
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.andika(
                                              textStyle: TextStyle(
                                                color: AppColor.black,
                                              ),
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

  Widget customCardSparePartProduct({String titleText}) {
    return Consumer<SparePartProvider>(
      builder: (_, provider, __) {
        if (provider.sparePartModel == null) {
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
                                  builder: (context) => OrderScreenSparePart(
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
                            itemCount: provider.sparePartModel.products.length,
                            itemBuilder: (BuildContext context, int index) {
                              var productLog =
                                  provider.sparePartModel.products[index];
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
                                                            id: productLog.id,
                                                            imageText:
                                                                productLog
                                                                    .imgUrl,
                                                            priceText:
                                                                productLog
                                                                    .price,
                                                            descriptionText:
                                                                productLog
                                                                    .description,
                                                            categoryText:
                                                                productLog
                                                                    .category,
                                                            nameText:
                                                                productLog.name,
                                                            discount: productLog
                                                                .discount,
                                                            year:
                                                                productLog.year,
                                                            weight: productLog
                                                                .weightInKg,
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
                                                        priceText:
                                                            productLog.price,
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
                                              ),
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
                              return Column(
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
                                                        id: productLog.id,
                                                        imageText:
                                                            productLog.imgUrl,
                                                        priceText:
                                                            productLog.price,
                                                        descriptionText:
                                                            productLog
                                                                .description,
                                                        categoryText:
                                                            productLog.category,
                                                        nameText:
                                                            productLog.name,
                                                        discount:
                                                            productLog.discount,
                                                        weight: productLog
                                                            .weightInKg,
                                                        year: productLog.year,
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
                                                  imageText: productLog.imgUrl,
                                                  priceText: productLog.price,
                                                  descriptionText:
                                                      productLog.description,
                                                  categoryText:
                                                      productLog.category,
                                                  nameText: productLog.name,
                                                  weight: productLog.weightInKg,
                                                  year: productLog.year,
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
                                      Text(
                                        productLog?.name ?? '',
                                        style: GoogleFonts.andika(
                                          textStyle: TextStyle(
                                              color: AppColor.black,
                                              letterSpacing: .0),
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
                                                            priceText: 0,
                                                            descriptionText: '',
                                                            categoryText: '',
                                                            nameText: productLog
                                                                .title,
                                                            discount: 0,
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
                                                        priceText: 0,
                                                        weight: '',
                                                        year: ''))),
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
