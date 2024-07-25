import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mindbox/assest/renk/color.dart';
import 'package:mindbox/screen/category_screen.dart';
import 'package:mindbox/widget/product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController pageController;
  ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 2), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool showBtmAppBr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 36.0,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListTile(
                  selected: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  selectedTileColor: AppColors.primaryColor,
                  title: Text(
                    "Hoşgeldin",
                    style: Theme.of(context).textTheme.titleMedium!.merge(
                          const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                              color: AppColors.backgroundColor),
                        ),
                  ),
                  subtitle: Text(
                    "Bir Hediye Bulmadan Nereye öyle !",
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          TextStyle(
                            color: AppColors.backgroundColor,
                          ),
                        ),
                  ),
                  trailing: PopUpMen(
                    menuList:  [
                      PopupMenuItem(
                        value: 1,
                        child: ListTile(
                          leading: Icon(
                            CupertinoIcons.person,
                          ),
                          title: Text("Profil"),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: ListTile(
                          leading: Icon(
                            Icons.settings,
                          ),
                          title: Text("Ayarlar"),
                        ),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        value: 3,
                        child: ListTile(
                          leading: Icon(
                            Icons.logout,
                          ),
                          title: Text("Çıkış"),
                          onTap: () => _logout(context),
                        ),
                      ),
                    ],
                    icon: CircleAvatar(
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("lib/assest/man.png"),
                          fit: BoxFit.fill,
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    pageNo = index;
                    setState(() {});
                  },
                  itemBuilder: (_, index) {
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (ctx, child) {
                        return child!;
                      },
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(" ${index + 1} "),
                            ),
                          );
                        },
                        onPanDown: (d) {
                          carasouelTmer?.cancel();
                          carasouelTmer = null;
                        },
                        onPanCancel: () {
                          carasouelTmer = getTimer();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 8, left: 8, top: 24, bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: AppColors.accentColor,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.circle,
                        size: 12.0,
                        color: pageNo == index
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: GridB(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: showBtmAppBr
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AiScreen()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(
          milliseconds: 800,
        ),
        curve: Curves.easeInOutSine,
        height: showBtmAppBr ? 70 : 0,
        child: BottomAppBar(
          notchMargin: 8.0,
          shape: const CircularNotchedRectangle(),
          color: AppColors.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_outlined,
                  color: AppColors.secondaryColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.heart,
                  color: AppColors.secondaryColor,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.cart,
                  color: AppColors.secondaryColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.bell,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 1:
            Navigator.pushNamed(context, '/profilscreen');
            break;
          case 2:
            Navigator.pushNamed(context, '/settingscreen');
            break;
          case 3:
            _logout(context);
            break;

        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}
void _logout(BuildContext context) {
  if (Platform.isIOS) {
    exit(0); // iOS için çıkış
  } else if (Platform.isAndroid) {
    SystemNavigator.pop(); // Android için çıkış
  }
}

class FabExt extends StatelessWidget {
  const FabExt({
    Key? key,
    required this.showFabTitle,
  }) : super(key: key);

  final bool showFabTitle;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: AnimatedContainer(
        duration: const Duration(seconds: 2),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(CupertinoIcons.cart),
            SizedBox(width: showFabTitle ? 12.0 : 0),
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              child: showFabTitle ? const Text("Go to cart") : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
