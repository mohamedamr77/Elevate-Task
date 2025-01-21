import 'package:flutter/material.dart';
import '../shared_functions/shared_functions.dart';
import '../utils/app_colors.dart';
import '../utils/font_family.dart';
import '../utils/font_size_responsize.dart';
import 'global_text.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.minLine = 1,
    this.maxLine = 1,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.border,
    this.enabledBorder,
    this.focusBorder,
    this.suffixIcon,
    required this.hintText,
    this.fillColor,
    this.prefix,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.onSaved,
    required this.title,
    this.onTap,
    this.onTapOutside,
  });

  final String hintText;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final int minLine;
  final int maxLine;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? initialValue;
  final Widget? suffixIcon;
  final bool obscureText;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusBorder;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String title;
  final void Function(PointerDownEvent)? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: (SharedFunctions.isArabicLocale()
          ? TextDirection.ltr
          : TextDirection.rtl),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GText(
              color: AppColors.thirdColor,
              content: title,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            onTap: onTap,
            textDirection: (SharedFunctions.isArabicLocale()
                ? TextDirection.ltr
                : TextDirection.rtl),
            onSaved: onSaved,
            controller: controller,
            obscureText: obscureText,
            obscuringCharacter: "*",
            initialValue: initialValue,
            onChanged: onChanged,
            validator: validator,
            keyboardType: keyboardType,
            maxLines: maxLine,
            minLines: minLine,
            onTapOutside: onTapOutside ??
                (e) {
                  // FocusManager.instance.primaryFocus?.unfocus();
                },
            style: TextStyle(
              // color: AppColor.kPrimaryColor,
              fontSize: getResponsiveFontSize(context: context, fontSize: 16),
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontFamily: AppFontFamily.cairoFontFamily,
            ),
            decoration: InputDecoration(
                hintTextDirection: TextDirection.rtl,
                fillColor: fillColor ?? const Color(0xffFAFAFA),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.thirdColor,
                  fontSize:
                      getResponsiveFontSize(context: context, fontSize: 15),
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFontFamily.cairoFontFamily,
                ),
                border: border ?? const OutlineInputBorder(),
                prefixIcon: prefix,
                suffixIcon: suffixIcon,
                focusedBorder: focusBorder ??
                    const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                enabledBorder: enabledBorder ??
                    const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: AppColors.thirdColor),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          ),
        ],
      ),
    );
  }
}
