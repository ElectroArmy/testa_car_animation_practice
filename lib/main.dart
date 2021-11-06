import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() { runApp(MyApp());
  // return runApp(ChangeNotifierProvider<ThemeNotifier>(
  //   create: (_) => new ThemeNotifier(),
  //   child: MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override  
  
  Widget build(BuildContext context) {
    //Theme note , if u want to call remove cmts.
    // return Consumer<ThemeNotifier>(
    //   builder: (context, theme, child) => 
    // );
    return MaterialApp(
      
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //theme: theme.getTheme(),
      
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomeScreen(),
      
      
      
    );
  }
}

