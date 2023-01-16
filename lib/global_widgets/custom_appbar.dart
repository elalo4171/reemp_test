import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 0,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Colors.white.withOpacity(.5),
                ),
                Text(
                  "Regresar",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            "Cobertura de servicios",
            style: TextStyle(
              color: Colors.white.withOpacity(.5),
            ),
          ),
        ],
      ),
    );
  }
}
