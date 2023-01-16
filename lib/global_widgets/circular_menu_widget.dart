// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reemp/core/assets.dart';
import 'package:reemp/core/colors.dart';
import 'package:reemp/global_widgets/icons_custom.dart';

class CircularMenu extends StatefulWidget {
  /// This wieget create a circular menu
  /// with 4 circles
  const CircularMenu({
    Key? key,
    required this.sizeCircle,
    required this.sizeCircleSelected,
    required this.sizeScreen,
    required this.onCircleChange,
  }) : super(key: key);

  final double sizeCircle;
  final double sizeCircleSelected;
  final Size sizeScreen;
  final Function(int) onCircleChange;

  @override
  State<CircularMenu> createState() => _CircularMenuState();
}

class _CircularMenuState extends State<CircularMenu>
    with TickerProviderStateMixin {
  ///
  int positionsCircles = 1;
  int positionsCirclesSecond = 2;
  int positionsCirclesThird = 3;
  int positionsCirclesFourth = 4;

  int circleSelected = 3;

  late AnimationController _controllerFirstCircle;
  late Animation<double> _sizeAnimationFirstCircleTop;
  late Animation<double> _sizeAnimationFirstCircleLeft;
  late Animation<double> _sizeAnimationSecondCircleTop;
  late Animation<double> _sizeAnimationSecondCircleLeft;
  late Animation<double> _sizeAnimationThirdCircleTop;
  late Animation<double> _sizeAnimationThirdCircleLeft;
  late Animation<double> _sizeAnimationFourthCircleTop;
  late Animation<double> _sizeAnimationFourthCircleLeft;
  final Map<int, CirclePositionModel> circlePositionFinals = {};

  @override
  void initState() {
    createPositionMap();
    super.initState();
  }

  /// This method create the position of the circles
  /// in the screen
  void createPositionMap() {
    final sizeScreen = widget.sizeScreen;
    final middleSreen = (sizeScreen.width - 32) / 2;
    final midleMiddleScreen = middleSreen / 2;
    final midleCircle = widget.sizeCircle / 2;
    final midleCircleSelected = widget.sizeCircleSelected / 2;
    final midleForCircleNormal = middleSreen - midleCircle;
    final midleForCircleSelected = middleSreen - midleCircleSelected;
    final leftCicle = midleMiddleScreen - midleCircle;
    final rightCircle = middleSreen + midleMiddleScreen - midleCircle;
    circlePositionFinals[1] = CirclePositionModel(
      left: midleForCircleNormal,
      top: 10,
    );
    circlePositionFinals[2] = CirclePositionModel(
      left: rightCircle,
      top: 10 + widget.sizeCircle,
    );
    circlePositionFinals[3] = CirclePositionModel(
      left: midleForCircleSelected,
      top: 10 + (widget.sizeCircle * 2),
    );
    circlePositionFinals[4] = CirclePositionModel(
      left: leftCicle,
      top: 10 + widget.sizeCircle,
    );
    initPositions();
  }

  /// This method init the position of the circles
  /// in the screen
  /// and the animation
  void initPositions() {
    _controllerFirstCircle = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controllerFirstCircle.addListener(() {
      setState(() {});
    });
    _sizeAnimationFirstCircleLeft = Tween<double>(
            begin: circlePositionFinals[1]!.left,
            end: circlePositionFinals[1]!.left)
        .animate(_controllerFirstCircle);
    _sizeAnimationFirstCircleTop = Tween<double>(
            begin: circlePositionFinals[1]!.top,
            end: circlePositionFinals[1]!.top)
        .animate(_controllerFirstCircle);
    _sizeAnimationSecondCircleLeft = Tween<double>(
            begin: circlePositionFinals[2]!.left,
            end: circlePositionFinals[2]!.left)
        .animate(_controllerFirstCircle);
    _sizeAnimationSecondCircleTop = Tween<double>(
            begin: circlePositionFinals[2]!.top,
            end: circlePositionFinals[2]!.top)
        .animate(_controllerFirstCircle);
    _sizeAnimationThirdCircleLeft = Tween<double>(
            begin: circlePositionFinals[3]!.left,
            end: circlePositionFinals[3]!.left)
        .animate(_controllerFirstCircle);
    _sizeAnimationThirdCircleTop = Tween<double>(
            begin: circlePositionFinals[3]!.top,
            end: circlePositionFinals[3]!.top)
        .animate(_controllerFirstCircle);
    _sizeAnimationFourthCircleLeft = Tween<double>(
            begin: circlePositionFinals[4]!.left,
            end: circlePositionFinals[4]!.left)
        .animate(_controllerFirstCircle);
    _sizeAnimationFourthCircleTop = Tween<double>(
            begin: circlePositionFinals[4]!.top,
            end: circlePositionFinals[4]!.top)
        .animate(_controllerFirstCircle);
  }

  /// This method update the position of the circles
  /// in the screen
  /// and the animation
  /// when the user change the circle
  /// with the swipe
  /// and the animation
  void updatePositionsAnimations() {
    _controllerFirstCircle.dispose();
    _controllerFirstCircle = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controllerFirstCircle.addListener(() {
      setState(() {});
    });
    _sizeAnimationFirstCircleLeft = Tween<double>(
            begin: _sizeAnimationFirstCircleLeft.value,
            end: circlePositionFinals[positionsCircles]!.left)
        .animate(_controllerFirstCircle);
    _sizeAnimationFirstCircleTop = Tween<double>(
            begin: _sizeAnimationFirstCircleTop.value,
            end: circlePositionFinals[positionsCircles]!.top)
        .animate(_controllerFirstCircle);
    _sizeAnimationSecondCircleLeft = Tween<double>(
            begin: _sizeAnimationSecondCircleLeft.value,
            end: circlePositionFinals[positionsCirclesSecond]!.left)
        .animate(_controllerFirstCircle);
    _sizeAnimationSecondCircleTop = Tween<double>(
            begin: _sizeAnimationSecondCircleTop.value,
            end: circlePositionFinals[positionsCirclesSecond]!.top)
        .animate(_controllerFirstCircle);
    _sizeAnimationThirdCircleLeft = Tween<double>(
            begin: _sizeAnimationThirdCircleLeft.value,
            end: circlePositionFinals[positionsCirclesThird]!.left)
        .animate(_controllerFirstCircle);
    _sizeAnimationThirdCircleTop = Tween<double>(
            begin: _sizeAnimationThirdCircleTop.value,
            end: circlePositionFinals[positionsCirclesThird]!.top)
        .animate(_controllerFirstCircle);
    _sizeAnimationFourthCircleLeft = Tween<double>(
            begin: _sizeAnimationFourthCircleLeft.value,
            end: circlePositionFinals[positionsCirclesFourth]!.left)
        .animate(_controllerFirstCircle);
    _sizeAnimationFourthCircleTop = Tween<double>(
            begin: _sizeAnimationFourthCircleTop.value,
            end: circlePositionFinals[positionsCirclesFourth]!.top)
        .animate(_controllerFirstCircle);
  }

  /// This method move the circles to the rioht
  /// when the user swipe to the right
  void moveToRigth() {
    if (positionsCircles == 4) {
      positionsCircles = 1;
      positionsCirclesSecond = 2;
      positionsCirclesThird = 3;
      positionsCirclesFourth = 4;
      circleSelected = 3;
    } else {
      switch (positionsCircles) {
        case 1:
          positionsCircles = 2;
          positionsCirclesSecond = 3;
          positionsCirclesThird = 4;
          positionsCirclesFourth = 1;
          circleSelected = 2;
          break;
        case 2:
          positionsCircles = 3;
          positionsCirclesSecond = 4;
          positionsCirclesThird = 1;
          positionsCirclesFourth = 2;
          circleSelected = 1;
          break;
        case 3:
          positionsCircles = 4;
          positionsCirclesSecond = 1;
          positionsCirclesThird = 2;
          positionsCirclesFourth = 3;
          circleSelected = 4;
          break;
        case 4:
          positionsCircles = 1;
          positionsCirclesSecond = 2;
          positionsCirclesThird = 3;
          positionsCirclesFourth = 4;
          circleSelected = 3;
          break;
        default:
      }
    }
    updatePositionsAnimations();
    _controllerFirstCircle.forward();
  }

  /// This method move the circles to the left
  /// when the user swipe to the left
  /// and the animation
  void moveToLeft() {
    if (positionsCircles == 1) {
      positionsCircles = 4;
      positionsCirclesSecond = 1;
      positionsCirclesThird = 2;
      positionsCirclesFourth = 3;
      circleSelected = 4;
    } else {
      switch (positionsCircles) {
        case 1:
          positionsCircles = 4;
          positionsCirclesSecond = 1;
          positionsCirclesThird = 2;
          positionsCirclesFourth = 3;
          circleSelected = 2;
          break;
        case 2:
          positionsCircles = 1;
          positionsCirclesSecond = 2;
          positionsCirclesThird = 3;
          positionsCirclesFourth = 4;
          circleSelected = 3;
          break;
        case 3:
          positionsCircles = 2;
          positionsCirclesSecond = 3;
          positionsCirclesThird = 4;
          positionsCirclesFourth = 1;
          circleSelected = 2;
          break;
        case 4:
          positionsCircles = 3;
          positionsCirclesSecond = 4;
          positionsCirclesThird = 1;
          positionsCirclesFourth = 2;
          circleSelected = 1;
          break;
        default:
      }
    }
    updatePositionsAnimations();
    _controllerFirstCircle.forward();
  }

  /// This method is called when the user
  /// select a circle
  void onIconSelected(int index) {
    switch (circleSelected) {
      case 1:
        if (index == 4) {
          moveToRigth();
        }
        if (index == 2) {
          moveToLeft();
        }
        if (index == 3) {
          moveToRigth();
          moveToRigth();
        }
        break;
      case 2:
        if (index == 1) {
          moveToRigth();
        }
        if (index == 3) {
          moveToLeft();
        }
        if (index == 4) {
          moveToRigth();
          moveToRigth();
        }
        break;
      case 3:
        if (index == 2) {
          moveToRigth();
        }
        if (index == 4) {
          moveToLeft();
        }
        if (index == 1) {
          moveToRigth();
          moveToRigth();
        }
        break;
      case 4:
        if (index == 3) {
          moveToRigth();
        }
        if (index == 1) {
          moveToLeft();
        }
        if (index == 2) {
          moveToRigth();
          moveToRigth();
        }
        break;
      default:
    }
    widget.onCircleChange(circleSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        /// This condition is to avoid
        /// the animation is called
        /// when the animation is running
        /// and the user swipe
        /// to the right or left
        /// and the animation is called
        /// again
        if (_controllerFirstCircle.isAnimating) {
          return;
        }
        if (details.delta.dx > 0) {
          moveToRigth();
        }
        if (details.delta.dx < 0) {
          moveToLeft();
        }
      },
      child: Container(
        height: 300,
        width: double.infinity,
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              left: _sizeAnimationFirstCircleLeft.value,
              top: _sizeAnimationFirstCircleTop.value,
              child: CircularOption(
                size: circleSelected == 1
                    ? widget.sizeCircleSelected
                    : widget.sizeCircle,
                icon: Assets.car,
                iconSize: circleSelected == 1 ? 50 : 30,
                onTap: () => onIconSelected(1),
                isSelectd: circleSelected == 1,
              ),
            ),
            Positioned(
              left: _sizeAnimationSecondCircleLeft.value,
              top: _sizeAnimationSecondCircleTop.value,
              child: CircularOption(
                size: circleSelected == 2
                    ? widget.sizeCircleSelected
                    : widget.sizeCircle,
                icon: Assets.work,
                iconSize: circleSelected == 2 ? 50 : 30,
                onTap: () => onIconSelected(2),
                isSelectd: circleSelected == 2,
              ),
            ),
            Positioned(
              left: _sizeAnimationThirdCircleLeft.value,
              top: _sizeAnimationThirdCircleTop.value,
              child: CircularOption(
                size: circleSelected == 3
                    ? widget.sizeCircleSelected
                    : widget.sizeCircle,
                icon: Assets.bussines,
                iconSize: circleSelected == 3 ? 50 : 30,
                onTap: () => onIconSelected(3),
                isSelectd: circleSelected == 3,
              ),
            ),
            Positioned(
              left: _sizeAnimationFourthCircleLeft.value,
              top: _sizeAnimationFourthCircleTop.value,
              child: CircularOption(
                size: circleSelected == 4
                    ? widget.sizeCircleSelected
                    : widget.sizeCircle,
                icon: Assets.resident,
                iconSize: circleSelected == 4 ? 60 : 45,
                onTap: () => onIconSelected(4),
                isSelectd: circleSelected == 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// This class is the model
/// to save the position of the
/// circles
class CirclePositionModel {
  final double left;
  final double top;

  CirclePositionModel({required this.left, required this.top});

  @override
  String toString() {
    return 'CirclePositionModel{left: $left, top: $top}';
  }

  CirclePositionModel copyWith({
    double? left,
    double? top,
  }) {
    return CirclePositionModel(
      left: left ?? this.left,
      top: top ?? this.top,
    );
  }
}

/// This is the widget that
/// represents the circle
/// with the icon
/// and the animation
class CircularOption extends StatelessWidget {
  final double size;
  final String icon;
  final double iconSize;
  final Function onTap;
  final bool isSelectd;
  final bool isEnable;

  const CircularOption(
      {super.key,
      this.size = 80,
      required this.icon,
      this.iconSize = 50,
      required this.onTap,
      this.isSelectd = false,
      this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEnable) onTap();
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ColorsReemp.blue.withOpacity(.5),
              spreadRadius: 1,
              blurRadius: 9,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                  decoration: isSelectd
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: ColorsReemp.blue.withOpacity(.5),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        )
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconsCustom(icon: icon, size: iconSize),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
