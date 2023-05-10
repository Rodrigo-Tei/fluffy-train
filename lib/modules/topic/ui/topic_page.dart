import 'package:fluffy_train/modules/topic/bloc/topic_page_bloc.dart';
import 'package:fluffy_train/modules/topic/bloc/topic_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

@override
class _TopicPageState extends State<TopicPage> {
  String loremIpsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet lorem ligula. Sed lacinia ullamcorper rutrum. Sed et lorem aliquet, varius risus vitae, consequat tellus. Curabitur vehicula, mauris id aliquet dictum, sem lacus accumsan lacus, eu cursus arcu eros vel quam. Pellentesque a mi dui. Phasellus a augue enim. Integer consectetur, eros eget imperdiet iaculis, libero justo fermentum sapien, et pretium ligula sapien nec augue. Mauris lacinia eleifend commodo. Morbi tristique quam eu dapibus porta. Phasellus quis ex quis turpis hendrerit eleifend. Suspendisse ex magna, vehicula id vestibulum non, elementum sed dui.';
  String loremIpsum2 =
      'Sed dictum massa sit amet neque scelerisque, at faucibus nibh rutrum. Praesent ligula nisl, suscipit id ipsum nec, mollis ultrices tellus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi nec aliquam sem. Duis dapibus turpis hendrerit est aliquam bibendum. Donec quis purus erat. Etiam sit amet metus rhoncus, ultrices augue in, venenatis justo. Nullam accumsan sodales dolor vitae imperdiet. Aliquam venenatis metus vel risus hendrerit, at feugiat diam imperdiet. Nam sit amet porttitor leo. Cras scelerisque orci augue, at tempor quam viverra nec. Nullam condimentum sollicitudin eros eu blandit. Suspendisse faucibus mi eu metus volutpat tempor. Fusce elementum dolor vel magna vestibulum convallis.';
  String loremIpsum3 =
      'Sed sit amet venenatis magna, in pretium tellus. Nam sagittis tortor id mauris tempus sollicitudin sit amet et dolor. Pellentesque hendrerit nisl nec tincidunt suscipit. Fusce nunc enim, sollicitudin suscipit hendrerit vitae, tincidunt vitae neque. Vestibulum vel placerat purus. Curabitur ornare cursus quam quis facilisis. Nulla eget semper lorem. Integer dictum, ex ut faucibus viverra, nisi magna lacinia turpis, non efficitur diam magna nec odio. Ut et lacus ullamcorper, aliquam nulla vel, suscipit lacus. Nullam eget dignissim magna. Donec porttitor sit amet purus non faucibus.';
  String loremIpsum4 =
      'Nam varius neque scelerisque est varius, at bibendum nulla commodo. Donec cursus lorem et sem dictum, efficitur ullamcorper erat vulputate. Mauris accumsan ut magna sit amet sodales. Quisque vel nulla et ligula tincidunt condimentum quis vel augue. Pellentesque eget purus vitae mauris sodales porttitor. Phasellus molestie accumsan sem. Nulla aliquet tellus eget imperdiet rhoncus. Pellentesque mattis, nulla a venenatis commodo, arcu dui posuere nunc, vel eleifend risus velit eget justo. Aenean posuere lacus nisl, vitae efficitur metus hendrerit ut. Quisque non aliquet nunc. Ut posuere vulputate elit, sit amet fringilla risus consectetur non. Nunc turpis elit, porttitor feugiat aliquam scelerisque, vestibulum vitae nisl. Nam dapibus mi a enim facilisis, id mollis libero mattis. Nunc dapibus tempus tellus, id maximus lacus dapibus eu. Cras fermentum lorem facilisis, porta nisl non, lobortis leo.';

  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleListener(
      BuildContext context, TopicPageState state) async {}

  Widget _buildTextBloc(String text, String title) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24.0),
          child: Text(title),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(text),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopicPageBloc, TopicPageState>(
      listener: _handleListener,
      builder: (BuildContext context, TopicPageState state) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Aula 1'),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.music_note)),
                  Tab(icon: Icon(Icons.queue_music)),
                  Tab(icon: FaIcon(FontAwesomeIcons.drum)),
                  Tab(icon: FaIcon(FontAwesomeIcons.book)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _buildTextBloc(loremIpsum, 'TITULO 1'),
                _buildTextBloc(loremIpsum2, 'TITULO 2'),
                _buildTextBloc(loremIpsum3, 'TITULO 3'),
                _buildTextBloc(loremIpsum4, 'TITULO 4'),
              ],
            ),
          ),
        );
      },
    );
  }
}
