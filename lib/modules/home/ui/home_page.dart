import 'package:fluffy_train/models/lesson.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_bloc.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_event.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_state.dart';
import 'package:fluffy_train/modules/home/ui/lesson_button.dart';
import 'package:fluffy_train/modules/home/ui/lesson_dialog.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  late HomePageBloc _homePageBloc;
  Offset _dialogPosition = Offset.zero;
  bool _showDialog = false;

  List<Lesson> lessons = [];

  @override
  void initState() {
    super.initState();
    _homePageBloc = context.read<HomePageBloc>();
    _homePageBloc.add(FetchHomePage());
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _handleListener(
      BuildContext context, HomePageState state) async {
    if (state is HomePageLoaded) {
      lessons = state.lessons;
    }
  }

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

  void _handlePopDialog() {
    if (_showDialog) {
      setState(() {
        _showDialog = !_showDialog;
      });
    }
  }

  void _scrollListener() {
    _handlePopDialog();
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: DefaultTheme.grayscale[Grayscale.white],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/heart-colored.svg',
                height: 20.0,
                width: 20.0,
                allowDrawingOutsideViewBox: true,
              ),
              const SizedBox(width: 4.0),
              Text(
                '5',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: DefaultTheme.grayscale[Grayscale.black],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Unidade 1',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: DefaultTheme.grayscale[Grayscale.black],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '5',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: DefaultTheme.grayscale[Grayscale.black],
                ),
              ),
              const SizedBox(width: 4.0),
              SvgPicture.asset(
                'assets/icons/fire-colored.svg',
                height: 20.0,
                width: 20.0,
                allowDrawingOutsideViewBox: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: _handleListener,
      builder: (BuildContext context, HomePageState state) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: GestureDetector(
            onTap: _handlePopDialog,
            child: Stack(
              children: [
                ListView.builder(
                  controller: _scrollController,
                  itemCount: lessons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: Container(
                        margin: _calculateMargin(index),
                        child: LessonButton(
                            toggleDialog: _toggleDialog,
                            lesson: lessons[index]),
                      ),
                    );
                  },
                ),
                if (_showDialog) LessonDialog(dialogPosition: _dialogPosition),
              ],
            ),
          ),
        );
      },
    );
  }
}
