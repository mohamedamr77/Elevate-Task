import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                runSpacing: 8.0, // Vertical spacing between rows
                children: List.generate(
                  7,
                      (index) =>  SizedBox(
                    width: 0.43.w, // Set width for each item
                    child:Container(
                      height: 0.2.h,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(0.03.w),
                       border: Border.all(
                         color: Color(0xffB2C8DD),
                       ),
                     ),
                    )
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
