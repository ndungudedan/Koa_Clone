import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koa_clone/constants/assets.dart';
import 'package:koa_clone/constants/styles.dart';

class SaveScreen extends StatelessWidget {
  List<String> _goals = [
    '2022 Savings Challenge',
    'Medical Bills',
    'School Fees',
    'Emergency Stash'
  ];
  double CardRadius = 10.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(gradient: backroundGradient),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'What would you like to Save for?',
                style: poppinsBold.copyWith(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Get inspired below, or customize your own savings',
                style: poppinsMedium.copyWith(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Featured Goals ⭐',
                style: poppinsSemiBold.copyWith(fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                  itemCount: _goals.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width / 2.5,
                        child: DottedBorder(
                            color: Colors.black,
                            strokeWidth: 3,
                            radius: Radius.circular(CardRadius),
                            dashPattern: [10, 5],
                            customPath: (size) {
                              return Path()
                                ..moveTo(CardRadius, 0)
                                ..lineTo(size.width - CardRadius, 0)
                                ..arcToPoint(Offset(size.width, CardRadius),
                                    radius: Radius.circular(CardRadius))
                                ..lineTo(size.width, size.height - CardRadius)
                                ..arcToPoint(
                                    Offset(size.width - CardRadius, size.height),
                                    radius: Radius.circular(CardRadius))
                                ..lineTo(CardRadius, size.height)
                                ..arcToPoint(Offset(0, size.height - CardRadius),
                                    radius: Radius.circular(CardRadius))
                                ..lineTo(0, CardRadius)
                                ..arcToPoint(Offset(CardRadius, 0),
                                    radius: Radius.circular(CardRadius));
                            },
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Create Your own goal',
                                      style:
                                          poppinsMedium.copyWith(fontSize: 25),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    const Align(
                                        alignment: Alignment.bottomRight,
                                        child: const Icon(
                                          Icons.add,
                                          size: 25,
                                        ))
                                  ],
                                ),
                              ),
                            )),
                      );
                    }
                    return GoalContainer(label: _goals.elementAt(index));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Popular Savings 💰',
                style: poppinsSemiBold.copyWith(fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                  itemCount: _goals.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GoalContainer(label: _goals.elementAt(index));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Popular Goals 🎯',
                style: poppinsSemiBold.copyWith(fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                  itemCount: _goals.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GoalContainer(label: _goals.elementAt(index));
                  }),
            ),
            const SizedBox(
              height: 60,
            ),
            const Center(
              child: Text(
                'Didn`t find a goal for you?',
                style: poppinsMedium,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: kDarkGreyColor,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width / 1.5, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {},
                  child: Text(
                    'Create Your Own',
                    style: poppinsMedium.copyWith(
                        color: Colors.white, fontSize: 15),
                  )),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class GoalContainer extends StatelessWidget {
  String label;
  GoalContainer({required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: const AssetImage(
                Assets.welcomeBanner,
              )),
          borderRadius: BorderRadius.circular(10)),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: poppinsMedium.copyWith(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
