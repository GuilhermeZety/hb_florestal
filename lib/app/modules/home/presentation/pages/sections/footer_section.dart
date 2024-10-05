import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/extensions/context_extension.dart';
import 'package:hb_florestal/app/core/common/extensions/widget/widget_extension.dart';
import 'package:hb_florestal/app/core/shared/features/prismic/models/content_model.dart';
import 'package:hb_florestal/app/core/shared/prismic_memory.dart';
import 'package:hb_florestal/app/core/shared/session_memory.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  static GlobalKey currentKey = GlobalKey();

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  FooterContent footer = PrismicMemory().footer;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: FooterSection.currentKey,
      child: Container(
        color: AppColors.grey_850,
        padding: EdgeInsets.symmetric(horizontal: context.pageMargin, vertical: 48),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: context.isDesktop ? WrapAlignment.spaceBetween : WrapAlignment.center,
          runSpacing: 24,
          children: [
            if (context.isDesktop)
              Image.memory(
                SessionMemory().logoPNG,
                width: 150,
                height: 150,
                filterQuality: FilterQuality.high,
              ),
            SizedBox(
              width: 160,
              child: Column(
                children: [
                  const Text(
                    'Redes Sociais',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        hoverColor: AppColors.grey_800,
                        onPressed: () => launchUrl(Uri.parse(footer.instagramLink)),
                        icon: SvgPicture.memory(
                          SessionMemory().instagramSVG,
                        ),
                      ),
                      const Gap(12),
                      IconButton(
                        hoverColor: AppColors.grey_800,
                        onPressed: () async {
                          var hasZap = await launchUrl(
                            Uri.parse('whatsapp://send?phone=${footer.whatsappNumber}&text=Olá,%20estive%20navegando%20no%20seu%20site%20e%20gostaria%20de%20maiores%20informações.'),
                            mode: LaunchMode.externalNonBrowserApplication,
                          );
                          if (!hasZap) {
                            launchUrl(
                              Uri.parse(
                                'https://wa.me/${footer.whatsappNumber}?text=Olá,%20estive%20navegando%20no%20seu%20site%20e%20gostaria%20de%20maiores%20informações.',
                              ),
                              mode: LaunchMode.inAppBrowserView,
                            );
                          }
                        },
                        icon: SvgPicture.memory(
                          SessionMemory().whatsSVG,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contato',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ).pLeft(8),
                  const Gap(12),
                  IconButton(
                    hoverColor: AppColors.grey_800,
                    onPressed: () {
                      launchUrl(Uri.parse('tel:${footer.numero}'));
                    },
                    icon: Text(footer.numero, style: const TextStyle(color: AppColors.grey_400)),
                  ),
                  IconButton(
                    hoverColor: AppColors.grey_800,
                    onPressed: () {
                      launchUrl(Uri.parse('mailto:${footer.email}'));
                    },
                    icon: Text(footer.email, style: const TextStyle(color: AppColors.grey_400)),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Endereço',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ).pLeft(8),
                  const Gap(12),
                  IconButton(
                    hoverColor: AppColors.grey_800,
                    onPressed: () {
                      launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=${footer.endereco}'));
                    },
                    icon: Text(
                      footer.endereco,
                      style: const TextStyle(color: AppColors.grey_400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
