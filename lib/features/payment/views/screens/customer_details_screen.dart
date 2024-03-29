import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../blocs/payments/payments_cubit.dart';
import '../components/location_drop_down.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: ListView(
        children: [

          Space(
            height: 2.h ,
          ),

          CustomHeader(title: LocaleKeys.customer_details.tr(),showCart: false,),

          Space(
            height: 3.h,
          ),

          Text(
            LocaleKeys.username,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral400, fontSize: 12.sp),
          ).tr(),
          Space(
            height: 0.5.h,
          ),


          CustomTextField(
            controller: context.read<PaymentsCubit>().usernameController,
            validator: (_)=> context.read<PaymentsCubit>().validateUsername(),

            prefixIcon: Padding(
              padding: EdgeInsets.all(3.w),
              child: SvgPicture.asset(
                AppImages.profile,
                width: 3.w,
                height: 3.h,
              ),

            ),
            hint: LocaleKeys.username_hint.tr(),
          ),

          Space(
            height: 1.h,
          ),

          Text(
            LocaleKeys.phone_number,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral400, fontSize: 12.sp),
          ).tr(),
          Space(
            height: 0.5.h,
          ),




          CustomTextField(
            controller: context.read<PaymentsCubit>().phoneNumberController,
            validator: (_)=> context.read<PaymentsCubit>().validatePhone(),

            prefixIcon: Padding(
              padding: EdgeInsets.all(3.w),
              child: SvgPicture.asset(
                AppImages.phone,
                width: 3.w,
                height: 3.h,
              ),

            ),
            hint: LocaleKeys.phone_number_hint.tr(),
          ),




          Space(
            height: 1.h,
          ),

          Text(
            LocaleKeys.location,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral400, fontSize: 12.sp),
          ).tr(),
          Space(
            height: 0.5.h,
          ),

          LocationDropDown(width: 86.w,height: 6.h,),

          Space(
            height: 5.h,
          ),

          MainButton(
            color: AppTheme.primary900,
            width: 86.w,
            height: 6.5.h,
            label:  Text(
              LocaleKeys.next,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral100, fontSize: 13.sp),
            ).tr(),
            onTap: ()=> context.read<PaymentsCubit>().onCustomerDetailsNextClick(context),
          ),

        ],
      ),
    ),));
  }
}
