import 'package:engage_files/widgets/topappbarbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTopAppBar extends StatelessWidget {
  final int totalItems;
  const CustomTopAppBar({super.key, required this.totalItems});

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding:
            EdgeInsets.only(top: devicePadding.top + 8, left: 20, right: 20),
        height: 55 + 8 + devicePadding.top,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 5,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const TopAppBarButton(
                  icon: CupertinoIcons.chevron_back,
                )),
            Text(
              '$totalItems Item${totalItems == 1 ? '' : 's'}',
              style: const TextStyle(fontFamily: 'RobotoBold', fontSize: 16.5),
            ),
            Container(),
            // const TopAppBarButton(
            //   icon: CupertinoIcons.ellipsis,
            // ),
          ],
        ),
      ),
    );
  }
}
