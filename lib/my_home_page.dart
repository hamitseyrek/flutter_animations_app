import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final TextStyle _menuFontStyle =
      const TextStyle(color: Colors.white, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF343442),
      body: SafeArea(
        child: Stack(
          children: [
            createMenu(context),
            createDashboard(context),
          ],
        ),
      ),
    );
  }

  Widget createMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: _menuFontStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Messages',
              style: _menuFontStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Utility Bills',
              style: _menuFontStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Branches',
              style: _menuFontStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget createDashboard(BuildContext context) {
    return Material(
      elevation: 8,
      color: const Color(0xFF343442),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                Text(
                  'My Cards',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Icon(Icons.add),
              ],
            )
          ],
        ),
      ),
    );
  }
}
