import 'package:fluffy_train/auth_service.dart';
import 'package:fluffy_train/common/navbar.dart';
import 'package:fluffy_train/modules/profile/bloc/profile_page_bloc.dart';
import 'package:fluffy_train/modules/profile/bloc/profile_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

@override
class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleListener(
      BuildContext context, ProfilePageState state) async {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilePageBloc, ProfilePageState>(
      listener: _handleListener,
      builder: (BuildContext context, ProfilePageState state) {
        return Scaffold(
          body: Center(
            child: FloatingActionButton(
              onPressed: () {
                AuthService().signOut(context);
              },
              child: const Text('Sair'),
            ),
          ),
          bottomNavigationBar:
              buildNavBar(NavbarPageIndex.profilePage, context, null),
        );
      },
    );
  }
}
