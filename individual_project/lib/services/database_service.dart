import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:individual_project/objects/alarmObject.dart';
import 'package:individual_project/objects/historyObject.dart';
import 'package:individual_project/objects/user.dart';


class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return AppUser.fromFirebase(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AppUser?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return AppUser.fromFirebase(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<AppUser?> get currentUser {
    return _fAuth
        .authStateChanges()
        .map((User? user) => user != null ? AppUser.fromFirebase(user) : null);
  }
}

class DataBaseService{
  final CollectionReference _alarmsCollection = FirebaseFirestore.instance.collection('alarms');
  final CollectionReference _historyCollection = FirebaseFirestore.instance.collection('history');

  Future addHistory(History history) async{
    return await _historyCollection.doc(history.uid).set(history.toMap());
  }
  Stream<List<History>> getHistory(String? author){
    Query query;
    query = _historyCollection.where('author',isEqualTo: author);
    return query.snapshots().map((QuerySnapshot data) =>
    data.docs.map((DocumentSnapshot doc) => History.fromJson(doc.id, doc.data() as Map<String,dynamic>)).toList()
    );
  }

  Future addAndEditAlarms(Alarm alarm) async{
    return await _alarmsCollection.doc(alarm.uid).set(alarm.toMap());

  }
  Future editAlarms(Alarm alarm, String uid) async{
    return await _alarmsCollection.doc(alarm.uid).set(alarm.toMap());

  }
  Future removeAlarm(Alarm alarm) async{
    return await _alarmsCollection.doc(alarm.uid).delete();
  }

  Stream<List<Alarm>> getAlarms(String? author){
    Query query;
      query = _alarmsCollection.where('author', isEqualTo: author);
    return query.snapshots().map((QuerySnapshot data) =>
    data.docs.map((DocumentSnapshot doc) => Alarm.fromJson(doc.id,doc.data() as Map<String, dynamic>)).toList());

  }
  Future removeHistoryAll() async {
    var snapshots = await _historyCollection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}