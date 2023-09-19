import 'package:flutter/material.dart';

import '../model/posts_model.dart';
import 'item_of_posts.dart';

Widget viewOfHome (List<Posts> items, bool isLoading) {
  return Stack( children: [
    ListView.builder ( itemCount: items.length,
      itemBuilder: (ctx, index){
        Posts posts = items[index];
        return itemOfPost(ctx, posts);
      },
    ), // Listview.builder
    isLoading ? const Center(
      child: CircularProgressIndicator (), ) :const SizedBox.shrink()]);}
