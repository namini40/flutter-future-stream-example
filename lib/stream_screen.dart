import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({Key? key}) : super(key: key);

  @override
  _StreamScreenState createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  final StreamController<int> streamController = StreamController();
  late Sink<int> sink;

  int num = 0;

  @override
  void initState() {
    super.initState();
    sink = streamController.sink;
    sink.add(num);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                print(snapshot);
                if(snapshot.connectionState == ConnectionState.active){
                  num = snapshot.data!;
                  return Text('$num');
                }else{
                  return Text('No Data');
                }
              },
            ),
            ElevatedButton(onPressed: add, child: Text('Add')),
            ElevatedButton(onPressed: sub, child: Text('Sub')),
          ],
        ),
      ),
    );
  }


  add(){
    sink.add(num+1);
  }

  sub(){
    sink.add(num-1);
  }

}
