import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week5_bloc_app/bloc/user_list_bloc.dart';
import 'package:flutter_week5_bloc_app/repository/modal/result.dart';
import 'package:flutter_week5_bloc_app/repository/modal/user.dart';
import 'package:flutter_week5_bloc_app/ui/images_widget.dart';
import 'package:flutter_week5_bloc_app/ui/success_screen.dart';

class UserListWidget extends StatefulWidget {
  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {

  UserListBloc _bloc = UserListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bloc.init();
    _bloc.getUserList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text('Bloc Pattren with Stream',style: TextStyle(color: Colors.white),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
          child: Icon(Icons.add,color: Colors.white,size: 35.0,),
          onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ImagesWidget()));
      }),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                stream: _bloc.listenToTextChanges,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
                    if(snapshot.hasData){
                      return Text(snapshot.data.toString());
                    }
                    else{
                      return Text('');
                    }
                  }
              ),
              TextField(
                decoration: InputDecoration(hintText: "Enter Name"),
                onChanged: (value){
                  _bloc.addText(value);
                },
              ),
              
              RaisedButton(
                  onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SuccessScreen()));
              },
              color: Colors.purple,
                child: Text('Navigate',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
//          StreamBuilder(
//              stream: _bloc.userList,
//              builder: (BuildContext context, AsyncSnapshot<Result> snapshot){
//                if(snapshot.data is SuccessState){
//                  List<User> users = (snapshot.data as SuccessState).value;
//                  return ListView.builder(
//                    itemCount: users.length,
//                      itemBuilder: (BuildContext context,int index){
//                        return ListTile(
//                          title: Text(users[index].email),
//                        );
//                      });
//                }else if(snapshot.data is LoadingState){
//                  return CupertinoActivityIndicator(radius: 25.0,animating: true,);
//                }else if(snapshot.data is ErrorState ){
//                  return Text("Something went wrong");
//                }else{
//                  return CupertinoActivityIndicator(radius: 25.0,animating: true,);
//                }
//          }),
        ),
      ),
    );
  }
}
