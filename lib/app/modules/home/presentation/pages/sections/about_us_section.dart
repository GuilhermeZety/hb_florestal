import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/constants/app_fonts.dart';
import 'package:hb_florestal/app/core/common/extensions/context_extension.dart';
import 'package:hb_florestal/app/core/common/extensions/widget/widget_extension.dart';
import 'package:hb_florestal/app/core/shared/features/prismic/models/content_model.dart';
import 'package:hb_florestal/app/core/shared/prismic_memory.dart';
import 'package:hb_florestal/app/ui/components/gradient_text_highlight.dart';

class AboutUsSection extends StatefulWidget {
  const AboutUsSection({super.key});

  static GlobalKey currentKey = GlobalKey();

  @override
  State<AboutUsSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutUsSection> {
  NumbersContent numbersContent = PrismicMemory().numbers;
  AboutContent aboutUs = PrismicMemory().sobre;
  QuemNosSomosContent quemSomos = PrismicMemory().quemSomos;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: AboutUsSection.currentKey,
      child: SelectionArea(
        child: Column(
          children: [
            _buildNumbersSection,
            // _buildAboutUsSection,
            Gap(context.isDesktop ? 16 : 40),
            _buildQuemSomosSection,
            Gap(context.isDesktop ? 60 : 40),
          ],
        ),
      ),
    );
  }

  Widget get _buildNumbersSection {
    if (context.isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: numbersContent.numbers
            .map(
              (number) => _numberItem(
                number.number,
                number.descricao,
              ),
            )
            .toList(),
      ).pH(context.pageMargin).pTop(24).pBottom(48);
    }
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      runAlignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: numbersContent.numbers
          .map(
            (number) => _numberItem(
              number.number,
              number.descricao,
            ),
          )
          .toList(),
    ).pH(context.pageMargin).pTop(24).pBottom(48);
  }

  Widget _numberItem(int number, String description) => Column(
        children: [
          Text(
            '${treatNumber(number)}+',
            style: TextStyle(
              fontSize: context.isDesktop ? 78 : 64,
              fontWeight: FontWeight.bold,
              color: AppColors.grey_800,
            ),
          ),
          Text(description),
        ],
      );
  Widget get _buildAboutUsSection => Column(
        children: [
          // const Gap(60),
          // const NamedTitle(
          //   title: 'Sobre',
          //   subtitle: 'HB Florestal',
          // ),
          const Gap(40),
          Container(
            color: AppColors.grey_50,
            width: context.width,
            child: Builder(
              builder: (context) {
                final content = [
                  SizedBox(
                    height: 240,
                    child: Center(
                      child: Text(
                        aboutUs.esquerda.text,
                        style: TextStyle(
                          fontSize: context.isDesktop ? 36 : 24,
                          fontWeight: AppFonts.bold,
                          color: AppColors.grey_800,
                        ),
                        textAlign: context.isDesktop ? null : TextAlign.center,
                      ),
                    ).pLeft(context.pageMargin / 2).pRight(context.width * 0.05),
                  ),
                  Container(
                    height: 240,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: context.isDesktop
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            )
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        aboutUs.segundo.text,
                        style: TextStyle(
                          fontSize: context.isDesktop ? 36 : 24,
                          fontWeight: AppFonts.bold,
                          color: AppColors.white,
                        ),
                        textAlign: context.isDesktop ? null : TextAlign.center,
                      ),
                    ).pRight(context.pageMargin / 2).pLeft(context.width * 0.05),
                  ),
                ];
                if (context.isDesktop) {
                  return Row(
                    children: content.map((e) => e.expanded()).toList(),
                  );
                }

                return Column(
                  children: content,
                );
              },
            ),
          ),
          const Gap(60),
        ],
      );
  Widget get _buildQuemSomosSection => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.grey_300,
            height: 1,
            width: context.width * 0.4,
          ).pH(context.width * 0.05),
          Gap(context.isDesktop ? 120 : 60),
          Text(
            quemSomos.titulo.text,
            style: TextStyle(
              fontSize: context.isDesktop ? 48 : 36,
              fontWeight: AppFonts.bold,
              color: AppColors.grey_800,
            ),
          ).pH(context.pageMargin),
          const Gap(20),
          GradientTextHighlight(
            text: quemSomos.descricao.text,
            spans: quemSomos.descricao.textHighlight,
            gradient: AppColors.gradient,
            style: TextStyle(
              fontSize: context.isDesktop ? 20 : 18,
              fontWeight: AppFonts.normal,
              color: AppColors.grey_600,
            ),
            textAlign: TextAlign.justify,
          ).pH(context.pageMargin),
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
