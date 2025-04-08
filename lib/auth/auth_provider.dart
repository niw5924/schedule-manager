import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'storage_helper.dart';

class AuthProvider extends ChangeNotifier {
  NaverAccountResult? user;

  void setUser(NaverAccountResult? account) {
    user = account;

    if (user != null) {
      debugPrint('로그인된 사용자 정보');
      debugPrint('이름: ${user!.name}');
      debugPrint('이메일: ${user!.email}');
      debugPrint('프로필사진: ${user!.profileImage}');
      debugPrint('성별: ${user!.gender}');
      debugPrint('생일: ${user!.birthday}');
      debugPrint('연령대: ${user!.age}');
      debugPrint('휴대전화번호: ${user!.mobile}');
    }

    notifyListeners();
  }

  Future<void> checkAutoLogin() async {
    try {
      final token = await FlutterNaverLogin.currentAccessToken;
      if ((token.accessToken).isNotEmpty) {
        final account = await FlutterNaverLogin.currentAccount();
        setUser(account);
      } else {
        setUser(null);
      }
    } catch (e) {
      debugPrint('자동 로그인 실패: $e');
      setUser(null);
    }
  }

  Future<void> naverLogin() async {
    final result = await FlutterNaverLogin.logIn();
    if (result.status == NaverLoginStatus.loggedIn) {
      final token = await FlutterNaverLogin.currentAccessToken;
      await StorageHelper.saveAccessToken(token.accessToken);
      setUser(result.account);
    }
  }

  Future<void> logout() async {
    await FlutterNaverLogin.logOutAndDeleteToken();
    await StorageHelper.clearAccessToken();
    setUser(null);
  }
}
