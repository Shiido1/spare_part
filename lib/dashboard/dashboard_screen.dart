import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/dashboard/provider.dart';
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
                        customCard(),
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

  Widget customCard() {
    return  Consumer<TopProductProvider>(
      builder: (_,provider,__){
      if (provider.productModel == null) {
        return Center(
            child: TextViewWidget(text: 'No product', color: AppColor.black));
      }else{
        return Container(
          height: MediaQuery.of(context).size.height/2,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: provider.productModel.length,
            itemBuilder: (BuildContext context, int index) {
              var productLog = provider.productModel[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: AppColor.yellow,
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          TextViewWidget(
                            text: productLog?.description??'',
                            color: AppColor.black,
                            textSize: 14,),
                          Spacer(),
                          TextViewWidget(
                            text: 'See all',
                            color: AppColor.purple,
                            textSize: 14,)
                        ],
                      ),
                      Divider(thickness: 0.7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    color:AppColor.purple,
                                    height: 100,
                                    child: CachedNetworkImage(
                                      imageUrl: '$url${productLog?.imgUrl ?? ''}',
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  TextViewWidget(
                                      text: productLog?.name??'', color: AppColor.black,textSize: 14)
                                ],
                              )),
                          SizedBox(width: 5,),
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    color:AppColor.purple,
                                    height: 100,
                                    child: CachedNetworkImage(
                                      imageUrl: '$url${productLog?.imgUrl1 ?? ''}',
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  TextViewWidget(
                                      text: productLog?.name??'', color: AppColor.black,textSize: 14)
                                ],
                              )),
                          SizedBox(width: 5,),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  color:AppColor.purple,
                                  height: 100,
                                  child: CachedNetworkImage(
                                    imageUrl: '$url${productLog?.imgUrl2 ?? ''}',
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                TextViewWidget(
                                  text: productLog?.name??'', color: AppColor.black,textSize: 14,)
                              ],
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    },
    );
  }
}
