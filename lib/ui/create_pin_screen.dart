import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koa_clone/constants/styles.dart';
import 'package:koa_clone/ui/index/index_screen.dart';

class CreatePin extends StatefulWidget {
  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  Widget _animatedSwitcherChild = EmptySwitchContainer();
  final List<int> _codes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 0, 12];
  List<int> _selectedCodes = [];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(gradient: backroundGradient),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                'Create your Koa Pin',
                style: poppinsBold.copyWith(fontSize: 20),
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                'Use your Koa pin to open the app and confirm transactions',
                textAlign: TextAlign.center,
                style: poppinsRegular.copyWith(),
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  if (index == _selectedCodes.length - 1) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AnimatedSwitcher(
                        duration: const Duration(microseconds: 200),
                        child: _animatedSwitcherChild,
                      ),
                    );
                  } else if (_selectedCodes.isNotEmpty &&
                      index < _selectedCodes.length - 1) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FilledSwitchContainer(),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: EmptySwitchContainer(),
                    );
                  }
                }),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 3 / 4,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.0,
                  scrollDirection: Axis.vertical,
                  children: List.generate(_codes.length, (index) {
                    if (index == _codes.length - 3) {
                      return const SizedBox(
                        height: 10,
                        width: 10,
                      );
                    } else if (index == _codes.length - 1) {
                      return Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.transparent),
                        child: Center(
                            child: IconButton(
                          onPressed: () {
                            if (_selectedCodes.isNotEmpty) {
                              _selectedCodes.removeLast();
                              setState(() {});
                            }
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: kDarkGreyColor,
                          ),
                        )),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        if (_selectedCodes.length < 4) {
                          _selectedCodes.add(_codes.elementAt(index));
                          _animatedSwitcherChild = FilledSwitchContainer();
                          setState(() {});
                        }
                        if (_selectedCodes.length == 4) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IndexScreen()));
                        }
                      },
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kLightGreyColor),
                        child: Center(
                            child: Text(
                          _codes.elementAt(index).toString(),
                          style: poppinsRegular.copyWith(fontSize: 30),
                        )),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptySwitchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      width: 15,
      height: 10,
      decoration: BoxDecoration(
        color: kLightGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class FilledSwitchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      width: 18,
      height: 18,
      decoration: BoxDecoration(color: kDarkGreyColor, shape: BoxShape.circle),
    );
  }
}
