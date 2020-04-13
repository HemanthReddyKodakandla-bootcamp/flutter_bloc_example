import 'dart:async';

class Validator{

  StreamTransformer<String, bool> streamTransformer = StreamTransformer<String, bool>.fromHandlers(handleData:(String data,sink){
    if(data.length >= 8){
      sink.add(true);
    }else{
      sink.add(false);
    }
  } );
}