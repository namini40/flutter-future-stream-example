import 'package:flutter/material.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({Key? key}) : super(key: key);

  @override
  _FutureScreenState createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  int number = 0;
  Future<int>? futureNumber;

  @override
  void initState() {
    super.initState();
    futureNumber = getValue();
  }

  Future<int> getValue() async {
    await Future.delayed(const Duration(seconds: 2));
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<int>(
              initialData: 0,
              future: futureNumber,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text('${snapshot.data}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            ElevatedButton(
              onPressed: add,
              child: Text('Add'),
            ),
            ElevatedButton(
              onPressed: sub,
              child: Text('Sub'),
            ),
          ],
        ),
      ),
    );
  }

  Future add() async {
    number++;
    futureNumber = getValue();
    setState(() {});
  }

  Future<void> sub() async {
    number--;
    futureNumber = getValue();
    setState(() {});
  }
}
