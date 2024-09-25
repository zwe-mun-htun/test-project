part of '../screens.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    if (authState == AuthState.authenticated) {
      ref.read(homeDataProvider.notifier).loadHomeData();
    } else {
      // Redirect to login if unauthenticated
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(RoutePaths.loginRoute);
      });
    }

    final homeData = ref.watch(homeDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.homeText),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(homeData.text ?? '', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            if (authState == AuthState.authenticated)
              ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                },
                child: const Text(StringConst.logoutText),
              ),
          ],
        ),
      ),
    );
  }
}
