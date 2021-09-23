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
  Animation<double>? _scaleMenuAnimation;
  Animation<Offset>? _menuOffsetAnimation;
  final Duration _duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(_controller!);
    _scaleMenuAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);
    _menuOffsetAnimation = Tween<Offset>(
            begin: const Offset(-1, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeIn));
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
    return SlideTransition(
      position: _menuOffsetAnimation!,
      child: ScaleTransition(
        scale: _scaleMenuAnimation!,
        child: Padding(
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
          child: SingleChildScrollView(
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
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.access_alarm),
                        title: Text('Person $index'),
                        trailing: const Icon(Icons.format_align_center),
                        tileColor: Colors.white,
                      );
                    },
                    shrinkWrap: true,
                    itemCount: 51,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
