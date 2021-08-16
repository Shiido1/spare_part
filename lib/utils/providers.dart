
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sparepart/dashboard/provider.dart';
import 'package:sparepart/sign_in/provider.dart';
import 'package:sparepart/sign_up/provider.dart';
import 'package:sparepart/screens/profile_screen/verification/provider.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<SignUpProviders>(create: (_) => SignUpProviders()),
    ChangeNotifierProvider<SignInProvider>(create: (_) => SignInProvider()),
    ChangeNotifierProvider<OtpProviders>(create: (_) => OtpProviders()),
    ChangeNotifierProvider<UtilityProvider>(create: (_) => UtilityProvider()),
    ChangeNotifierProvider<TopProductProvider>(create: (_) => TopProductProvider()),
    ChangeNotifierProvider<FeaturedProductProvider>(create: (_) => FeaturedProductProvider()),
    ChangeNotifierProvider<BrandsProvider>(create: (_) => BrandsProvider()),
    ChangeNotifierProvider<CategoriesProvider>(create: (_) => CategoriesProvider()),
    // ChangeNotifierProvider<Cart>(create: (_) => Cart()),
  ];
}