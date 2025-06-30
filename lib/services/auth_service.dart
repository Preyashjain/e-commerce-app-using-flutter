import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return {'success': true, 'message': 'Login Successful'};
    } on FirebaseAuthException catch (e) {
      return {'success': false, 'message': e.message ?? 'Login failed'};
    } catch (e) {
      return {'success': false, 'message': 'An unexpected error occurred.'};
    }
  }

  Future<Map<String, dynamic>> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return {'success': true, 'message': 'Registration Successful'};
    } on FirebaseAuthException catch (e) {
      return {'success': false, 'message': e.message ?? 'Registration failed'};
    } catch (e) {
      return {'success': false, 'message': 'An unexpected error occurred.'};
    }
  }
}
