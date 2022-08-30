import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myData = MyModel();

    // return Provider<MyModel>(
    //   create: (context) => myData,
    //   child: (),
    // );

    return ChangeNotifierProvider<MyModel>(
      create: (BuildContext context) {
        return MyModel();
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          backgroundColor: Colors.grey,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Builder(
                  builder: (BuildContext context) {
                    return ElevatedButton(
                      onPressed: () {
                        //myData.doSomething();

                        MyModel data = Provider.of<MyModel>(context, listen: false);
                        data.doSomething();
                      },
                      child: Text('Click me!'),
                    );
                  },
                ),
              ),
              // child: Consumer<MyModel>(
              //   builder: (context, mymodel, child) {
              //     return RaisedButton(
              //       child: Text('Do something'),
              //       onPressed: () {
              //         mymodel.doSomething();
              //       },
              //     );
              //   },
              // ),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  builder: (context, mymodel, child) {
                    return Text(mymodel.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel extends ChangeNotifier {
  String text = "Hello";

  void doSomething() {
    if (text == "Hello")
      text = "World";
    else
      text = "Hello";

    notifyListeners();
  }
}
