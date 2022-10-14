import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/models/dummy_data.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/views/screens/liked_posts.dart';

import 'all_posts.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController pageController;
  initalizeTabController() {
    pageController = TabController(length: 2, vsync: this);
  }

  checkFav(PostModel postModel) {
    int index = posts.indexOf(postModel);
    posts[index].isFavourite = !posts[index].isFavourite!;
    setState(() {});
  }

  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    initalizeTabController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Social App')),
      body: TabBarView(
        children: [AllPostsScreen(checkFav), likedPosts(checkFav)],
        controller: pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
            pageController.animateTo(currentIndex);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favourites',
            )
          ]),
    );
  }
}
