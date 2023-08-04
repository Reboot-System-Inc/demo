import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../application/auth/auth_provider.dart';
// import '../../application/auth/loggedin_provider.dart';
// import '../../application/home/home_provider.dart';

import '../../utils/utils.dart';
import '../cart/cart_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

final bottomNavigatorKey = GlobalKey();

class MainNav extends HookConsumerWidget {
  static const route = '/main_nav';

  const MainNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authState = ref.watch(authProvider);
    // final user = ref.watch(loggedInProvider);

    final navIndex = useState(0);
    final navWidget = [
      const HomeScreen(),
      const Text("Message"),
      const CartScreen(),
      const ProfileScreen(),
    ];

    useEffect(() {
      Future.wait([
        // Future.microtask(() => ref.read(homeProvider.notifier).getHomeData()),
      ]);

      // Future.microtask(() => ref.read(homeProvider.notifier).getHomeData());

      // Future.microtask(
      //     () => ref.read(categoryProvider.notifier).fetchAllCategories());
      // ref.watch(loggedInProvider).isLoggedIn
      //     ? Future.microtask(() => ref.read(cartProvider.notifier).fetchCart())
      //     : null;
      // Future.microtask(() =>
      //     ref.read(instructorProvider.notifier).fetchAllFeaturedInstructors());
      return null;
    }, []);

    return LayoutBuilder(builder: (context, constrain) {
      // Logger.i("constrain: $constrain");
      return Scaffold(
        body: navWidget[navIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorPalate.white,
          key: bottomNavigatorKey,
          currentIndex: navIndex.value,
          onTap: (index) {
            navIndex.value = index;
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          selectedItemColor: context.color.primary,
          unselectedItemColor: ColorPalate.black,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                Images.iconHome,
                width: 24.w,
                height: 24.h,
                color: navIndex.value == 0
                    ? context.color.primary
                    : ColorPalate.black,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Images.iconMessage,
                width: 24.w,
                height: 24.h,
                color: navIndex.value == 1
                    ? context.color.primary
                    : ColorPalate.black,
              ),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Images.iconCart,
                width: 24.w,
                height: 24.h,
                color: navIndex.value == 2
                    ? context.color.primary
                    : ColorPalate.black,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Images.iconAccount,
                width: 24.w,
                height: 24.h,
                color: navIndex.value == 3
                    ? context.color.primary
                    : ColorPalate.black,
              ),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
