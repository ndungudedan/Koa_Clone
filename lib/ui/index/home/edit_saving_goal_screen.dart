import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koa_clone/constants/assets.dart';
import 'package:koa_clone/constants/styles.dart';

class EditSavingGoal extends StatefulWidget {
  @override
  State<EditSavingGoal> createState() => _EditSavingGoalState();
}

class _EditSavingGoalState extends State<EditSavingGoal> {
  final TextEditingController _titleController =
      TextEditingController(text: 'Medical Bills');

  final TextEditingController _targetController =
      TextEditingController(text: '100000');

  final TextEditingController _savingController =
      TextEditingController(text: '1400');
  final TextEditingController _dateController =
      TextEditingController(text: 'May 31, 2027');

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
            ListView(
              padding: EdgeInsets.all(10),
              children: [
                SizedBox(
                  height: size.height / 7,
                ),
                Text.rich(TextSpan(
                    text: 'Make changes to your ',
                    style: poppinsRegular.copyWith(fontSize: 25),
                    children: [
                      TextSpan(
                          text: 'Medical Bills ',
                          style: poppinsBold.copyWith(fontSize: 25)),
                      TextSpan(
                          text: 'Goal 🎯',
                          style: poppinsRegular.copyWith(fontSize: 25))
                    ])),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          Text(
                            'Change Image ',
                            style: poppinsMedium.copyWith(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.replay_outlined,
                            size: 20,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _buildHint('Name'),
                _buildCenterSuffixedField(_titleController),
                _buildHint('Frequency'),
                Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kLightGreyColor!),
                  ),
                  child: DropdownButton<String>(
                      underline: SizedBox(),
                      isExpanded: true,
                      value: _timelines[_timelineIndex],
                      items: List<DropdownMenuItem<String>>.generate(
                          _timelines.length, (index) {
                        return DropdownMenuItem<String>(
                            value: _timelines[index],
                            child: Text(
                              _timelines[index],
                              style: poppinsLight,
                            ));
                      }),
                      onChanged: (value) {
                        _timelineIndex = _timelines.indexWhere((element) {
                          return element == value;
                        });
                        setState(() {});
                      }),
                ),
                _buildHint(
                  'Monthly Deposits',
                ),
                _buildCenterSuffixedField(_savingController, prefixText: 'KSh ',suffix:    Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(onTap: () {}, child: Icon(Icons.keyboard_arrow_up)),
              InkWell(onTap: () {}, child: Icon(Icons.keyboard_arrow_down))
            ],
          )
     ),
                _buildHint('Target'),
                  _buildCenterSuffixedField(_targetController, prefixText: 'KSh ',suffix:    Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(onTap: () {}, child: Icon(Icons.keyboard_arrow_up)),
              InkWell(onTap: () {}, child: Icon(Icons.keyboard_arrow_down))
            ],
          )
     ),
              
                _buildHint('Maturity Date (Not Editable'),
                _buildCenterSuffixedField(_dateController, enabled: false),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Save',
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
              ],
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller,
      {String? prefixText, Widget? suffix, bool? enabled}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        enabled: enabled,
        style: poppinsSemiBold,
        controller: controller,
         decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixStyle: poppinsLight.copyWith(fontSize: 15),
                    border: InputBorder.none,

            /* border: OutlineInputBorder(
                borderSide: BorderSide(color: kLightGreyColor!),
                borderRadius: BorderRadius.circular(10)), */
            prefixText: prefixText,
            suffix: suffix),
      ),
    );
  }

  Widget _buildCenterSuffixedField(TextEditingController controller,{String? prefixText, bool? enabled,Widget? suffix}) {
    return Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kLightGreyColor!),
                  ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildTextFormField(controller,prefixText: prefixText,enabled: enabled)),
       suffix ??SizedBox(),
       SizedBox(width: 5,)   ],
      ),
    );
  }

  Widget _buildHint(String hint) {
    return Text(
      hint,
      style: poppinsLight.copyWith(fontSize: 15),
    );
  }
}
