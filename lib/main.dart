/*
youtube.com/watch?v=oxeYeMHVLII
*/
import 'package:bloc_resocoder_1/counter_event.dart';
import 'package:flutter/material.dart';

import 'counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          initialData: 0 ,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('You have pushed the button this many time:'),
                Text('${snapshot.data}', style: Theme.of(context).textTheme.display1,)
              ],),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(width: 10,),
            FloatingActionButton(
              onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() { 
    super.dispose();
    _bloc.dispose();
  }
}
