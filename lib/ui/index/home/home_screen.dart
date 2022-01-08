import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koa_clone/constants/assets.dart';
import 'package:koa_clone/constants/styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _pendingActions = [
    'Add KSh 10.5K to School Fees',
    'Add KSh 7K to Car'
  ];

  final List<String> _mySavings = [
    'School Fees',
    'Car',
  ];

  final List<String> _reasonsToSave = [
    'Add KSh 10.5K to School Fees',
    'Add KSh 7K to Car' 'Add KSh 10.5K to School Fees',
    'Add KSh 7K to Car' 'Add KSh 10.5K to School Fees',
    'Add KSh 7K to Car'
  ];

  int? currentSaving = 0;

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(gradient: backroundGradient),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
            height: 75,
          ),
            Row(
              children: [
                SizedBox(width: 20,),
                Text.rich(
                  TextSpan(text: 'Hi ', children: [
                    TextSpan(
                        text: 'Dedan! ☺', style: poppinsSemiBold.copyWith()),
                  ]),
                  style: poppinsRegular.copyWith(fontSize: 20),
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.redAccent[100], shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.headphones,
                        color: Colors.red,
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[100], shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.blue,
                      )),
                ),
                                  SizedBox(width: 20,),

              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Total Savings',
              style: poppinsRegular.copyWith(fontSize: 20),
            ),
            Text.rich(TextSpan(
                text: 'kSh ',
                children: [
                  TextSpan(
                      text: '0.',
                      style: poppinsSemiBold.copyWith(fontSize: 25)),
                  TextSpan(
                      text: '00', style: poppinsBold.copyWith(fontSize: 20))
                ],
                style: poppinsRegular.copyWith(fontSize: 20))),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularBorderedContainer(
                  label: 'Deposit',
                  color: Colors.amber[100],
                  borderColor: Colors.amber[900],
                  icon: Icons.arrow_forward,
                ),
                CircularBorderedContainer(
                  label: 'Quick Save',
                  color: Colors.green[100],
                  borderColor: Colors.green[900],
                  icon: Icons.add,
                ),
                CircularBorderedContainer(
                  label: 'Withdraw',
                  color: Colors.purple[100],
                  borderColor: Colors.purple[900],
                  icon: Icons.arrow_back,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pending Actions',
                    style: poppinsSemiBold.copyWith(fontSize: 15),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,0),
              child: Column(
                children: List.generate(_pendingActions.length, (index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kLightGreyColor!),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _pendingActions.elementAt(index),
                          style: poppinsMedium,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.redAccent,
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Savings',
                    style: poppinsSemiBold.copyWith(fontSize: 15),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: kLightGreyColor!),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'More',
                      style: poppinsRegular.copyWith(color: kLightGreyColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: _mySavings.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  _scrollController.addListener(() {
                    setState(() {
                      currentSaving = index;
                    });
                  });
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: kLightGreyColor!)],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Koa Goal 🎁',
                                style:
                                    poppinsMedium.copyWith(color: Colors.red),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              _mySavings.elementAt(index),
                              style: poppinsBold.copyWith(fontSize: 17),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('KSh 0 / KSh 70k'),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '1200 days more',
                              style: poppinsSemiBold,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            Assets.welcomeBanner,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List<Widget>.generate(
                  _mySavings.length,
                  (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            color: currentSaving?.round() == index
                                ? const Color(0XFF256075)
                                : const Color(0XFF256075).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10.0)),
                      )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Reasons to Save',
                    style: poppinsSemiBold.copyWith(fontSize: 15),
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(_reasonsToSave.length, (index) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(
                            image: AssetImage(Assets.welcomeBanner),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                        Text(
                          _reasonsToSave.elementAt(index),
                          textAlign: TextAlign.left,
                          style: poppinsSemiBold.copyWith(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          _reasonsToSave.elementAt(index),
                          softWrap: false,
                          textAlign: TextAlign.left,
                          style: poppinsMedium.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                              overflow: TextOverflow.clip),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20,0,20,0),
              padding: const EdgeInsets.fromLTRB(20,0,20,0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kLightGreyColor!),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(text: 'Need Help? ', children: [
                      TextSpan(
                          text: 'Contact Us',
                          style: poppinsMedium.copyWith(
                              decoration: TextDecoration.underline))
                    ]),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.headset_mic,
                        color: kDarkGreyColor,
                      ))
                ],
              ),
            ),
            SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }
}

class CircularBorderedContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final Color? borderColor;
  CircularBorderedContainer(
      {required this.color,
      required this.icon,
      required this.borderColor,
      required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: borderColor ?? kBlueColor)),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: borderColor,
              )),
        ),
        Text(
          label,
          style: poppinsRegular,
        )
      ],
    );
  }
}
