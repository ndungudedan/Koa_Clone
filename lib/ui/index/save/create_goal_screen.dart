import 'package:flutter/material.dart';
import 'package:koa_clone/constants/assets.dart';
import 'package:koa_clone/constants/styles.dart';
import 'package:koa_clone/widgets/custom_stepper.dart';

class CreateGoal extends StatefulWidget {
  @override
  State<CreateGoal> createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> {
  final TextEditingController _titleController = TextEditingController();
    final TextEditingController _targetController = TextEditingController();

  final TextEditingController _savingController = TextEditingController();


  final List<String> _timelines = ['Daily', 'Weekly', 'Monthly'];
  int _timelineIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        height: double.infinity,
        decoration: const BoxDecoration(gradient: backroundGradient),
        child: Stack(
          children: [
            SizedBox(
              height: size.height / 8,
            ),
            Positioned(
              top: 100.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: CustomStepper(
                  controlsBuilder: (context, details) {
                    return const SizedBox();
                  },
                  steps: [
                    CustomStep(
                        title: const SizedBox(),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'What do you want to save for?',
                              style: poppinsBold.copyWith(fontSize: 25),
                            ),
                            _buildTextField(_titleController,hint: 'Savings Name'),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'You can call it anything. Whether it`s a simple savings account, a dream vacation, or to buy a new house.',
                              style: poppinsRegular.copyWith(),
                            ),
                            SizedBox(
                              height: size.height / 3,
                            )
                          ],
                        )),
                    CustomStep(
                        title: const SizedBox(),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'What is your target?',
                              style: poppinsBold.copyWith(fontSize: 25),
                            ),
                            _buildTextField(_targetController),
                            SizedBox(
                              height: size.height / 3,
                            )
                          ],
                        )),
                    CustomStep(
                        title: const SizedBox(),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'How often do you want to save?',
                              style: poppinsBold.copyWith(fontSize: 25),
                            ),
                            Column(
                              children: List.generate(_timelines.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    _timelineIndex = index;
                                    if (_timelineIndex == index) {
                                      setState(() {});
                                    }
                                  },
                                  child: CustomCheckConsistency(
                                      isChecked: _timelineIndex == index,
                                      timeline: _timelines[index]),
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'We`ll help you stay on track. Just tell us how often you want to save and we`ll help you build that consistency.',
                              style: poppinsRegular.copyWith(),
                            ),
                            SizedBox(
                              height: size.height / 3,
                            )
                          ],
                        )),
                    CustomStep(
                        title: const SizedBox(),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'How much do you want to save on a monthly basis?',
                              style: poppinsBold.copyWith(fontSize: 25),
                            ),
                            _buildTextField(_savingController),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Dont`t worry. You can change this amount amy time.',
                              style: poppinsRegular.copyWith(),
                            ),
                            SizedBox(
                              height: size.height / 3,
                            )
                          ],
                        )),
                    CustomStep(
                        title: Text.rich(TextSpan(
                            text: 'Here is  a quick recap of your ',
                            style: poppinsRegular.copyWith(fontSize: 25),
                            children: [
                              TextSpan(
                                  text: '2022 Savings Challenge ',
                                  style: poppinsBold.copyWith(fontSize: 25)),
                              TextSpan(
                                  text: 'Goal 🎯',
                                  style: poppinsRegular.copyWith(fontSize: 25))
                            ])),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 70.0,
                                  backgroundImage: AssetImage(
                                    Assets.welcomeBanner,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.transparent,
                                      border: Border.all(color: kLightGreyColor!)),
                                  child: Row(
                                    children: [
                                       Text('Change',style: poppinsMedium.copyWith(fontSize: 12),),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Icon(Icons.replay_outlined,size: 20,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: kLightGreyColor,
                            ),
                            _buildConfirmTile(
                                'Target',
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.keyboard_arrow_up),
                                    const Text('KSh 12000'),
                                    const Icon(Icons.keyboard_arrow_down),
                                  ],
                                )),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: kLightGreyColor,
                            ),
                            _buildConfirmTile(
                                'Frequency',
                                DropdownButton<String>(
                                    underline: SizedBox(),
                                    value: _timelines[_timelineIndex],
                                    items:
                                        List<DropdownMenuItem<String>>.generate(
                                            _timelines.length, (index) {
                                      return DropdownMenuItem<String>(
                                          value: _timelines[index],
                                          child: Text(
                                            _timelines[index],
                                            style: poppinsBold,
                                          ));
                                    }),
                                    onChanged: (value) {
                                      _timelineIndex =
                                          _timelines.indexWhere((element) {
                                        return element == value;
                                      });
                                      setState(() {});
                                    })),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: kLightGreyColor,
                            ),
                            _buildConfirmTile(
                                'Deposits',
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.keyboard_arrow_up,
                                    ),
                                    const Text('KSh 1000'),
                                    const Icon(Icons.keyboard_arrow_down),
                                  ],
                                )),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: kLightGreyColor,
                            ),
                            _buildConfirmTile(
                                'Maturity Date', const Text('Jan 27, 2022')),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: kLightGreyColor,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CreateGoal()));
                              },
                              child: Text(
                                'Save',
                                style: poppinsRegular.copyWith(
                                    color: Colors.white, fontSize: 16),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: kDarkGreyColor,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width - 50, 60),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          ],
                        )),
                  ]),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                                  onPressed: () {
                                    
                                  },
                                  child: Text(
                                    'Next',
                                    style: poppinsRegular.copyWith(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: kDarkGreyColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30))),
                                ),
                        ),
                              
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller,{String? hint}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hint
      ),
    );
  }

  Widget _buildConfirmTile(String title, Widget trailing) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), trailing],
      ),
    );
  }
}

class CustomCheckConsistency extends StatelessWidget {
  final String timeline;
  final bool isChecked;
  CustomCheckConsistency({required this.timeline, required this.isChecked});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          timeline,
          style: poppinsSemiBold.copyWith(fontSize: 15),
        ),
        const SizedBox(
          width: 20,
        ),
        isChecked ? const Icon(Icons.check_circle) : const SizedBox()
      ],
    );
  }
}
