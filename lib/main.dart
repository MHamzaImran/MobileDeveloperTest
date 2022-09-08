import 'package:flutter/material.dart';
import 'result.dart';
import 'result_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mobile Developer Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {


  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _result = Result();
  final _resultService = ResultService();
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Mobile Developer Test'),
            const SizedBox(width: 16,),
            Image.asset(
              'images/logo.png',
              fit: BoxFit.contain,
              height: 30,
            )
          ],
        ),
        // title: Text(widget.title)
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () async{
                  _result.id = 0;
                  _result.name = 'Android Developer';
                  await _resultService.deleteResult(_result.id);
                  await _resultService.saveResult(_result);
                },
                child: const Text(
                  'Android Developer',
                  style: TextStyle(fontSize: 30),
                )),
            TextButton(
                onPressed: () async{
                  _result.id = 1;
                  _result.name = 'Web Development';
                  await _resultService.deleteResult(_result.id);
                  await _resultService.saveResult(_result);
                },
                child: const Text(
                  'Web Development',
                  style: TextStyle(fontSize: 30),
                )),
            TextButton(
                onPressed: () async{
                  _result.id = 2;
                  _result.name = 'Artificial Intelligence';
                  await _resultService.deleteResult(_result.id);
                  await _resultService.saveResult(_result);
                },
                child: const Text(
                  'Artificial Intelligence',
                  style: TextStyle(fontSize: 30),
                )),
            TextButton(
                onPressed: () async{
                  _result.id = 3;
                  _result.name = 'Game development';
                  await _resultService.deleteResult(_result.id);
                  await _resultService.saveResult(_result);

                },
                child: const Text(
                  'Game development',
                  style: TextStyle(fontSize: 30),
                )),
            const SizedBox(height: 150,),
            Row(
              children: [
                const SizedBox(width: 50,),
                FlatButton(
                  color: Colors.green,
                    onPressed: ()async{
                  await _resultService.readResult();
                }, child: const Text('Print Result')),

                const SizedBox(width: 50,),
                FlatButton(
                  color: Colors.red,
                    onPressed: ()async{
                  await _resultService.deleteAllResult();
                }, child: const Text('Delete All Result')),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
