import 'dart:convert';

import 'package:flutter_week5_bloc_app/repository/modal/album.dart';
import 'package:flutter_week5_bloc_app/repository/modal/result.dart';
import 'package:flutter_week5_bloc_app/repository/modal/user.dart';
import 'package:flutter_week5_bloc_app/repository/remote_repository/remote_repository.dart';
import 'package:http/http.dart';
class RemoteRepositoryImpl implements RemoteRepository{

  var client = Client();



  @override
  Future<Result> getUserList() async{
    // TODO: implement getUserList
    
    Response response = await client.get("https://jsonplaceholder.typicode.com/users");

    if(response.statusCode == 200){
      return Result<List<User>>.SuccessState(userFromJson(response.body));
    }
    else{
      return Result<String>.ErrorState('This is error');
    }
    
  }

  @override
  Future<Result> getImages() async {
    // TODO: implement getImages
     Response response = await client.get("https://jsonplaceholder.typicode.com/photos");

    if(response.statusCode == 200){
      return Result<List<ImagesAlbum>>.SuccessState(imagesAlbumFromJson(response.body));
    }
    else{
      return Result<String>.ErrorState('This is error');
    }
  }

  @override
  setClient(Client client) {
    // TODO: implement setClient
      this.client = client;
  }

}