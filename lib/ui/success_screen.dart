import 'package:flutter/material.dart';
import 'package:flutter_week5_bloc_app/bloc/success_bloc.dart';


class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  SuccessBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(

      ),
    );
  }
}
