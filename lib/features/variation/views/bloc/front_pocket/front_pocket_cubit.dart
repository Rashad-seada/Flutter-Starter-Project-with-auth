import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/variation/data/entities/front_pocket_entity.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_front_pocket_by_seller_id_use_case.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/usecases/get_fabric_by_seller_id_use_case.dart';
import '../variation/variation_cubit.dart';

part 'front_pocket_state.dart';

class FrontPocketCubit extends Cubit<FrontPocketState> {
  FrontPocketCubit() : super(FrontPocketInitial());

  int frontPocketId = -1;


  getFrontPocket(BuildContext context){
    emit(FrontPocketIsLoading());
    getIt<GetFrontPocketBySellerIdUseCase>().call(context.read<VariationCubit>().selectedSellerId).then(
            (value) => value.fold(
                (error) {
              emit(FrontPocketError(error));

            },
                (success) {
              emit(FrontPocketSuccess(success.obj ?? []));
            }
        ));
  }

  void onFrontPocketCardTap(int frontPocketId, BuildContext context) {
    this.frontPocketId = frontPocketId;
    context.read<VariationCubit>().onFrontPocketNextClick(context);
  }

}
