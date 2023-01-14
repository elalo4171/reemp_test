import 'package:flutter/material.dart';

class CircularMenu extends StatefulWidget {
  const CircularMenu({
    Key? key,
    required this.sizeCircle,
    required this.sizeCircleSelected,
    required this.sizeScreen,
  }) : super(key: key);

  final double sizeCircle;
  final double sizeCircleSelected;
  final Size sizeScreen;

  @override
  State<CircularMenu> createState() => _CircularMenuState();
}

class _CircularMenuState extends State<CircularMenu>
    with TickerProviderStateMixin {
  int positionsCircles = 1;
  int positionsCirclesSecond = 2;
  int positionsCirclesThird = 3;
  int positionsCirclesFourth = 4;

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

  void createPositionMap() {
    final sizeScreen = widget.sizeScreen;
    final middleSreen = sizeScreen.width / 2;
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

  void updatePositionsAnimations() {
    _controllerFirstCircle.dispose();
    _controllerFirstCircle = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
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

  void moveToRigth() {
    if (positionsCircles == 4) {
      positionsCircles = 1;
      positionsCirclesSecond = 2;
      positionsCirclesThird = 3;
      positionsCirclesFourth = 4;
    } else {
      switch (positionsCircles) {
        case 1:
          positionsCircles = 2;
          positionsCirclesSecond = 3;
          positionsCirclesThird = 4;
          positionsCirclesFourth = 1;
          break;
        case 2:
          positionsCircles = 3;
          positionsCirclesSecond = 4;
          positionsCirclesThird = 1;
          positionsCirclesFourth = 2;
          break;
        case 3:
          positionsCircles = 4;
          positionsCirclesSecond = 1;
          positionsCirclesThird = 2;
          positionsCirclesFourth = 3;
          break;
        case 4:
          positionsCircles = 1;
          positionsCirclesSecond = 2;
          positionsCirclesThird = 3;
          positionsCirclesFourth = 4;
          break;
        default:
      }
    }
    updatePositionsAnimations();
    _controllerFirstCircle.forward();
  }

  void moveToLeft() {
    if (positionsCircles == 1) {
      positionsCircles = 4;
      positionsCirclesSecond = 1;
      positionsCirclesThird = 2;
      positionsCirclesFourth = 3;
    } else {
      switch (positionsCircles) {
        case 1:
          positionsCircles = 4;
          positionsCirclesSecond = 1;
          positionsCirclesThird = 2;
          positionsCirclesFourth = 3;
          break;
        case 2:
          positionsCircles = 1;
          positionsCirclesSecond = 2;
          positionsCirclesThird = 3;
          positionsCirclesFourth = 4;
          break;
        case 3:
          positionsCircles = 2;
          positionsCirclesSecond = 3;
          positionsCirclesThird = 4;
          positionsCirclesFourth = 1;
          break;
        case 4:
          positionsCircles = 3;
          positionsCirclesSecond = 4;
          positionsCirclesThird = 1;
          positionsCirclesFourth = 2;
          break;
        default:
      }
    }
    updatePositionsAnimations();
    _controllerFirstCircle.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          moveToRigth();
        } else {
          moveToLeft();
        }
      },
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Stack(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    moveToLeft();
                  },
                  child: Text('Left'),
                ),
                ElevatedButton(
                  onPressed: () {
                    moveToRigth();
                  },
                  child: Text('Rigth'),
                ),
              ],
            ),
            Positioned(
              left: _sizeAnimationFirstCircleLeft.value,
              top: _sizeAnimationFirstCircleTop.value,
              child: CircularOption(
                color: Colors.red,
                size: widget.sizeCircle,
              ),
            ),
            Positioned(
              left: _sizeAnimationSecondCircleLeft.value,
              top: _sizeAnimationSecondCircleTop.value,
              child: CircularOption(
                color: Colors.blue,
                size: widget.sizeCircle,
              ),
            ),
            Positioned(
              left: _sizeAnimationThirdCircleLeft.value,
              top: _sizeAnimationThirdCircleTop.value,
              child: CircularOption(
                color: Colors.green,
                size: widget.sizeCircle,
              ),
            ),
            Positioned(
              left: _sizeAnimationFourthCircleLeft.value,
              top: _sizeAnimationFourthCircleTop.value,
              child: CircularOption(
                color: Colors.yellow,
                size: widget.sizeCircle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class CircularOption extends StatelessWidget {
  final Color color;
  final double size;

  const CircularOption({super.key, required this.color, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: const Text("Red"),
    );
  }
}
