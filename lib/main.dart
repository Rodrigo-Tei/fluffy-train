import 'package:fluffy_train/app.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_bloc.dart';
import 'package:fluffy_train/repositories/home_page_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc(
            HomePageRepository(),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
