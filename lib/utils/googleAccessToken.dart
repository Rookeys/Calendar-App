import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const FlutterSecureStorage secureStorage = FlutterSecureStorage();

// 액세스 토큰 저장
Future<void> saveAccessToken(String token) async {
  await secureStorage.write(key: 'access_token', value: token);
}

// 액세스 토큰 가져오기
Future<String?> getAccessToken() async {
  return await secureStorage.read(key: 'access_token');
}

// 액세스 토큰 삭제
Future<void> deleteAccessToken() async {
  await secureStorage.delete(key: 'access_token');
}
