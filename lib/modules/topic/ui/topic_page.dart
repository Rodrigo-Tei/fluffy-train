import 'package:fluffy_train/modules/topic/bloc/topic_page_bloc.dart';
import 'package:fluffy_train/modules/topic/bloc/topic_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

@override
class _TopicPageState extends State<TopicPage> {
  String loremIpsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet lorem ligula. Sed lacinia ullamcorper rutrum. Sed et lorem aliquet, varius risus vitae, consequat tellus. Curabitur vehicula, mauris id aliquet dictum, sem lacus accumsan lacus, eu cursus arcu eros vel quam. Pellentesque a mi dui. Phasellus a augue enim. Integer consectetur, eros eget imperdiet iaculis, libero justo fermentum sapien, et pretium ligula sapien nec augue. Mauris lacinia eleifend commodo. Morbi tristique quam eu dapibus porta. Phasellus quis ex quis turpis hendrerit eleifend. Suspendisse ex magna, vehicula id vestibulum non, elementum sed dui.';

  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleListener(
      BuildContext context, TopicPageState state) async {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopicPageBloc, TopicPageState>(
      listener: _handleListener,
      builder: (BuildContext context, TopicPageState state) {
        return Scaffold(
          body: Column(
            children: [const Text('Título'), Text(loremIpsum)],
          ),
        );
      },
    );
  }
}
