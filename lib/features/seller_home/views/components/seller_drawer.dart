import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/custom_network_image.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/features/seller_home/views/blocs/seller_home/seller_home_cubit.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../core/config/app_images.dart';

class SellerDrawer extends StatelessWidget {
  const SellerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Space(
            height: 2.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: ()=> context.read<SellerHomeCubit>().closeDrawer(context),
                  child: SvgPicture.asset(
                    fit: BoxFit.fitWidth,
                    AppImages.close,
                    width: 6.w,
                    height: 6.w,
                  ),
                ),
              ],
            ),
          ),

          Space(
            height: 2.h,
          ),

          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.neutral200
            ),
            child: CustomNetworkImage(
                height: 30.w,
                width: 30.w,
                url:
                    "https://lh3.googleusercontent.com/a-/AOh14GhyC2FdaIRf4PwoQD4Q4JAvt26d0h-Qnl7iJ8pfdw=k-s256"),
          ),

          Space(
            height: 2.h,
          ),

          Center(
            child: Text(
              "رشاد محمد عاطف",
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900, fontSize: 13.sp),
            ),
          ),

          Space(
            height: 3.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Divider(
              color: AppTheme.neutral200,
            ),
          ),

          Space(
            height: 3.h,
          ),

          InkWell(
            onTap: ()=> context.read<SellerHomeCubit>().onProfileClick(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    fit: BoxFit.fitWidth,
                    AppImages.profile,
                    width: 6.w,
                    height: 6.w,
                    color: AppTheme.neutral900,
                  ),
                  Space(
                    width: 3.w,
                  ),
                  Text(
                    LocaleKeys.profile,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral900, fontSize: 13.sp),
                  ).tr(),
                ],
              ),
            ),
          ),

          Space(
            height: 2.5.h,
          ),

          InkWell(
            onTap: ()=> context.read<SellerHomeCubit>().closeDrawer(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    fit: BoxFit.fitWidth,
                    AppImages.order,
                    width: 6.w,
                    height: 6.w,
                    color: AppTheme.neutral900,
                  ),
                  Space(
                    width: 3.w,
                  ),
            
                  Text(
                    LocaleKeys.order,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral900, fontSize: 13.sp),
                  ).tr(),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
