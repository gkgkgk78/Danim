import 'package:danim/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../view_models/app_view_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            foregroundImage: AssetImage('assets/images/transparent_logo.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
        title: const Text(
          '로그인',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Consumer<AppViewModel>(
        builder: (context, appViewModel, _) {
          return ChangeNotifierProvider(
            create: (context) =>
                LoginViewModel(context, appViewModel.updateUserInfo),
            child: Consumer<LoginViewModel>(
              builder: (ctx, viewModel, child) {
                return SafeArea(
                  minimum: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.all(20.0),
                        child: Lottie.asset(
                          'assets/lottie/boarding_pass_ticket.json',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // The loading indicator
                                      Lottie.asset(
                                          'assets/lottie/around_the_world.json',
                                          frameRate: FrameRate.max),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      // Some text
                                      const Text(
                                        '로그인 중...',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          viewModel.loginButtonPressed(
                              context, appViewModel.updateUserInfo);
                        },
                        child: Image.asset(
                          'assets/images/kakao_login.png',
                          height: 90,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
