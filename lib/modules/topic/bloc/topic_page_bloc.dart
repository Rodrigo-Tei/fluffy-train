import 'package:fluffy_train/modules/topic/bloc/topic_page_event.dart';
import 'package:fluffy_train/modules/topic/bloc/topic_page_state.dart';
import 'package:fluffy_train/repositories/topic_page_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicPageBloc extends Bloc<TopicPageEvent, TopicPageState> {
  final TopicPageRepository topicPageRepository;

  TopicPageBloc(this.topicPageRepository) : super(TopicPageLoading()) {
    on<FetchTopicPage>((event, emit) async {});
  }
}
