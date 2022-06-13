import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_ui/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage=0;
  final _pages=[
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Instagram',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            FontAwesome.camera,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Feather.tv,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              FontAwesome.send_o,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
currentPage=i;
          });
        }, items: const[
          BottomNavigationBarItem(icon: Icon(Foundation.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Feather.search),label: 'search'),
        BottomNavigationBarItem(icon: Icon(Feather.plus_square),label: 'upload'),
        BottomNavigationBarItem(icon: Icon(Foundation.heart),label: 'likes'),
        BottomNavigationBarItem(icon: Icon(Feather.user),label: 'Account'),
      ],
      ),
    );
  }
}
