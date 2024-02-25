import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/home/views/components/home_card.dart';
import 'package:smart_soft/features/seller_home/views/blocs/seller_home/seller_home_cubit.dart';
import 'package:smart_soft/features/seller_home/views/components/order_card.dart';
import 'package:smart_soft/features/seller_home/views/components/seller_drawer.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/views/widgets/custom_page_indicator.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../home/views/components/home_appbar.dart';

class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: context.read<SellerHomeCubit>().scaffoldKey,
        drawer: SellerDrawer(),
        body: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 2.h,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child:  HomeAppBar(
                title: LocaleKeys.home.tr(),
                trailingIcon: AppImages.menu,
                onTrailingIconTap: () => context.read<SellerHomeCubit>().openDrawer(),
                leadingIcon: AppImages.cart,
                onLeadingIconTap: () {},
              ),
            ),

            Space(
              height: 3.h,
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  OrderCard(),

                  OrderCard(),

                  OrderCard(),

                  OrderCard(),

                ],
              ),
            )




          ],
        ),
      ),
    );
  }
}
