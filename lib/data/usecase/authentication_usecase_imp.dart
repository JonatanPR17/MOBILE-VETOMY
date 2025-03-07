import 'package:vetomymobile/data/source/vettomy.dart/auth_api.dart';
import 'package:vetomymobile/data/source/localstorage/auth_storage.dart';
import 'package:vetomymobile/domain/auth/models/login_response.dart';
import 'package:vetomymobile/domain/auth/models/user_profile.dart';
import 'package:vetomymobile/domain/auth/models/signup_request.dart';
import 'package:vetomymobile/domain/auth/models/login_request.dart';
import 'package:vetomymobile/domain/auth/usecase/authentication_usecase.dart';

class AuthenticationUsecaseImpl implements AuthenticationUsecase {
  final AuthApi _auth = AuthApi();
  final AuthStorage _storage = AuthStorage();

  @override
  Future<UserProfile?> isLogin() async {
    // buscar el tocal localmente
    String? tokenLocal = await _storage.getToken();
    // Validamos el token
    // si existe y es valido, retornamos el user profile
    UserProfile? profile = await _storage.getProfile();
    return profile;
  }

  @override
  Future<UserProfile> login(LoginRequest body) async {
    // llamar al servicio para inicioar sesion
    LoginResponse res = await _auth.login(body);
    // validar los datos de inicio de sesion
    //
    // Guardar los datos de inicio de sesion
    await _storage.saveToken(res.token);
    await _storage.saveProfile(res.profile);

    return res.profile;
  }

  @override
  Future<void> logout() {
    return _storage.clearAll();
  }

  @override
  Future<void> signup(SignupRequest body) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
