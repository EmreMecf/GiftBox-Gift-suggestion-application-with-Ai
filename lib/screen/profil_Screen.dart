import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mindbox/assest/renk/color.dart';
import 'package:mindbox/widget/appbar.dart';
import 'package:mindbox/widget/forward_button.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Profil',
        subtitle: 'Profilini Düzenle',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset("lib/assest/man.png", width: 70, height: 70),
                    const SizedBox(width: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profil",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ForwardButton(
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
