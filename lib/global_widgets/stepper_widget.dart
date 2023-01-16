import 'package:flutter/material.dart';

/// This widget is a stepper with icons
/// and a counter of steps
class StepperWidget extends StatelessWidget {
  final double _width;
  final List<Widget> _icons;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = const Color(0xff5CBEF8).withOpacity(.3);
  final double lineWidth = 8.0;
  final bool _showCounter;
  StepperWidget({
    super.key,
    required List<Widget> icons,
    required int curStep,
    List<String> titles = const [],
    required double width,
    required Color color,
    bool showCounter = false,
  })  : _icons = icons,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        _showCounter = showCounter,
        assert(width > 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 32.0,
        left: 24.0,
        right: 24.0,
      ),
      width: _width,
      child: Column(
        children: <Widget>[
          Row(
            children: _iconViews(),
          ),
          const SizedBox(
            height: 10,
          ),
          if (_showCounter)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(
                  "$_curStep/${_icons.length}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  /// This method return a list of widgets
  /// with the icons and the lines between them
  List<Widget> _iconViews() {
    var list = <Widget>[];
    _icons.asMap().forEach((i, icon) {
      //colors according to state
      var circleColor =
          (i == 0 || _curStep > i) ? _activeColor : _inactiveColor;

      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;

      list.add(
        //dot with icon view
        Container(
            width: 35.0,
            height: 35.0,
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: circleColor,
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            ),
            child: icon),
      );

      //line between icons
      if (i != _icons.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineWidth,
          color: lineColor,
        )));
      }
    });

    return list;
  }
}
