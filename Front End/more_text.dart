import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  final String tex;
  MoreScreen({super.key, required this.tex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          title: const Text('Search App'),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text(tex)),
            )));
  }
}
