

import 'package:flutter_week5_bloc_app/repository/local_repository/local_repository.dart';
import 'package:flutter_week5_bloc_app/repository/local_repository/local_repository_impl.dart';
import 'package:flutter_week5_bloc_app/repository/modal/result.dart';
import 'package:flutter_week5_bloc_app/repository/modal/user.dart';
import 'package:flutter_week5_bloc_app/repository/remote_repository/remote_repository.dart';
import 'package:flutter_week5_bloc_app/repository/remote_repository/remote_repository_impl.dart';
import 'package:flutter_week5_bloc_app/repository/repository.dart';
import 'modal/album.dart';

class RepositoryImpl implements Repository{

  RemoteRepository _remoteRepository = RemoteRepositoryImpl();
  LocalRepository _localRepository = LocalRepositoryImpl();

  @override
  Future<Result> getUserList() {
    // TODO: implement Future
    return _remoteRepository.getUserList();
  }

  Future<Result> getImages() {
    // TODO: implement Future
    return _remoteRepository.getImages();
  }

  @override
  String getName() {
    // TODO: implement getName
    return _localRepository.getName();
  }

  @override
  saveName(String name) {
    // TODO: implement saveName
_localRepository.saveName(name);
  }

}