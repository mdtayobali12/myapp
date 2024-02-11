import 'package:flutter/material.dart';

import 'allpage/product_page.dart';

class DeginPage extends StatelessWidget {
  const DeginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
        ),
      ),
      home: const ProductPage(),
    );
  }
}
