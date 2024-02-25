import 'package:dartz/dartz.dart';
import 'package:smart_soft/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';


import '../../../../core/di/app_module.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/infrastructure/services/network_service.dart';
import '../../domain/model/user_model.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_source/remote_data_source/firebase_service.dart';

class AuthRepoImpl implements AuthRepo {

  NetworkService networkService = getIt<NetworkService>();
  FirebaseService remoteDataSource = getIt<FirebaseService>();
  AuthRemoteDataSource authRemoteDataSource = getIt<AuthRemoteDataSource>();


  @override
  Future<Either<Failure,UserModel>> register({required String email, required String password}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      UserModel user = await remoteDataSource.signUpWithEmailAndPassword(email: email, password: password);

      if(user.id == null){
        return left(RemoteDataFailure(
            "Failed to sign up, please try again later",
            failureCode: 1
        ));
      }

      return right(user);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure,UserModel>> Login({required String email, required String password}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      UserModel user = await remoteDataSource.signInWithEmailAndPassword(email:email, password:password);

      if(user.id == null){
        return left(RemoteDataFailure(
            "Failed to sign in, please try again later",
            failureCode: 1
        ));
      }

      return right(user);

    }on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }

  }

  @override
  Future<Either<Failure, void>> confirmOtp({required String otp}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      await authRemoteDataSource.confirmOtp(otp: otp);

      return right(null);

    }on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 1));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 2));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }

  @override
  Future<Either<Failure, void>> sendOtp({required String phoneNumber}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      await authRemoteDataSource.sendOtp(phoneNumber: phoneNumber);

      return right(null);

    }on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 1));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 2));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }


}