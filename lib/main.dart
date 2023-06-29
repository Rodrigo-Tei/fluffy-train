import 'package:firebase_core/firebase_core.dart';
import 'package:fluffy_train/app.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_bloc.dart';
import 'package:fluffy_train/modules/lesson/bloc/lesson_page_bloc.dart';
import 'package:fluffy_train/modules/profile/bloc/profile_page_bloc.dart';
import 'package:fluffy_train/modules/topic/bloc/topic_page_bloc.dart';
import 'package:fluffy_train/repositories/home_page_repository.dart';
import 'package:fluffy_train/repositories/lesson_page_repository.dart';
import 'package:fluffy_train/repositories/profile_page_repository.dart';
import 'package:fluffy_train/repositories/topic_page_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc(
            HomePageRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => TopicPageBloc(
            TopicPageRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => LessonPageBloc(
            LessonPageRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => ProfilePageBloc(
            ProfilePageRepository(),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
