import 'package:flutter/material.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/extensions/context_extension.dart';
import 'package:hb_florestal/app/core/common/extensions/widget/widget_extension.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/about_us_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/apresentation_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/equipaments_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/footer_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/services_section.dart';
import 'package:hb_florestal/app/ui/components/appbars/custom_app_bar.dart';
import 'package:hb_florestal/app/ui/components/appbars/custom_drawer.dart';
import 'package:hb_florestal/app/ui/components/gradient_text.dart';
import 'package:hb_florestal/main.dart';
import 'package:signals/signals_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
            controller: ScrollController(),
            slivers: [
              const CustomAppBar(),
              const ApresentationSection(),
              const AboutUsSection(),
              const EquipamentsSection(),
              const ServicesSection(),
              const FooterSection(),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse('https://guilhermezety.github.io/'), mode: LaunchMode.externalApplication);
                      },
                      child: Container(
                        width: context.width,
                        color: AppColors.grey_850,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Desenvolvido por ',
                              style: TextStyle(
                                color: AppColors.grey_500,
                              ),
                            ),
                            const Text(
                              'Guilherme Martins',
                            ).gradient(AppColors.gradientZety),
                          ],
                        ).pV(20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
