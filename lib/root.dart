import 'package:flutter/material.dart';
import 'presentation/account/account.dart';
import 'presentation/home/home.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Account(),
          Home(),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "Improsso",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.tertiary,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
        ],
        backgroundColor: Theme.of(context).bottomAppBarColor,
      ),
    );
  }
}
