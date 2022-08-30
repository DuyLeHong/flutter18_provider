import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myData = MyModel();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(
          create: (BuildContext context) {
            return MyModel();
          },
        ),

        Provider<String>(
          create: (ctx) {
            return "CodeFresher - lesson 9";
          },
        ),

      ],
      child: MaterialApp(
        home: _buildHomeScreen(),
      ),
    );

    // return Provider<String>(
    //   create: (ctx) {
    //     return "CodeFresher - lesson 9";
    //   },
    //   child: ChangeNotifierProvider<MyModel>(
    //     create: (BuildContext context) {
    //       return MyModel();
    //     },
    //     child: MaterialApp(
    //       home: _buildHomeScreen(),
    //     ),
    //   ),
    // );
  }
}

_buildHomeScreen() {
  return Scaffold(
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

                  String sData = Provider.of<String>(context, listen: false);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(sData)));
                },
                child: Text('Click me!'),
              );
            },
          ),
        ),
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
  );
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
