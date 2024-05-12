import 'package:flutter/material.dart';

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
                ),
              ),
              Spacer(),
              Expanded(
                child: OptionTile(
                  title: 'Реабилитация',
                  imageAsset: 'assets/rehab.png',
                ),
              ),
              Spacer(),
              Expanded(
                child: OptionTile(
                  title: 'Физиотерапия',
                  imageAsset: 'assets/physio.png',
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

  const OptionTile({
    required this.title,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
