

import 'package:flutter_week5_bloc_app/repository/modal/result.dart';
import 'package:http/http.dart';

abstract class RemoteRepository{

 setClient(Client client);

 Future<Result> getUserList();

 Future<Result> getImages();

}