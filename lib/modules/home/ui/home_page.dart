import 'package:fluffy_train/modules/home/bloc/home_page_bloc.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_state.dart';
import 'package:fluffy_train/modules/home/ui/lesson_button.dart';
import 'package:fluffy_train/modules/home/ui/lesson_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> {
  Offset _dialogPosition = Offset.zero;
  bool _showDialog = false;
  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleListener(
      BuildContext context, HomePageState state) async {}

  EdgeInsetsGeometry _calculateMargin(int index) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final int position = index % 8;

    switch (position) {
      case 0:
        return const EdgeInsets.only(left: 0, top: 8.0);
      case 1:
        return EdgeInsets.only(left: screenWidth / 3, top: 8.0);
      case 2:
        return EdgeInsets.only(left: screenWidth / 2, top: 16.0);
      case 3:
        return EdgeInsets.only(left: screenWidth / 3, top: 16.0);
      case 4:
        return const EdgeInsets.only(left: 0, top: 8.0);
      case 5:
        return EdgeInsets.only(right: screenWidth / 3, top: 8.0);
      case 6:
        return EdgeInsets.only(right: screenWidth / 2, top: 16.0);
      case 7:
        return EdgeInsets.only(right: screenWidth / 3, top: 16.0);
      default:
        return const EdgeInsets.only(left: 0);
    }
  }

  void _toggleDialog(Offset buttonPosition) {
    setState(() {
      _dialogPosition = buttonPosition;
      _showDialog = !_showDialog;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: _handleListener,
      builder: (BuildContext context, HomePageState state) {
        return Scaffold(
          body: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Container(
                  margin: _calculateMargin(index),
                  child: Stack(
                    children: [
                      LessonButton(toggleDialog: _toggleDialog),
                      if (_showDialog)
                        LessonDialog(dialogPosition: _dialogPosition),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
