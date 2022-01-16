import 'package:flutter/material.dart';
import 'package:koa_clone/constants/assets.dart';
import 'package:koa_clone/constants/styles.dart';
import 'package:koa_clone/ui/index/save/create_goal_screen.dart';

class NewSaving extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            Assets.welcomeBanner,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 2 / 3,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            top: 0.0,
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Colors.transparent
                      ])),
                  height: MediaQuery.of(context).size.height / 5,
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 20),
                        child: Text(
                          'Medical Bills',
                          style: poppinsSemiBold.copyWith(
                              color: Colors.white, fontSize: 25),
                        ),
                      )),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Dont get caught unprepared. Save up for unexpected medical bills and stay on track.',
                      style: poppinsRegular.copyWith(fontSize: 14),
                    ),
                  ),
                ),
                Divider(
                  thickness: 15,
                  height: 15,
                  color: kLightGreyColor,
                ),
                InfoTile(
                  title: 'Target',
                  trailing: 'KSH 10000',
                ),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: kLightGreyColor,
                ),
                InfoTile(title: 'Daily Deposit', trailing: 'KSh 250'),
                Divider(
                  thickness: 0.5,
                  height: 0.5,
                  color: kLightGreyColor,
                ),
                InfoTile(title: 'Recurrence', trailing: 'Daily'),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: kLightGreyColor,
                ),
                InfoTile(
                    title: 'Maturity Date',
                    subTitle: 'if commenced today',
                    trailing: 'Feb 24, 2022'),
                Divider(
                  thickness: 15,
                  height: 15,
                  color: kLightGreyColor,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                )
              ],
            ),
          ),
          SafeArea(
            child: SizedBox(
                height: 50,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 20,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 9,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CreateGoal()));
                  },
                  child: Text(
                    'Get Started',
                    style: poppinsRegular.copyWith(
                        color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: kDarkGreyColor,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width - 50, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  String title;
  String? subTitle;
  String trailing;
  InfoTile({required this.title, this.subTitle, required this.trailing});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: poppinsMedium.copyWith(fontSize: 15),
                ),
                subTitle != null
                    ? Text(
                        subTitle!,
                        style: poppinsMedium.copyWith(fontSize: 15),
                      )
                    : SizedBox()
              ],
            ),
            Text(trailing)
          ],
        ),
      ),
    );
  }
}
