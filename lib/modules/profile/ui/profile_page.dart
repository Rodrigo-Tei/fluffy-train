import 'package:fluffy_train/auth_service.dart';
import 'package:fluffy_train/common/navbar.dart';
import 'package:fluffy_train/commons/text_styles.dart';
import 'package:fluffy_train/modules/profile/bloc/profile_page_bloc.dart';
import 'package:fluffy_train/modules/profile/bloc/profile_page_state.dart';
import 'package:fluffy_train/modules/profile/ui/firend_card.dart';
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
  bool _notificationsSwitch = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleListener(
      BuildContext context, ProfilePageState state) async {}

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: DefaultTheme.grayscale[Grayscale.gray]!),
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
          Container(
            height: 128.0,
            width: 128.0,
            decoration: BoxDecoration(
                color: DefaultTheme.grayscale[Grayscale.lightGray],
                shape: BoxShape.circle),
          ),
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
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amizades',
            style: TextStyles.title1,
          ),
          Container(
            height: 250,
            decoration: _buildBoxDecoration(),
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: <Widget>[
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
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                            return FriendCard();
                          },
                        ),
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return FriendCard();
                          },
                        ),
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return FriendCard();
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
      ),
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
                value: _notificationsSwitch,
                activeColor: DefaultTheme.reds[Reds.crismon],
                onChanged: (bool value) {
                  setState(() {
                    _notificationsSwitch = value;
                  });
                },
              ),
            ],
          ),
        ),
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
                value: _notificationsSwitch,
                activeColor: DefaultTheme.reds[Reds.crismon],
                onChanged: (bool value) {
                  setState(() {
                    _notificationsSwitch = value;
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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: ListView(
                children: [
                  _buildInfoSection(),
                  _buildFriendsSection(),
                  _buildSettingsSection(),
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
