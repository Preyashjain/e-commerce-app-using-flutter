class AuthService {
  // Mock authentication service without Firebase dependency
  static final List<Map<String, String>> _users = [];

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Check if user exists with correct password
      final user = _users.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => {},
      );
      
      if (user.isNotEmpty) {
        return {'success': true, 'message': 'Login Successful'};
      } else {
        return {'success': false, 'message': 'Invalid email or password'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Unexpected error occurred'};
    }
  }

  Future<Map<String, dynamic>> register(String email, String password) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Check if user already exists
      final existingUser = _users.any((user) => user['email'] == email);
      
      if (existingUser) {
        return {'success': false, 'message': 'User already exists'};
      }
      
      // Add new user
      _users.add({'email': email, 'password': password});
      return {'success': true, 'message': 'Registration Successful'};
    } catch (e) {
      return {'success': false, 'message': 'Unexpected error occurred'};
    }
  }
}
