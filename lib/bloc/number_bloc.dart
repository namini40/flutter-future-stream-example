import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:narvanapp/bloc/number_event.dart';
import 'package:narvanapp/bloc/number_state.dart';

class NumberBloc extends Bloc<NumberEvent,NumberState>{
  int number = 0;
  NumberBloc() : super(InitialNumberState()){
    on<AddNumberEvent>((event,emit){
      number++;
        emit(ChangeNumberState(number));
    });

    on<SubtractNumberEvent>((event,emit){
      number--;
      emit(ChangeNumberState(number));
    });
  }

}