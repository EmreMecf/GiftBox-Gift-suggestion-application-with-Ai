import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mindbox/assest/renk/color.dart';
import 'package:mindbox/widget/appbar.dart';
import 'package:mindbox/widget/setting_item.dart';

import '../widget/setting_switch.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: CustomAppBarWidget(
            title:'Ayarlar' ,
            subtitle: 'İstediğin Tüm Ayarlar' ,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingItem(
                title: "Dil",
                icon: Ionicons.earth,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                value: "Türkçe",
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Bildirimler",
                icon: Ionicons.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingSwitch(
                title: "Karanlık Mod",
                icon: Ionicons.earth,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                value: isDarkMode,
                onTap: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Yardım",
                icon: Ionicons.nuclear,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
