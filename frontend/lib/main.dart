import 'package:danim/view_models/app_view_model.dart';
import 'package:danim/view_models/custom_app_bar_view_model.dart';
import 'package:danim/views/bottom_navigation.dart';
import 'package:danim/views/camera_floating_action_button.dart';
import 'package:danim/views/custom_app_bar.dart';
import 'package:danim/views/login_page.dart';
import 'package:danim/views/main_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // 추가
  KakaoSdk.init(nativeAppKey: dotenv.env['nativeAppKey']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Danim',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String profileImageUrl;

  const MyHomePage({required this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        viewModel: AppViewModel(profileImageUrl),
      ),
      body: MainFrame(),
      floatingActionButton: const CameraFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
