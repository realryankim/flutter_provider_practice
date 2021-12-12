import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/src/home.dart';
import 'package:sample_provider/src/provider/bottom_navigation_provider.dart';
import 'package:sample_provider/src/provider/count_provider.dart';
import 'package:sample_provider/src/provider/movie_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 이렇게 하면 child 하위에 있는 모든 위젯들은 CountProvider에 접근할 수 있게 된다.
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => MovieProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => BottomNavigationProvider(),
          ),
        ],
        child: Home(),
      ),
    );
  }
}
