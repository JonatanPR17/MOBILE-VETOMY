import 'package:vetomymobile/domain/auth/models/login_request.dart';
import 'package:vetomymobile/domain/auth/models/signup_request.dart';
import 'package:vetomymobile/domain/auth/models/user_profile.dart';
import 'package:vetomymobile/domain/auth/models/user.dart';

abstract class AuthenticationUsecase {
  Future<void> signup(SignupRequest body);
  Future<UserProfile> login(LoginRequest body);
  Future<void> logout();
  Future<UserProfile?> isLogin();
}
