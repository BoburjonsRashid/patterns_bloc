import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/update_post_cubit.dart';
import '../bloc/update_post_state.dart';
import '../model/posts_model.dart';

import '../views/view_of_update.dart';

class UpdatePage extends StatefulWidget {
  final Posts? posts;

  const UpdatePage({super.key, this.posts});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  Posts? posts;
  @override
  void initState() {
    super.initState();
    titleController.text = widget.posts?.title ?? "";
    bodyController.text = widget.posts?.body ?? "";
  }

  _finish(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UpdatePostCubit(),
        child: BlocBuilder<UpdatePostCubit, UpdatePostState>(
          builder: (BuildContext context, UpdatePostState state) {
            if (state is UpdatePostLoading) {
              String title = titleController.text.toString();
              String body = bodyController.text.toString();
              Posts posts = Posts(
                  id: widget.posts!.id,
                  title: title,
                  body: body,
                  userId: widget.posts!.userId);
              viewOfUpdate(true, context,posts,  titleController,
                  bodyController);
            }
            if (state is UpdatePostLoaded) {
              _finish(context);
            }
            if (state is UpdatePostError) {}
            return viewOfUpdate(
                false, context, widget.posts!, titleController, bodyController);
          },
        ),
      ),
    );
  }
}
