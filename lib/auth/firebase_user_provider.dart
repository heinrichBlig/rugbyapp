import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RugbappFirebaseUser {
  RugbappFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

RugbappFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RugbappFirebaseUser> rugbappFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<RugbappFirebaseUser>(
        (user) => currentUser = RugbappFirebaseUser(user));
