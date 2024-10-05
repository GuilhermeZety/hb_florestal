import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/constants/app_fonts.dart';
import 'package:hb_florestal/app/core/common/extensions/context_extension.dart';
import 'package:hb_florestal/app/core/common/extensions/widget/widget_extension.dart';
import 'package:hb_florestal/app/core/shared/features/prismic/models/content_model.dart';
import 'package:hb_florestal/app/core/shared/prismic_memory.dart';
import 'package:hb_florestal/app/ui/components/named_title.dart';

class AboutUsSection extends StatefulWidget {
  const AboutUsSection({super.key});

  static GlobalKey currentKey = GlobalKey();

  @override
  State<AboutUsSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutUsSection> {
  NumbersContent numbersContent = PrismicMemory().numbers;
  AboutContent aboutUs = PrismicMemory().sobre;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        key: AboutUsSection.currentKey,
        child: Column(
          children: [
            _buildNumbersSection,
            _buildAboutUsSection,
          ],
        ));
  }

  Widget get _buildNumbersSection => ColoredBox(
        color: AppColors.grey_50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: numbersContent.numbers
              .map(
                (number) => _numberItem(
                  number.number,
                  number.descricao,
                ),
              )
              .toList(),
        ).pH(context.pageMargin).pTop(24).pBottom(48),
      );

  Widget _numberItem(int number, String description) => Column(
        children: [
          Text(
            '${treatNumber(number)}+',
            style: const TextStyle(
              fontSize: 84,
              fontWeight: FontWeight.bold,
              color: AppColors.grey_800,
            ),
          ),
          Text(description),
        ],
      );
  Widget get _buildAboutUsSection => Column(
        children: [
          const Gap(60),
          const NamedTitle(
            title: 'Sobre',
            subtitle: 'HB Florestal',
          ),
          const Gap(60),
          Builder(
            builder: (context) {
              return SizedBox(
                width: context.width,
                height: 360,
                child: Row(
                  children: [
                    Center(
                      child: Text(
                        aboutUs.esquerda.text,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: AppFonts.bold,
                          color: AppColors.grey_800,
                        ),
                      ),
                    ).pLeft(context.pageMargin / 2).pRight(context.width * 0.05).expanded(),
                    Container(
                      height: 360,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(aboutUs.segundo.text,
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: AppFonts.bold,
                              color: AppColors.white,
                            )),
                      ).pRight(context.pageMargin / 2).pLeft(context.width * 0.05),
                    ).expanded()
                  ],
                ),
              );
            },
          ),
          const Gap(60),
        ],
      );
}

String treatNumber(int number) {
  // numero normal até 999 apartir fica 1K até 999K apartir fica 1M até 999M
  if (number < 1000) {
    return number.toString();
  } else if (number < 1000000) {
    return '${(number / 1000)}K';
  } else {
    return '${(number / 1000000)}M';
  }
}
