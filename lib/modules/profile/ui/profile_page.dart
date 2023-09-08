import 'package:fluffy_train/auth_service.dart';
import 'package:fluffy_train/common/navbar.dart';
import 'package:fluffy_train/commons/text_styles.dart';
import 'package:fluffy_train/models/friend.dart';
import 'package:fluffy_train/modules/profile/bloc/profile_page_bloc.dart';
import 'package:fluffy_train/modules/profile/bloc/profile_page_event.dart';
import 'package:fluffy_train/modules/profile/bloc/profile_page_state.dart';
import 'package:fluffy_train/modules/profile/ui/friend_card.dart';
import 'package:fluffy_train/modules/profile/ui/profile_placeholder.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

@override
class _ProfilePageState extends State<ProfilePage> {
  late ProfilePageBloc _profilePageBloc;
  bool _loading = true;
  bool _enableNotifications = false;
  bool _enableCharacterLines = false;
  List<Friend> followers = [];

  @override
  void initState() {
    super.initState();
    _profilePageBloc = context.read<ProfilePageBloc>();
    _profilePageBloc.add(FetchProfilePage());
  }

  Future<void> _handleListener(
      BuildContext context, ProfilePageState state) async {
    if (state is ProfilePageLoading) {
      _loading = true;
    }
    if (state is ProfilePageLoaded) {
      followers = state.followers;
      _loading = false;
    }
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 2.0,
        color: DefaultTheme.grayscale[Grayscale.gray]!,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(8.0),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: DefaultTheme.grayscale[Grayscale.white],
      elevation: 2.0,
      title: Text(
        'Perfil',
        style: TextStyles.title1,
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: _buildBoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profilePlaceholder(128.0),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name Placeholder',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.title3,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'nameplaceholder@gmail.com',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.paragraph3,
                ),
                const SizedBox(height: 4.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: DefaultTheme.reds[Reds.crismon],
                  ),
                  onPressed: () {},
                  child: Text(
                    'Editar',
                    style: TextStyles.highlight3White,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amizades',
          style: TextStyles.title1,
        ),
        const SizedBox(height: 12.0),
        Container(
          height: 300,
          decoration: _buildBoxDecoration(),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Material(
                  color: Colors.transparent,
                  child: TabBar(
                    isScrollable: true,
                    labelStyle: TextStyles.title2,
                    indicatorColor: DefaultTheme.reds[Reds.crismon],
                    labelColor: DefaultTheme.grayscale[Grayscale.black],
                    unselectedLabelColor:
                        DefaultTheme.grayscale[Grayscale.gray],
                    tabs: const [
                      Tab(text: "Seguidores"),
                      Tab(text: "Seguindo"),
                      Tab(text: "Encontre"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: followers.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return FriendCard(
                            index == 0,
                            index == followers.length - 1,
                            followers[index],
                          );
                        },
                      ),
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return FriendCard(
                            index == 0,
                            index == 1,
                            followers[index],
                          );
                        },
                      ),
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return FriendCard(
                            index == 0,
                            index == 4,
                            followers[index],
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Configurações',
          style: TextStyles.title1,
        ),
        const SizedBox(height: 12.0),
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: _buildBoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ativar as notificações',
                    style: TextStyles.title2,
                  ),
                  Text(
                    'Saiba quando sua streak vai acabar.',
                    style: TextStyles.paragraph3,
                  )
                ],
              ),
              Switch(
                value: _enableNotifications,
                activeColor: DefaultTheme.reds[Reds.crismon],
                onChanged: (bool value) {
                  setState(() {
                    _enableNotifications = value;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: _buildBoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explicações iniciais',
                      style: TextStyles.title2,
                    ),
                    Text(
                      'Habilite as explicações das matérias dadas pelos personagens.',
                      maxLines: 3,
                      style: TextStyles.paragraph3,
                    )
                  ],
                ),
              ),
              Switch(
                value: _enableCharacterLines,
                activeColor: DefaultTheme.reds[Reds.crismon],
                onChanged: (bool value) {
                  setState(() {
                    _enableCharacterLines = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoggoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: DefaultTheme.reds[Reds.crismon],
        ),
        onPressed: () {
          AuthService().signOut(context);
        },
        child: Text(
          'Sair',
          style: TextStyles.highlight3White,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilePageBloc, ProfilePageState>(
      listener: _handleListener,
      builder: (BuildContext context, ProfilePageState state) {
        return Scaffold(
          appBar: _buildAppbar(),
          body: _loading
              ? Container()
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 16.0,
                    ),
                    child: ListView(
                      children: [
                        _buildInfoSection(),
                        const SizedBox(height: 24.0),
                        _buildFriendsSection(),
                        const SizedBox(height: 24.0),
                        _buildSettingsSection(),
                        const SizedBox(height: 12.0),
                        _buildLoggoutButton(),
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar:
              buildNavBar(NavbarPageIndex.profilePage, context, null),
        );
      },
    );
  }
}
