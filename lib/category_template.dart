import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final String title;

  const PageTemplate({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Содержимое страницы $title здесь'),
      ),
    );
  }
}
