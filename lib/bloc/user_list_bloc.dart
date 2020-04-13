
import 'dart:async';

import 'package:flutter_week5_bloc_app/bloc/bloc_base.dart';
import 'package:flutter_week5_bloc_app/repository/modal/result.dart';
import 'package:flutter_week5_bloc_app/repository/repository.dart';
import 'package:flutter_week5_bloc_app/repository/repository_impl.dart';
import 'package:flutter_week5_bloc_app/utils/validator.dart';

class UserListBloc with Validator implements BlocBase{

  StreamController<Result> _userListStream;
  Repository _repository;

  StreamController<String> _textStream;

  Function(String) get addText => _textStream.sink.add;

  Stream<Result> get userList => _userListStream.stream;


  Stream<bool> get listenToTextChanges => _textStream.stream.map((value){
    _repository.saveName(value);
  }).transform(streamTransformer);

  @override
  void dispose() {
    // TODO: implement dispose
    _userListStream.close();
    _textStream.close();
  }

  @override
  void init() {
    // TODO: implement init
    _userListStream = StreamController<Result>();
    _textStream = StreamController<String>.broadcast();

    _repository = RepositoryImpl();
  }

   getUserList(){
    _userListStream.sink.add(Result<String>.LoadingState("Loading.."));
     _repository.getUserList().then((Result result){
      if(result is SuccessState){
        _userListStream.sink.add(result);
      }else{
        _userListStream.sink.add(result);
      }
    });
  }


}