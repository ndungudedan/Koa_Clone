import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koa_clone/constants/assets.dart';
import 'package:koa_clone/constants/styles.dart';
import 'package:koa_clone/ui/create_pin.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            top: 0,
            child: Image.asset(
              Assets.welcomeBanner,
              fit: BoxFit.fill,
            )),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          top: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  kMinimumPadding, 0, kMinimumPadding, 0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KOA',
                        style: poppinsBold.copyWith(color: Colors.white),
                      ),
                      Text(
                        'Simple, seamless,hassle-free savings',
                        style: poppinsSemiBold.copyWith(
                            color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'Koa helps you save for things that really matter.',
                        style: poppinsRegular.copyWith(
                            color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: kBlueColor,
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreatePin()));
                          },
                          child: Text(
                            'Continue With Google',
                            style: poppinsRegular.copyWith(
                                color: Colors.white, fontSize: 16),
                          )),
                      const SizedBox(
                        height: kMinimumPadding,
                      ),
                      Text(
                        'By signing in, you confirm that you have read the Terms&Conditions, and that you understand them and that you agree to be bund by them',
                        textAlign: TextAlign.center,
                        style: poppinsRegular.copyWith(
                            color: Colors.white, fontSize: 12),
                      ),
                      const SizedBox(
                        height: kMinimumPadding,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
