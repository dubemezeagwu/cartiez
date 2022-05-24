import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }


// * This AuthenticationRepository exposes a stream of AuthenticationStatus updates
// * which will be used to notify the app when a user signs in or out.
class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
          () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() => _controller.add(AuthenticationStatus.unauthenticated);

  // This disposes the stream controller when it is no longer in use.
  void dispose() => _controller.close();
}