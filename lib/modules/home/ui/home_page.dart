import 'package:fluffy_train/commons/text_styles.dart';
import 'package:fluffy_train/models/lesson.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_bloc.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_event.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_state.dart';
import 'package:fluffy_train/modules/home/ui/lesson_button.dart';
import 'package:fluffy_train/modules/home/ui/lesson_dialog.dart';
import 'package:fluffy_train/modules/home/ui/unit_card.dart';
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
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late HomePageBloc _homePageBloc;
  Offset _dialogPosition = Offset.zero;
  bool _showDialog = false;
  double _turns = 0.0;
  List<Lesson> lessons = [];

  bool _isExpanded = false;

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

  void _expandUnitList() {
    setState(() {
      _isExpanded = !_isExpanded;
      _turns += 0.5;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: _isExpanded ? 0.0 : 2.0,
      centerTitle: true,
      backgroundColor: DefaultTheme.grayscale[Grayscale.white],
      title: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
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
                  style: TextStyles.title3,
                ),
              ],
            ),
            GestureDetector(
              onTap: _expandUnitList,
              child: Row(
                children: [
                  Text(
                    'Unidade 1',
                    style: TextStyles.title3,
                  ),
                  AnimatedRotation(
                    turns: _turns,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: DefaultTheme.grayscale[Grayscale.black],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '5',
                  style: TextStyles.title3,
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
          body: Column(
            children: [
              AnimatedCrossFade(
                firstChild: Container(),
                secondChild: Container(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  margin: const EdgeInsets.only(bottom: 12.0),
                  height: 141.0,
                  decoration: BoxDecoration(
                    color: DefaultTheme.grayscale[Grayscale.white],
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2.0,
                        offset: Offset(0, 0.5),
                      )
                    ],
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return UnitCard(
                        isFirst: index == 0,
                        isLast: index == 3,
                        isExpanded: _isExpanded,
                      );
                    },
                  ),
                ),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
              Expanded(
                child: GestureDetector(
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
                      if (_showDialog)
                        LessonDialog(dialogPosition: _dialogPosition),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
