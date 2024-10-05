import 'package:flutter/material.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/about_us_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/apresentation_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/contact_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/equipaments_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/footer_section.dart';
import 'package:hb_florestal/app/ui/components/appbars/custom_app_bar.dart';
import 'package:hb_florestal/app/ui/components/appbars/custom_drawer.dart';
import 'package:hb_florestal/main.dart';
import 'package:signals/signals_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SignalsMixin {
  bool ignoreFirst = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainAnimation = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      body: Stack(
        children: [
          CustomScrollView(
            controller: ScrollController(initialScrollOffset: 1800),
            slivers: [
              const CustomAppBar(),
              const ApresentationSection(),
              const AboutUsSection(),
              const EquipamentsSection(),
              const ContactSection(),
              const FooterSection(),
            ],
          ),
        ],
      ),
    );
  }
}
