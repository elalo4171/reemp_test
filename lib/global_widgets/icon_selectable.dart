import 'package:flutter/material.dart';
import 'package:reemp/global_widgets/icons_custom.dart';

class IconSelectable extends StatefulWidget {
  const IconSelectable({
    Key? key,
    required this.onSelect,
    required this.icon,
    this.iconSize = 30,
  }) : super(key: key);
  final Function(bool) onSelect;
  final String icon;
  final double iconSize;

  @override
  State<IconSelectable> createState() => _IconSelectableState();
}

class _IconSelectableState extends State<IconSelectable> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isSelected = !isSelected;
        setState(() {
          widget.onSelect(isSelected);
        });
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.black.withOpacity(.6),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconsCustom(
                icon: widget.icon,
                size: widget.iconSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
