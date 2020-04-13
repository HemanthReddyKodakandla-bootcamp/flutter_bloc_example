import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week5_bloc_app/bloc/images_album_bloc.dart';
import 'package:flutter_week5_bloc_app/repository/modal/album.dart';
import 'package:flutter_week5_bloc_app/repository/modal/result.dart';


class ImagesWidget extends StatefulWidget {
  @override
  _ImagesWidgetState createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  UserListBloc _bloc = UserListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bloc.init();
    _bloc.getImages();
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
      body: Container(
        child: Center(
          child: StreamBuilder(
              stream: _bloc.imagesList,
              builder: (BuildContext context, AsyncSnapshot<Result> snapshot){
                if(snapshot.data is SuccessState){
                  List<ImagesAlbum> images = (snapshot.data as SuccessState).value;
                  return ListView.builder(
                    itemCount: images.length ?? 0,
                      itemBuilder: (context,int index){
                        return  Card(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
                              child: ListTile(
                                leading: Image.network(images[index].url),
                                title: Text(images[index].title),
                              ),
                            ),
                        );
                      });

//                  GridView.count(
//                    primary: true,
//                    crossAxisCount: 2,
//                    childAspectRatio: 0.80,
//                  children: List.generate(images.length, (index){
//                    return Card(
//                      child: Image.network(images[index].url),);
//                  }),
//                );
                }else if(snapshot.data is LoadingState){
                  return CupertinoActivityIndicator(radius: 25.0,animating: true,);
                }else if(snapshot.data is ErrorState ){
                  return Text("Something went wrong");
                }else{
                  return CupertinoActivityIndicator(radius: 25.0,animating: true,);
                }

              }),
        ),
      ),
    );  }
}
