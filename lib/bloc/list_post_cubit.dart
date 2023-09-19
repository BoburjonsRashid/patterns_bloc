import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/pages/create_page.dart';

import '../model/posts_model.dart';
import '../pages/update_page.dart';
import '../service/http_service.dart';
import 'list_post_state.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super (ListPostInit());

  void apiPostList()async{
    emit(ListPostLoading());
    final response=await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response!=null){
      emit(ListPostLoaded(posts: Network.parsecPostList(response)));
    }
    else{
      emit(ListPostError(error: "Couldn't fetch posts"));

    }


  }void apiPostDelete(Posts posts) async {
    emit(ListPostLoading());
    final response = await Network.DEL(
        Network.API_DELETE + posts.id.toString(), Network.paramsEmpty());
    print(response);
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }
  }
  void callUpdatePage(BuildContext context,Posts posts) async {
    print(posts.toJson());
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UpdatePage(
          posts: posts,
        )));
    if (results != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }
  void callCreatePage(BuildContext context) async {
    var results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreatePage()));
    if (results != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }
}