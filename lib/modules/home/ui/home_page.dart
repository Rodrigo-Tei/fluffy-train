import 'package:fluffy_train/modules/home/bloc/home_page_bloc.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleListener(
      BuildContext context, HomePageState state) async {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
        listener: _handleListener,
        builder: (BuildContext context, HomePageState state) {
          return const Scaffold(
            body: Text('HomePage'),
          );
        });
  }
}
