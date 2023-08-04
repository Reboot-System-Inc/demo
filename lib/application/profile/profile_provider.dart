// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../domain/profile/review_body.dart';
import '../../infrastructure/profile_repo.dart';
// import '../../route/go_router.dart';
// import '../../utils/utils.dart';
// import '../global.dart';
// import '../local_storage/storage_handler.dart';
import 'profile_state.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) => ProfileNotifier(ref, ProfileRepo()),
  name: 'otherProblemProvider',
);

class ProfileNotifier extends StateNotifier<ProfileState> {
  final Ref ref;
  final ProfileRepo repo;
  ProfileNotifier(this.ref, this.repo) : super(ProfileState.init());
}
