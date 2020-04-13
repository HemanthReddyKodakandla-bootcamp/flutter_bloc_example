
import 'package:flutter_week5_bloc_app/repository/local_repository/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository{

  LocalRepositoryImpl._privateConstructor();
  static final  LocalRepositoryImpl _instance = LocalRepositoryImpl();

  factory LocalRepositoryImpl(){
    return _instance;
  }

  String name;
  @override
  String getName() {
    // TODO: implement getName
    return name;
  }

  @override
  saveName(String name) {
    // TODO: implement saveName
    this.name = name;
  }




}