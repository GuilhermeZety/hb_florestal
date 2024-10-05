// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/constants/app_fonts.dart';
import 'package:hb_florestal/app/core/common/extensions/context_extension.dart';
import 'package:hb_florestal/app/core/common/extensions/text_extension.dart';
import 'package:hb_florestal/app/core/common/extensions/widget/widget_extension.dart';
import 'package:hb_florestal/app/core/common/utils/scroll_util.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/about_me_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/apresentation_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/contact_section.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/sections/projects_section.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          ItemDrawer(
            icon: const Icon(
              Icons.home_outlined,
              color: AppColors.grey_800,
            ),
            name: 'home',
            ontap: () {
              Scaffold.of(context).closeEndDrawer();
              ScrollUtil.to(ApresentationSection.currentKey.currentContext!);
            },
          ),
          ItemDrawer(
            icon: const Icon(
              Icons.person_outlined,
              color: AppColors.grey_800,
            ),
            name: 'about_me',
            ontap: () {
              Scaffold.of(context).closeEndDrawer();
              ScrollUtil.to(AboutMeSection.currentKey.currentContext!);
            },
          ),
          ItemDrawer(
            icon: const Icon(
              Icons.apps_outlined,
              color: AppColors.grey_800,
            ),
            name: 'projects',
            ontap: () {
              Scaffold.of(context).closeEndDrawer();
              ScrollUtil.to(ProjectsSection.currentKey.currentContext!);
            },
          ),
          ItemDrawer(
            icon: const Icon(
              Icons.email_outlined,
              color: AppColors.grey_800,
            ),
            name: 'contact',
            ontap: () {
              Scaffold.of(context).closeEndDrawer();
              ScrollUtil.to(ContactSection.currentKey.currentContext!);
            },
          ),
          const Spacer(),
          Center(
            child: Column(
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Desenvolvido com ',
                    ),
                    Icon(
                      Icons.favorite,
                      size: 14,
                      color: AppColors.error,
                    ),
                    Text(
                      ' por',
                    ),
                  ],
                ),
                const Text(
                  'Guilherme Martins',
                ).gradient(AppColors.gradient),
              ],
            ).pBottom(24),
          ),
        ],
      ),
    );
  }
}

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({super.key, required this.icon, required this.name, required this.ontap});

  final Widget icon;
  final String name;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10, top: 3, bottom: 3),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            Text(
              name,
              style: TextStyle(
                fontWeight: AppFonts.medium,
                letterSpacing: 0.5,
                fontSize: 16,
                color: context.textTheme.titleLarge?.color?.withOpacity(0.6),
              ),
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
