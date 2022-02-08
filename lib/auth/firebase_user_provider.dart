import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ConsolidatedUrbanManagementFirebaseUser {
  ConsolidatedUrbanManagementFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ConsolidatedUrbanManagementFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ConsolidatedUrbanManagementFirebaseUser>
    consolidatedUrbanManagementFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ConsolidatedUrbanManagementFirebaseUser>((user) =>
            currentUser = ConsolidatedUrbanManagementFirebaseUser(user));
