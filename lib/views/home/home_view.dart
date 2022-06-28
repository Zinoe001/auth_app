import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kBGColor,
            title: AppText.heading2SB("ZeeFlights"),
            actions: const [
              Icon(Icons.more_vert_outlined),
              SizedBox(width: 20),
            ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AppText.heading4SB(
                "🤗Welcome David to ZeeFlights",
                multitext: true,
              ),
            )
          ],
        ));
  }
}
