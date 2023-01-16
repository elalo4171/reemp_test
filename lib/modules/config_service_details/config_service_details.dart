import 'package:flutter/material.dart';
import 'package:reemp/global_widgets/custom_appbar.dart';

class ConfigServiceDetails extends StatefulWidget {
  const ConfigServiceDetails({super.key});

  @override
  State<ConfigServiceDetails> createState() => _ConfigServiceDetailsState();
}

class _ConfigServiceDetailsState extends State<ConfigServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const CustomAppbar(),
            Center(
              child: Text('Config Service Details'),
            ),
          ],
        ),
      ),
    );
  }
}
