import 'package:flutter/material.dart';
import 'package:koa_clone/constants/assets.dart';
import 'package:koa_clone/constants/styles.dart';
import 'package:koa_clone/ui/index/home/edit_saving_goal_screen.dart';
import 'package:koa_clone/ui/index/save/create_goal_screen.dart';
import 'package:koa_clone/ui/index/save/new_saving_screen.dart';

class SavingGoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Medical Bills',
                            style: poppinsSemiBold.copyWith(
                                color: Colors.white, fontSize: 25),
                          ),
                          Text.rich(TextSpan(text: 'KES 50.00 ',style: poppinsRegular.copyWith(
                                color: Colors.white, fontSize: 15),children: [TextSpan(text: '+ KSh 0.0',style: poppinsRegular.copyWith(
                                color: Colors.green, fontSize: 15),)])),
                         
                          Text(
                            '1192 days ',
                            style: poppinsRegular.copyWith(
                                color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child: Image.asset(Assets.logo)),
                    ],
                  )
                      )),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.add_circle,
                          size: 40,
                          color: kDarkGreyColor,
                        ),
                        title: Text(
                          'Add KSh 7K',
                          style: poppinsSemiBold.copyWith(fontSize: 20),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      )),
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
                InfoTile(title: 'Start Date', trailing: 'Jun 27, 2021'),
                Divider(
                  thickness: 0.5,
                  height: 0.5,
                  color: kLightGreyColor,
                ),
                InfoTile(title: 'Maturity Date', trailing: 'Aug 16, 2103'),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: kLightGreyColor,
                ),
                InfoTile(title: 'Monthly Savings', trailing: 'KSh 1000'),
                Divider(
                  thickness: 15,
                  height: 15,
                  color: kLightGreyColor,
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transactions',
                        style: poppinsBold.copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'No Transactions yet',
                        style: poppinsLight.copyWith(),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 15,
                  height: 15,
                  color: kLightGreyColor,
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 9,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreateGoal()));
                      },
                      child: Text(
                        'Delete Goal',
                        style: poppinsRegular.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent[400],
                          minimumSize:
                              Size(MediaQuery.of(context).size.width - 50, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                )
              ],
            ),
          ),
          SafeArea(
            child: Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditSavingGoal()));
                        },
                        child: Text(
                          'Edit Details',
                          style: poppinsBold.copyWith(color: Colors.white),
                        ))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
