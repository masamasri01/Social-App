import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/models/dummy_data.dart';
import 'package:instagram/views/widgets/post_widget.dart';

class AllPostsScreen extends StatelessWidget {
  Function? function;
  AllPostsScreen(this.function);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostWidget(posts[index], function!);
      },
    );
  }
}
