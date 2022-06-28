import 'package:auth_app/views/home/home_view.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

int _selectedPage = 1;
PageController _pageController = PageController(initialPage: 1);

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    onPageChange(int index) {
      setState(() {
        _selectedPage = index;
      });
      _pageController.jumpToPage(index);
    }

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: PageView(
          onPageChanged: onPageChange,
          controller: _pageController,
          children: <Widget>[
            Container(
              color: Colors.amber,
            ),
            const HomeView(),
            Container(
              color: Colors.orange,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ""),
          ],
          currentIndex: _selectedPage,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: onPageChange,
        ),
      ),
    );
  }
}
