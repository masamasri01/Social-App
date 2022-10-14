// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:instagram/views/screens/liked_posts.dart';

import '../../models/post_model.dart';

class PostWidget extends StatefulWidget {
  PostModel postModel;
  Function? function;
  PostWidget(this.postModel, [this.function]);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.postModel.postUserModel!.image!),
                radius: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.postModel.postUserModel!.name!),
                  Text('Since 23 minuites')
                ],
              )
            ],
          ),
        ),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.postModel.image!))),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              InkWell(
                child: Icon(
                  Icons.favorite,
                  size: 30,
                  color:
                      widget.postModel.isFavourite! ? Colors.red : Colors.grey,
                ),
                onTap: () {
                  widget.function!(widget.postModel);
                  // widget.postModel.isFavourite = !widget.postModel.isFavourite!;
                },
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.share,
                size: 30,
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.postModel.content ?? '',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )),
            )),
        const Divider()
      ],
    );
  }
}
