import 'package:flutter_week5_bloc_app/repository/modal/album.dart';
import 'package:flutter_week5_bloc_app/repository/modal/result.dart';

import 'modal/user.dart';
abstract class Repository{
  Future<Result> getUserList();

  Future<Result> getImages();

  String getName();

  saveName(String name);

}