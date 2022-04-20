import 'package:app1/shared/Cubit/States.dart';
import 'package:app1/shared/constants.dart';
import 'package:app1/shared/sharedComponents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
class AppCubit extends Cubit<AppStates>
{
  AppCubit(AppStates initialState) : super(AppInitialState());
 static AppCubit get(context)=>BlocProvider.of(context);


  void UpdateDB( @required double Rs, @required int id,)
  {
     database.rawUpdate(
        'UPDATE user SET Rs = ? WHERE id = ? ',
        [Rs, id]).then((value) {
       print('Data has been Updated');
       emit(UBdateDB());
    });

  }

  }
