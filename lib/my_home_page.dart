import 'package:flutter/material.dart';

TextStyle _menuFontStyle = const TextStyle(color: Colors.white, fontSize: 20);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? _screenHight, _screenWidht;
  bool _openMenu = false;

  @override
  Widget build(BuildContext context) {
    _screenHight = MediaQuery.of(context).size.height;
    _screenWidht = MediaQuery.of(context).size.width;
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
    return AnimatedPositioned(
      top: _openMenu ? 0.15 * _screenHight! : 0,
      bottom: _openMenu ? 0.15 * _screenHight! : 0,
      left: _openMenu ? 0.6 * _screenWidht! : 0,
      right: _openMenu ? -0.3 * _screenWidht! : 0,
      duration: const Duration(milliseconds: 400),
      child: Material(
        borderRadius:
            _openMenu ? const BorderRadius.all(Radius.circular(20)) : null,
        elevation: 8,
        color: const Color(0xFF343442),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: InkWell(
            onTap: () {
              setState(() {
                _openMenu = false;
              });
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _openMenu = !_openMenu;
                        });
                      },
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'My Cards',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Icon(Icons.add),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
