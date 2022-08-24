import 'package:capstone/src/screens/operations.dart';
import 'package:flutter/material.dart';

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: operations(),
    );
  }
}