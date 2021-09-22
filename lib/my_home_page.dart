import 'package:flutter/material.dart';

TextStyle _menuFontStyle = const TextStyle(color: Colors.white, fontSize: 20);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double? _screenHight, _screenWidht;
  bool _openMenu = false;
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  final Duration _duration = const Duration(microseconds: 5000);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(_controller!);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

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
      top: 0,
      bottom: 0,
      left: _openMenu ? 0.6 * _screenWidht! : 0,
      right: _openMenu ? -0.3 * _screenWidht! : 0,
      duration: _duration,
      child: ScaleTransition(
        scale: _scaleAnimation!,
        child: Material(
          borderRadius:
              _openMenu ? const BorderRadius.all(Radius.circular(20)) : null,
          elevation: 8,
          color: const Color(0xFF343442),
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (_openMenu) {
                            _controller!.reverse();
                          } else {
                            _controller!.forward();
                          }
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
                    const Icon(Icons.add),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 200,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          color: Colors.red,
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        Container(
                          color: Colors.blue,
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        Container(
                          color: Colors.amber,
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        Container(
                          color: Colors.green,
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
