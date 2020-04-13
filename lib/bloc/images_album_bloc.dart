
import 'dart:async';

import 'package:flutter_week5_bloc_app/bloc/bloc_base.dart';
import 'package:flutter_week5_bloc_app/repository/modal/result.dart';
import 'package:flutter_week5_bloc_app/repository/repository.dart';
import 'package:flutter_week5_bloc_app/repository/repository_impl.dart';

class UserListBloc implements BlocBase{

  Repository _repository;
  StreamController _imagesStream;

  Stream<Result> get imagesList => _imagesStream.stream;

  @override
  void dispose() {
    // TODO: implement dispose
    _imagesStream.close();
  }

  @override
  void init() {
    // TODO: implement init
    _imagesStream = new StreamController<Result>();
    _repository = RepositoryImpl();
  }

    getImages(){
    _imagesStream.sink.add(Result<String>.LoadingState("Loading.."));
    _repository.getImages().then((Result result){
      if(result is SuccessState){
        _imagesStream.sink.add(result);
      }else{
        _imagesStream.sink.add(result);
      }
    });
  }


}