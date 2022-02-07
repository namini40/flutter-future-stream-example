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
  late StreamSubscription<int> subscription;

  int num = 0;

  //definition of broadcast stream and its sink and subscriptions
  final StreamController<int> broadcastStreamController =
      StreamController.broadcast();
  late Sink<int> broadcastSink;
  late StreamSubscription<int> subscription1;
  late StreamSubscription<int> subscription2;
  late StreamSubscription<int> subscription3;
  int num1 = 0;
  int num2 = 0;
  int num3 = 0;

  @override
  void initState() {
    super.initState();
    sink = streamController.sink;

    subscription = streamController.stream.listen((event) {
      num = event;
      setState(() {});
    });
    sink.add(num);

    broadcastSink = broadcastStreamController.sink;
    subscription1 = broadcastStreamController.stream.listen((event) {
      num1 = event * 2;
    });
    subscription2 = broadcastStreamController.stream.listen((event) {
      num2 = event * 3;
    });

    subscription3 = broadcastStreamController.stream.listen((event) {
      num3 = event * 4;
      // calling setstate one time is enough to reload all
      setState(() {});
    });
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
            // StreamBuilder<int>(
            //   stream: streamController.stream,
            //   builder: (context, snapshot) {
            //     print(snapshot);
            //     if(snapshot.connectionState == ConnectionState.active){
            //       num = snapshot.data!;
            //       return Text('$num');
            //     }else{
            //       return Text('No Data');
            //     }
            //   },
            // ),
            Text('$num'),
            Text('num1: $num1'),
            Text('num2: $num2'),
            Text('num3: $num3'),
            ElevatedButton(onPressed: add, child: Text('Add')),
            ElevatedButton(onPressed: sub, child: Text('Sub')),
          ],
        ),
      ),
    );
  }

  add() {
    sink.add(num + 1);
    broadcastSink.add(num + 1);
  }

  sub() {
    sink.add(num - 1);
    broadcastSink.add(num - 1);
  }

  @override
  void dispose() {
    super.dispose();
    streamController.close();
    sink.close();
    subscription.cancel();


    //remember to close and cancel all
    broadcastStreamController.close();
    broadcastSink.close();
    subscription1.cancel();
    subscription2.cancel();
    subscription3.cancel();
  }
}
