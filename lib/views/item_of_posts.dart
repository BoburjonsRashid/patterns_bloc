
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/list_post_cubit.dart';
import '../model/posts_model.dart';

Widget itemOfPost(BuildContext context, Posts posts) {
  return Slidable(
    startActionPane: ActionPane(
      extentRatio: 0.25,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            BlocProvider.of<ListPostCubit>(context).callUpdatePage(context, posts);
          },
          backgroundColor: Color(0xFF21B7CA),
          foregroundColor: Colors.white,
          icon: Icons.update,
          label: 'Update',
        ),
      ],
    ),

    endActionPane: ActionPane(
      extentRatio: 0.25,
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            BlocProvider.of<ListPostCubit>(context).apiPostDelete(posts);
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            posts.title!.toUpperCase(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(posts.body!),
        ],
      ),
    ),
  );
}