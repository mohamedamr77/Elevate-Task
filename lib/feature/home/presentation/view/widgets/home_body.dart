import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/shared_widget/global_text.dart';
import 'package:elevatetask/core/utils/app_colors.dart';
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
                runSpacing: 0.03.h, // Vertical spacing between rows
                children: List.generate(
                  8,
                      (index) =>  SizedBox(
                    width: 0.43.w, // Set width for each item
                    child:Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.03.w),
                            border: Border.all(
                              color: const Color(0xffB2C8DD),
                              width: 2.5,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0.027.w),
                                  topRight: Radius.circular(0.027.w),
                                ),
                                child: Image(
                                  image: const AssetImage(
                                      "assets/images/clothestest.jpeg"),
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: GText(
                                  color: AppColors.primaryColor,
                                  content: "Nike Air NikeNike Air Nike Nike Air Nike   Air Nike Nike Air Nike  ",
                                  fontSize: 16,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: GText(
                                  color: AppColors.darkBlueColor,
                                  content: "EGP : 1200",
                                  fontSize: 16,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    textDirection: TextDirection.ltr,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GText(
                                        color: AppColors.blueAccent,
                                        content: "Review (4.6)",
                                        fontSize: 13,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,),
                                      SizedBox(width: 4,),
                                      Icon(Icons.star, color: Color(0xffFFD800),size: 18,),
                                      Spacer(),

                                    ],
                                  )
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          bottom: 10,
                          right: 10,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xff004087),
                            child: Icon(Icons.add,color: Colors.white,size: 20,),
                          ),
                        )

                      ],
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
