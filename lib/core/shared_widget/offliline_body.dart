import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:flutter/material.dart';
import 'custom_elevated_btn.dart';
import 'global_text.dart';


class OfflineBody extends StatelessWidget {

  const OfflineBody({super.key, required this.onPressCheckInternet});
    final void Function() onPressCheckInternet;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off_outlined, size: 0.4.w, color: Colors.grey),
          0.02.ph,
          GText(
            textAlign: TextAlign.center,
            color: Colors.grey,
            content: "You’re offline",
            fontSize: 0.06.w,
          ),
          0.02.ph,
          CustomElevatedButton(
            onPress: onPressCheckInternet,
            btnColor: Colors.grey,
            width: 0.5.w,
            height: 0.07.h,
            child: GText(
              textAlign: TextAlign.center,
              color: Colors.black,
              content: "Try Again",
              fontSize: 0.05.w,
            ),
          )
        ],
      ),
    );
  }
}