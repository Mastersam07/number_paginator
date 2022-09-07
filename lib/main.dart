import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final int _numPerPage = 10;
  int _currentPage = 0;

  List<String> items = List.generate(
    49,
    (index) => 'Index ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    int initBoundary = _currentPage * 10;
    int finalBoundary = (items.length - 1) > (initBoundary + 10)
        ? (initBoundary + 10)
        : items.length;
    List<String> newList = items.sublist(initBoundary, finalBoundary);
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Number Paginator Example"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: newList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 70,
                    color: Colors.red,
                    child: Center(
                      child: Text(newList[index]),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                NumberPaginator(
                  initialPage: _currentPage,
                  numberPages: (items.length / _numPerPage).ceil(),
                  onPageChange: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
