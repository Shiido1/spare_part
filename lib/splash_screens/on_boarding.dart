// class OnBoardingPage extends StatefulWidget {
//   @override
//   _OnBoardingPageState createState() => _OnBoardingPageState();
// }
//
// class _OnBoardingPageState extends State<OnBoardingPage> {
//   int currentIndexPage;
//   int pageLength;
//
//   @override
//   void initState() {
//     currentIndexPage = 0;
//     pageLength = 3;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.background,
//       body: Stack(
//         children: [
//           Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     height: 305,
//                     child: PageView(
//                       onPageChanged: (value) {
//                         setState(() => currentIndexPage = value);
//                       },
//                       children: <Widget>[
//                         WalkthroughWidget(
//                           image: AppAssets.introSlide1,
//                           text:
//                           'connect with friends who are ready to assist financially',
//                         ),
//                         WalkthroughWidget(
//                           image: AppAssets.introSlide2,
//                           text:
//                           'Earn interest when your connect refunds your money',
//                         ),
//                         WalkthroughWidget(
//                           image: AppAssets.introSlide3,
//                           text:
//                           'Build comfort, credibility and trust with a new found home',
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 21,
//                   ),
//                   Center(
//                     child: DotsIndicator(
//                       dotsCount: pageLength,
//                       position: double.parse(currentIndexPage.toString()),
//                       decorator: DotsDecorator(
//                           color: AppColor.buttonDisabled,
//                           activeColor: AppColor.blue,
//                           size: Size.square(8.0),
//                           activeSize: Size.square(8.0)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 66,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       width: 137,
//                       height: 44,
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColor.lightBlue.withOpacity(0.2),
//                             spreadRadius: 3,
//                             blurRadius: 2,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: ButtonWidget(
//                           color: AppColor.blue,
//                           text: 'SIGN IN',
//                           callback: () =>
//                               PageRouter.gotoNamed(Routes.LOGIN, context),
//                           textColor: AppColor.white,
//                           splashColor: AppColor.white),
//                     ),
//                     SizedBox(
//                       width: 26,
//                     ),
//                     Container(
//                       width: 137,
//                       height: 44,
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColor.lightBlue.withOpacity(0.2),
//                             spreadRadius: 3,
//                             blurRadius: 2,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: ButtonWidget(
//                           color: AppColor.white,
//                           text: 'SIGN UP',
//                           callback: () =>
//                               PageRouter.gotoNamed(Routes.REGISTER, context),
//                           textColor: AppColor.blue,
//                           splashColor: AppColor.buttonClicked),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }