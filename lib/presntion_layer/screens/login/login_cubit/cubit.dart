import 'package:diva_final_project/presntion_layer/screens/login/login_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DivaLoginCubit extends Cubit<DivaLoginStates>
{


  DivaLoginCubit() : super(DivaLoginInitialState());

  static DivaLoginCubit get(context)=> BlocProvider.of(context);
  }
