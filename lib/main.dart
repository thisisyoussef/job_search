import 'package:flutter/material.dart';
import 'package:job_search/data/app_information.dart';
import 'package:job_search/data/job_filters.dart';
import 'package:job_search/loading_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => JobFilters()),
        ChangeNotifierProvider(create: (context) => AppInformation()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoadingScreen(),
      ),
    );
  }
}
