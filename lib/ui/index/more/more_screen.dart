import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koa_clone/constants/assets.dart';
import 'package:koa_clone/constants/styles.dart';

enum Headings { leading, title, subTitle, trailing }
List itemsV3 = [
  {
    Headings.title.name: 'Privacy Policy',
    Headings.trailing.name: Icon(Icons.open_in_new),
  },
  {
    Headings.title.name: 'Terms & Conditions',
    Headings.trailing.name: Icon(Icons.open_in_new),
  },
];

List itemsV2 = [
  {
    Headings.leading.name: Icons.group_add,
    Headings.title.name: 'Invite Friends',
    Headings.subTitle.name: 'Earn rewards for inviting your friends',
    Headings.trailing.name: Icon(Icons.arrow_forward_ios_sharp),
  },
  {
    Headings.leading.name: Icons.rate_review,
    Headings.title.name: 'Rate Koa',
    Headings.trailing.name: Icon(Icons.open_in_new),
  },
  {
    Headings.leading.name: Icons.language,
    Headings.title.name: 'Our Website',
    Headings.trailing.name: Icon(Icons.open_in_new),
  },
  {
    Headings.leading.name: Icons.language,
    Headings.title.name: 'Our Twitter',
    Headings.trailing.name: Icon(Icons.open_in_new),
  },
  {
    Headings.leading.name: Icons.language,
    Headings.title.name: 'Our Instagram',
    Headings.trailing.name: Icon(Icons.open_in_new),
  },
  {
    Headings.leading.name: Icons.language,
    Headings.title.name: 'Join our community',
    Headings.trailing.name: Icon(Icons.open_in_new),
  },
];

List items = [
  {
    Headings.leading.name: Icons.lock,
    Headings.title.name: 'Change Pin Code',
    Headings.trailing.name: Icon(Icons.arrow_forward_ios_sharp),
  },
  {
    Headings.leading.name: Icons.fingerprint,
    Headings.title.name: 'Fingerprint',
    Headings.trailing.name: Switch(value: false, onChanged: (val) {},),
  },
  {
    Headings.leading.name: Icons.person_add,
    Headings.title.name: 'Account Beneficiary',
    Headings.trailing.name: Icon(Icons.arrow_forward_ios_sharp),
  },
  {
    Headings.leading.name: Icons.info,
    Headings.title.name: 'How Koa Works',
    Headings.trailing.name: Icon(Icons.open_in_new),
  },
  {
    Headings.leading.name: Icons.help,
    Headings.title.name: 'Help & Support',
    Headings.trailing.name: Icon(Icons.arrow_forward_ios_sharp),
  },
];

class MoreScreen extends StatelessWidget {
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
                'More',
                style: poppinsBold.copyWith(fontSize: 25),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  Assets.welcomeBanner,
                ),
              ),
              title: Text(
                'Dedan Ndungu',
                style: poppinsRegular.copyWith(fontSize: 20),
              ),
              subtitle: Text('View Account'),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            Divider(
              thickness: 15,
              color: kLightGreyColor,
            ),
            Column(
                children: items.map((item) {
              return CustomListTile(
                title: item[Headings.title.name],
                leading: item[Headings.leading.name],
                trailing: item[Headings.trailing.name],
              );
            }).toList()),
            Divider(
              thickness: 15,
              color: kLightGreyColor,
            ),
            Column(
                children: itemsV2.map((item) {
              return CustomListTile(
                title: item[Headings.title.name],
                subtitle: item[Headings.subTitle.name],
                leading: item[Headings.leading.name],
                trailing: item[Headings.trailing.name],
              );
            }).toList()),
            Divider(
              thickness: 15,
              color: kLightGreyColor,
            ),
            Column(
                children: itemsV3.map((item) {
              return CustomListTile(
                title: item[Headings.title.name],
                trailing:item[Headings.trailing.name],
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData? leading;
  String title;
  String? subtitle;
  Widget trailing;
  CustomListTile({this.leading, required this.title,this.subtitle, required this.trailing});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
             leading!=null ? Icon(
                leading,
                color: kLightGreyColor,
              ):SizedBox(),
           leading!=null ?   SizedBox(
                width: 10,
              ):SizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: poppinsRegular.copyWith(color: Colors.black),
                  ),
               subtitle!=null ?   Text(
                    subtitle??'',
                    style: poppinsRegular,
                  ):SizedBox(height: 0,)
                ],
              ),
              Spacer(
                flex: 1,
              ),
              trailing
            ],
          ),
        ),
        Divider(
          color: kLightGreyColor,
        )
      ],
    );
  }
}
