import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/auth/auth_provider.dart';
import '../../application/home/home_provider.dart';
import '../../utils/utils.dart';

class HomeScreen extends HookConsumerWidget {
  static String route = "/home";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final state = ref.watch(homeProvider);
    final authState = ref.watch(authProvider);
    // final searchController = useTextEditingController();

    // final isSelectedType = useState(0);
    ref.listen(homeProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        BotToast.showLoading();
      }
      if (previous.loading == true && next.loading == false) {
        BotToast.closeAllLoading();
      }
    });

    useEffect(() {
      Future.wait([
        // Future.microtask(() => ref.read(carServiceProvider.notifier).getYear()),
        // Future.microtask(
        //     () => ref.read(carServiceProvider.notifier).getAllProblems()),
      ]);
      return null;
    }, []);

    //f53d2d

    return Scaffold(
      appBar: AppBar(
        title: Text(context.local.home),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              isLabelVisible: state.notification,
              child: const Icon(Icons.notifications_outlined),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              Center(
                child: Text(
                  context.local.welcomeHome(authState.user.name),
                  style: CustomTextStyle.textStyle16w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
