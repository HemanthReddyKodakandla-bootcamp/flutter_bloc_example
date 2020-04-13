import 'package:flutter_week5_bloc_app/repository/repository.dart';
import 'package:flutter_week5_bloc_app/repository/repository_impl.dart';

import 'bloc_base.dart';


class SuccessBloc extends BlocBase{

  Repository _repository;

  String getName() => _repository.getName();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
    _repository = RepositoryImpl();
  }

}