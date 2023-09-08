import 'package:fluffy_train/models/friend.dart';
import 'package:fluffy_train/modules/profile/bloc/profile_page_event.dart';
import 'package:fluffy_train/modules/profile/bloc/profile_page_state.dart';
import 'package:fluffy_train/repositories/profile_page_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  final ProfilePageRepository profilePageRepository;

  ProfilePageBloc(this.profilePageRepository) : super(ProfilePageLoading()) {
    on<FetchProfilePage>((event, emit) async {
      emit(ProfilePageLoading());
      List<Friend> followers = await profilePageRepository.getFollowers();
      emit(ProfilePageLoaded(followers));
    });
  }
}
