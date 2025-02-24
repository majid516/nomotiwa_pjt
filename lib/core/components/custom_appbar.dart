import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nomotiwa/core/constants/app_theme/app_theme.dart';
import 'package:nomotiwa/core/constants/spaces/space.dart';
import 'package:nomotiwa/core/screen_size/screen_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback action;
  final bool backButtonNeeded;
  final Widget? widget;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.action,
    this.widget,
    this.backButtonNeeded = true,
  });
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: ScreenSize.width,
          height: 120,
          decoration: BoxDecoration(gradient: MyColors.themeGradient),
        ),
        Positioned(
          right: -10,
          child: Transform.rotate(
            angle: 15 * pi / 180,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
              child: Container(
                width: ScreenSize.width * 0.4,
                height: 120,
                color: MyColors.secondaryColor.withValues(alpha: 0.4),
              ),
            ),
          ),
        ),
        Positioned(
          right: -100,
          child: Transform.rotate(
            angle: 15 * pi / 180,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
              child: Container(
                width: ScreenSize.width * 0.4,
                height: 100,
                color: MyColors.secondaryColor.withValues(alpha: 0.6),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          child: SizedBox(
            width: ScreenSize.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (backButtonNeeded)
                        InkWell(
                          onTap: action,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: MyColors.whiteColor,
                            size: 20,
                          ),
                        ),
                      Space.wSpace10,
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 25,
                          color: MyColors.whiteColor,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  if (widget != null) widget!,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
