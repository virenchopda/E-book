// ignore_for_file: library_private_types_in_public_api

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

///
import 'custom_listtile.dart';
import '../utils/images_utils.dart';
import '../utils/typedef_utils.dart';
import '../utils/decoration_utils.dart';
import '../utils/size_config_utils.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer(BuildContext context, {Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizeConfig.sH3,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 20.w,
                    width: 20.w,
                    decoration: DecorationUtils.drawerUserInfo(
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.w),
                      child: cachedImage(image: "", fit: BoxFit.cover),
                    ),
                  ),
                  const Expanded(
                    child: CustomListTile(title: 'title', subtitle: 'subtitle'),
                  ),
                ],
              ),
            ),
            customDivider(),
            drawerData(
              title: '',
              icon: Icons.calendar_today_sharp,
              onTap: () {
                Get.back();
              },
            ),
            drawerData(
              title: '',
              icon: Icons.chat,
              onTap: () {
                Get.back();
              },
            ),
            drawerData(
              title: '',
              icon: Icons.people,
              onTap: () {
                Get.back();
              },
            ),
            drawerData(
              title: '',
              icon: Icons.schedule,
              onTap: () {
                Get.back();
              },
            ),
            drawerData(
              title: '',
              icon: Icons.call,
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerData({
    required String title,
    required IconData icon,
    required OnTab onTap,
  }) {
    return CustomListTile(
      onTap: onTap,
      title: title,
      leading: Icon(icon, size: 6.w),
    );
  }
}
