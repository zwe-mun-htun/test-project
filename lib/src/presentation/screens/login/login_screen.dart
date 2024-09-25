part of '../screens.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final authState = ref.watch(authProvider);
    final authController = ref.read(authProvider.notifier);

    useEffect(() {
      if (authState == AuthState.authenticated) {
        Future.microtask(() => context.go('/'));
      }
      return null;
    }, [authState]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            if (authState == AuthState.loading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () {
                  final username = userNameController.text.trim();
                  final password = passwordController.text.trim();
                  authController.login(username, password);
                },
                child: const Text('Login'),
              ),
            if (authState == AuthState.error)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Login failed. Please try again.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
