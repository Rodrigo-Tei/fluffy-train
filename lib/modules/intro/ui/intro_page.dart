import 'package:fluffy_train/models/dialogElement.dart';
import 'package:fluffy_train/models/charDialog.dart';
import 'package:fluffy_train/modules/intro/bloc/intro_page_bloc.dart';
import 'package:fluffy_train/modules/intro/bloc/intro_page_event.dart';
import 'package:fluffy_train/modules/intro/bloc/intro_page_state.dart';
import 'package:fluffy_train/modules/lesson/ui/lesson_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:just_audio/just_audio.dart';

class IntroPage extends StatefulWidget {
  final List<CharDialog>? charDialogList;
  const IntroPage(this.charDialogList, {super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

@override
class _IntroPageState extends State<IntroPage> {
  late List<CharDialog> charDialogList;
  bool _loading = true;
  late IntroPageBloc _introPageBloc;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    _initDialogList();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void _initDialogList() {
    if (widget.charDialogList == null) {
      _introPageBloc = context.read<IntroPageBloc>();
      _introPageBloc.add(FetchIntroPage());
    } else {
      charDialogList = widget.charDialogList!;
      _loading = false;
    }
  }

  Future<void> _handleListener(
      BuildContext context, IntroPageState state) async {
    if (state is IntroPageLoading) {
      _loading = true;
    }
    if (state is IntroPageLoaded) {
      charDialogList = state.charDialogList;
      _loading = false;
    }
  }

  bool isLastDialog() {
    return charDialogList[0].dialogElements.isEmpty &&
        charDialogList.length == 1;
  }

  void _handleTapDialog() {
    player.setAsset('assets/audio/moo.mp3');
    player.play();
    setState(() {
      if (charDialogList[0].dialogElements.isEmpty) {
        charDialogList.removeAt(0);
      } else {
        charDialogList[0].dialogElements.removeAt(0);
      }
    });
  }

  Widget buildDialogElement(DialogElement de) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(0, 248, 152, 253),
      ),
      child: Center(
        child: AnimatedTextKit(
            key: ValueKey(de.text),
            isRepeatingAnimation: false,
            displayFullTextOnTap: true,
            onTap: () => _handleTapDialog(),
            animatedTexts: [
              TyperAnimatedText(de.text),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IntroPageBloc, IntroPageState>(
      listener: _handleListener,
      builder: (BuildContext context, IntroPageState state) {
        return Scaffold(
          body: _loading
              ? Container()
              : isLastDialog()
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const LessonPage(null)),
                                ),
                              );
                            },
                            child: const Text('Ir para Exercícios'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Ir para Home'),
                          ),
                        ],
                      ),
                    )
                  : GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _handleTapDialog(),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                child: Text(
                                  charDialogList[0].character,
                                  style: const TextStyle(fontSize: 40.0),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                child: const Image(
                                  image: AssetImage(
                                      'assets/images/baterista_image.jpeg'),
                                  width: 200,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 500,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 5,
                                  ),
                                ),
                                margin: const EdgeInsets.all(5.0),
                                child: buildDialogElement(
                                    charDialogList[0].dialogElements[0]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
