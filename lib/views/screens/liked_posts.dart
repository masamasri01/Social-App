import 'package:flutter/cupertino.dart';

import '../../models/dummy_data.dart';
import '../widgets/post_widget.dart';

class likedPosts extends StatelessWidget {
  Function? function;
  likedPosts(this.function);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return PostWidget(
            posts.where((element) => element.isFavourite!).toList()[index],
            function!);
      },
      itemCount: posts.where((element) => element.isFavourite!).length,
    );
  }
}
