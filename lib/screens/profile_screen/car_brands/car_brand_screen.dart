import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sparepart/screens/profile_screen/car_brands/car_model_screen.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/dashboard/provider/brand_id_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CarBrandScreen extends StatefulWidget {
  String id;
  CarBrandScreen({Key key, @required this.id}) : super(key: key);

  @override
  _CarBrandScreenState createState() => _CarBrandScreenState();
}

class _CarBrandScreenState extends State<CarBrandScreen> {
  BrandIdProvider brandIdProvider;

  @override
  void initState() {
    brandIdProvider = Provider.of<BrandIdProvider>(context, listen: false);
    brandIdProvider.init(context);
    brandIdProvider.brandsProvider(id: widget.id);
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
      body: Padding(
        padding: EdgeInsets.all(22),
        child: Container(
          child: Consumer<BrandIdProvider>(
            builder: (_, provider, __) {
              if (provider.carsModel == null) {
                return Center(
                    child: SpinKitCircle(
                  color: AppColor.purple,
                  size: 50,
                ));
              } else {
                return ListView.builder(
                  itemCount: provider.carsModel.length,
                  itemBuilder: (context, index) {
                    var model = provider.carsModel[index];
                    return InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CarModelScreen(id: model.id
                      ))),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            color: AppColor.editTextBackground.withOpacity(1),
                            child: Container(
                              height: 270,
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                height: 100,
                                imageUrl: '$url${model?.imgUrl ?? ''}',
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          Divider(thickness: 1,color: AppColor.black,),
                          TextViewWidget(
                            text: '${model.name}',
                            color: AppColor.black,
                            fontWeight: FontWeight.w700,
                            textSize: 21,
                          )
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
