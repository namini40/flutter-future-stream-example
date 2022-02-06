import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:narvanapp/bloc/number_bloc.dart';
import 'package:narvanapp/bloc/number_event.dart';
import 'package:narvanapp/bloc/number_state.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({Key? key}) : super(key: key);

  @override
  _BlocScreenState createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {

  NumberBloc numberBloc = NumberBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NumberBloc>(
      create: (_) => numberBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Future Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<NumberBloc, NumberState>(
                builder: (context, state) {
                  print(state);
                  if(state is InitialNumberState){
                    return Text('0');
                  }else if (state is ChangeNumberState){
                    return Text('${state.currentNumber}');
                  }else{
                    return Text('none');
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  numberBloc.add(AddNumberEvent());
                },
                child: Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  numberBloc.add(SubtractNumberEvent());
                },
                child: Text('Sub'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
