// Ваш основной файл

import 'package:flutter/material.dart';
import 'category_template.dart'; // Импорт вашего шаблона страницы

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: OptionTile(
                  title: 'Поддерживать форму тела',
                  imageAsset: 'assets/fit.png',
                  nextPage: PageTemplate(title: 'Поддерживать форму тела'), // Передача данных о следующей странице
                ),
              ),
              Spacer(),
              Expanded(
                child: OptionTile(
                  title: 'Реабилитация',
                  imageAsset: 'assets/rehab.png',
                  nextPage: PageTemplate(title: 'Реабилитация'), // Передача данных о следующей странице
                ),
              ),
              Spacer(),
              Expanded(
                child: OptionTile(
                  title: 'Физиотерапия',
                  imageAsset: 'assets/physio.png',
                  nextPage: PageTemplate(title: 'Физиотерапия'), // Передача данных о следующей странице
                ),
              ),
              SizedBox(height: 16),
              BottomMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String title;
  final String imageAsset;
  final Widget nextPage; // Добавлено поле для хранения следующей страницы

  const OptionTile({
    required this.title,
    required this.imageAsset,
    required this.nextPage, // Обновленный конструктор
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Замена ListTile на GestureDetector для обработки нажатий
      onTap: () {
        Navigator.push( // Используйте Navigator для открытия новой страницы
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.teal[100],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16.0),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(imageAsset),
            radius: 30,
          ),
          title: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0), bottom: Radius.circular(40.0)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.search,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.category_outlined,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.account_box_outlined,
            size: 40,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
