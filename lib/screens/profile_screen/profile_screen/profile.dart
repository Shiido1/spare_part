import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sparepart/screens/profile_screen/add_card/add_card.dart';
import 'package:sparepart/screens/profile_screen/address/shipping_address_screen.dart';
import 'package:sparepart/screens/profile_screen/edit_profile/edit_profile_screen.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen.dart';
import 'package:sparepart/screens/profile_screen/settings/settings.dart';
import 'package:sparepart/sign_in/provider.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/utils/page_route/navigator.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String firstName='',lastName='';

  @override
  void initState() {
    init();
    super.initState();
  }

  init()async{
    firstName = await preferencesHelper.getStringValues(key: 'first_name');
    lastName = await preferencesHelper.getStringValues(key: 'last_name');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignInProvider>(
        builder: (_,provide,__){
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 45,),
                    ClipOval(
                      child: Image(
                        image: AssetImage(AppAssets.pic),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextViewWidget(
                      text: "$firstName $lastName",
                      color: AppColor.black,
                      textSize: 28,),
                    SizedBox(height: 10,),
                    textCard(text: 'My Account',icon: AppAssets.user,screen: EditProfileScreen()),
                    textCard(text: 'My Order',icon: AppAssets.myOrder,screen: OrderScreen()),
                    textCard(text: 'Shipping Address',icon: AppAssets.address,screen: ShippingAddressScreen()),
                    textCard(text: 'My Card',icon: AppAssets.creditCard,screen: AddCard()),
                    textCard(text: 'Settings',icon: AppAssets.settings,screen: Settings()),
                    textCard(text: 'Privacy Policy',icon: AppAssets.privacyPolicy),
                    textCard(text: 'Help',icon: AppAssets.help),
                    logoutTextCard(text: 'Logout'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget textCard({String text,String icon,Widget screen})=> InkWell(
    onTap: (){
      screen==null?Scaffold(appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){Navigator.pop(context);},
          color: AppColor.yellow,),
      ),):Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
    child: Card(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //       color: Colors.black54,
          //       blurRadius: 15.0,
          //       offset: Offset(0.0, 0.75)
          //   )
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            SvgPicture.asset(icon),
            SizedBox(width: 35,),
            TextViewWidget(
              text: '$text',
              color: AppColor.black,textSize: 20,)
          ],
        ),
      ),
    ),
  );
  Widget logoutTextCard({String text})=> InkWell(
    onTap: () async {
      await preferencesHelper.remove();
      PageRouter.gotoNamed(Routes.LOGIN, context);
    },
    child: Card(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            Icon(Icons.logout,size: 30),
            SizedBox(width: 35,),
            TextViewWidget(
              text: '$text',
              color: AppColor.black,textSize: 20,)
          ],
        ),
      ),
    ),
  );
}
