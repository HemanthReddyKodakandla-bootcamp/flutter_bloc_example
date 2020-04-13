// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_week5_bloc_app/repository/modal/result.dart';
import 'package:flutter_week5_bloc_app/repository/modal/user.dart';
import 'package:flutter_week5_bloc_app/repository/remote_repository/remote_repository.dart';
import 'package:flutter_week5_bloc_app/repository/remote_repository/remote_repository_impl.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import 'mocked_client.dart';


void main() {
 group("Testing network Calls", (){
   test("Testing Successful network call", () async{
     RemoteRepository repository = RemoteRepositoryImpl();
     var mockedClient = MockedClient();
     repository.setClient(mockedClient);
     when(mockedClient.get("https://jsonplaceholder.typicode.com/users")).thenAnswer((_) async =>
         Response('[{"id": 1,"name": "Leanne Graham","username": "Bret","email": "Sincere@april.biz","address": {"street": "Kulas Light","suite": "Apt. 556","city": "Gwenborough","zipcode": "92998-3874","geo": {"lat": "-37.3159","lng": "81.1496"}},"phone": "1-770-736-8031 x56442","website": "hildegard.org","company": {"name": "Romaguera-Crona","catchPhrase": "Multi-layered client-server neural-net","bs": "harness real-time e-markets"}}]',200));
     expect(await repository.getUserList(), isInstanceOf<SuccessState<List<User>>>());
   });

   test("Testing Error network call", () async{
     RemoteRepository repository = RemoteRepositoryImpl();
     var mockedClient = MockedClient();
     repository.setClient(mockedClient);
     when(mockedClient.get("https://jsonplaceholder.typicode.com/users")).thenAnswer((_) async =>
         Response('Not Found',404));
     expect(await repository.getUserList(), isInstanceOf<ErrorState<String>>());
   });
 });
}
