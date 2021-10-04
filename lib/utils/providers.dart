import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sparepart/dashboard/provider.dart';
import 'package:sparepart/dashboard/spare_part/spare_part_provider.dart';
import 'package:sparepart/screens/product_screen/product_provider.dart';
import 'package:sparepart/screens/profile_screen/car_brands/car_model_provider.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/forgot_password/provider.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/reset_password/provider.dart';
import 'package:sparepart/screens/profile_screen/offer/add_to_cart_provider.dart';
import 'package:sparepart/sign_in/provider.dart';
import 'package:sparepart/sign_up/provider.dart';
import 'package:sparepart/screens/profile_screen/verification/provider.dart';
import 'package:sparepart/dashboard/provider/brand_provider.dart';
import 'package:sparepart/dashboard/provider/brand_id_provider.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<SignUpProviders>(create: (_) => SignUpProviders()),
    ChangeNotifierProvider<SignInProvider>(create: (_) => SignInProvider()),
    ChangeNotifierProvider<OtpProviders>(create: (_) => OtpProviders()),
    ChangeNotifierProvider<UtilityProvider>(create: (_) => UtilityProvider()),
    ChangeNotifierProvider<TopProductProvider>(
        create: (_) => TopProductProvider()),
    ChangeNotifierProvider<FeaturedProductProvider>(
        create: (_) => FeaturedProductProvider()),
    ChangeNotifierProvider<BrandsProvider>(create: (_) => BrandsProvider()),
    ChangeNotifierProvider<CategoriesProvider>(
        create: (_) => CategoriesProvider()),
    ChangeNotifierProvider<Count>(create: (_) => Count()),
    ChangeNotifierProvider<BrandIdProvider>(create: (_) => BrandIdProvider()),
    ChangeNotifierProvider<ForgotPasswordProvider>(
        create: (_) => ForgotPasswordProvider()),
    ChangeNotifierProvider<ResetPasswordProvider>(
        create: (_) => ResetPasswordProvider()),
    ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),
    ChangeNotifierProvider<SparePartProvider>(
        create: (_) => SparePartProvider()),
    ChangeNotifierProvider<CarModelProvider>(
        create: (_) => CarModelProvider()),
  ];
}
