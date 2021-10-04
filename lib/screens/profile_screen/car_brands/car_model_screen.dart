import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/screens/profile_screen/car_brands/car_model_provider.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/widgets/text_widget.dart';
// ignore: must_be_immutable
class CarModelScreen extends StatefulWidget {
  String id;
   CarModelScreen({Key key, @required this.id}) : super(key: key);

  @override
  State<CarModelScreen> createState() => _CarModelScreenState();
}

class _CarModelScreenState extends State<CarModelScreen> {

  CarModelProvider carModelProvider;

  @override
  void initState() {
    carModelProvider = Provider.of<CarModelProvider>(context,listen:false);
    carModelProvider.init(context);
    carModelProvider.carModelPro(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<CarModelProvider>(
        builder: (_,provider,__){
          if (provider.carModel == null) {
            return Center(
                child: SpinKitCircle(
                  color: AppColor.purple,
                  size: 50,
                ));
          }else {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    color: AppColor.editTextBackground.withOpacity(1),
                    child: Container(
                      height: 270,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: provider.carModel.car == null
                          ? Container()
                          : CachedNetworkImage(
                        height: 100,
                        imageUrl: '$url${provider?.carModel?.car
                            ?.imgUrl ?? ''}',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),
                    ),
                  ),
                  TextViewWidget(
                    text: '${provider?.carModel?.car?.name ?? ''}',
                    color: AppColor.black,
                    fontWeight: FontWeight.w700,
                    textSize: 21,
                  ),
                  SizedBox(height: 25,),
                  Container(
                      height: 200,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Car Model',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: provider?.carModel?.models
                                    ?.length ?? 0,
                                itemBuilder: (context, index) {
                                  var model = provider?.carModel
                                      ?.models[index];
                                  if(provider.carModel.models.isEmpty || provider.carModel.models == null)
                                    return TextViewWidget(
                                      text: 'No Model',
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w700,
                                      textSize: 21,
                                    );
                                  return SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Card(
                                      elevation: 3,
                                      shadowColor:
                                      AppColor.editTextBackground,
                                      child: Column(
                                        children: [
                                          CachedNetworkImage(
                                            height: 120,
                                            imageUrl:
                                            '$url${model?.imgUrl ?? ''}',
                                            placeholder: (context, url) =>
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .all(15.0),
                                                  child: Center(
                                                      child: SpinKitChasingDots(
                                                        color: AppColor
                                                            .purple,
                                                        size: 50,
                                                      )),
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                Icon(Icons.error),
                                          ),
                                          SizedBox(height: 2,),
                                          TextViewWidget(
                                            text: '${model?.name ?? ''}\n'
                                                '${model?.year ?? ''}',
                                            color: AppColor.black,
                                            fontWeight: FontWeight.w700,
                                            textAlign: TextAlign.end,
                                            textSize: 13,),
                                          // Expanded(
                                          //   child: TextViewWidget(
                                          //     text: '${model?.year ?? ''}',
                                          //     color: AppColor.black,
                                          //     textAlign: TextAlign.end,
                                          //     fontWeight: FontWeight.w300,
                                          //     textSize: 10,),
                                          // ),
                                        ],
                                      ),),
                                  );
                                }),
                          ),
                        ],
                      )
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
