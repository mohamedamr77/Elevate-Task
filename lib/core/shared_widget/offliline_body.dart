// import 'package:flutter/material.dart';
// import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
//
//
// class OfflineBody extends StatelessWidget {
//   const OfflineBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.wifi_off_outlined, size: 0.4.w, color: Colors.grey),
//           0.02.ph,
//           GText(
//             textAlign: TextAlign.center,
//             color: Colors.grey,
//             content: "You’re offline",
//             fontSize: 0.06.w,
//           ),
//           0.02.ph,
//           CustomElevatedButton(
//             onPress: () {
//               BlocProvider.of<InternetCubit>(context).connectWithInternet();
//             },
//             btnColor: Colors.grey,
//             width: 0.5.w,
//             height: 0.07.h,
//             child: GText(
//               textAlign: TextAlign.center,
//               color: Colors.black,
//               content: "Try Again",
//               fontSize: 0.05.w,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
