// Основной файл

import 'package:flutter/material.dart';
import 'category_template.dart'; // Импорт вашего шаблона страницы
import 'search_page.dart'; // Импорт вашей страницы поиска
import 'profile_page.dart'; // Импорт вашей страницы профиля

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 16), // Добавлен отступ в начале списка
                  OptionTile(
                    title: 'Поддерживать форму тела',
                    imageAsset: 'assets/fit.png',
                    nextPage: PageTemplate(title: 'Поддерживать форму тела'),
                  ),
                  SizedBox(height: 16), // Добавлен отступ между контейнерами
                  OptionTile(
                    title: 'Реабилитация',
                    imageAsset: 'assets/rehab.png',
                    nextPage: PageTemplate(title: 'Реабилитация'),
                  ),
                  SizedBox(height: 16), // Добавлен отступ между контейнерами
                  OptionTile(
                    title: 'Физиотерапия',
                    imageAsset: 'assets/physio.png',
                    nextPage: PageTemplate(title: 'Физиотерапия'),
                  ),
                  SizedBox(height: 16), // Добавлен отступ в конце списка
                ],
              ),
            ),
            BottomMenu(),
          ],
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String title;
  final String imageAsset;
  final Widget nextPage;

  const OptionTile({
    required this.title,
    required this.imageAsset,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
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
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.category_outlined),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.account_box_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
