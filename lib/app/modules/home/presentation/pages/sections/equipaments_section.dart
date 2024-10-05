import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/extensions/context_extension.dart';
import 'package:hb_florestal/app/core/common/extensions/widget/widget_extension.dart';
import 'package:hb_florestal/app/core/shared/features/prismic/models/content_model.dart';
import 'package:hb_florestal/app/core/shared/prismic_memory.dart';
import 'package:hb_florestal/app/ui/components/gradient_text_highlight.dart';
import 'package:hb_florestal/app/ui/components/named_title.dart';

class EquipamentsSection extends StatefulWidget {
  const EquipamentsSection({super.key});

  static GlobalKey currentKey = GlobalKey();

  @override
  State<EquipamentsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<EquipamentsSection> {
  EquipamentosContent equipamentos = PrismicMemory().equipamentos;
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: EquipamentsSection.currentKey,
      child: SelectionArea(
        child: Column(
          children: [
            Row(
              children: [
                const Divider(
                  color: AppColors.grey_850,
                ).expanded(),
                const Text(
                  'HB FLORESTAL',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.grey_850,
                    fontWeight: FontWeight.bold,
                  ),
                ).pH(24),
                const Divider(
                  color: AppColors.grey_850,
                ).expanded(),
              ],
            ).pH(context.pageMargin / 5),
            const Gap(12),
            Container(
              color: AppColors.grey_850,
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  _buildTitle(),
                  Gap(context.isDesktop ? 80 : 48),
                  _buildControllerAndDivider(),
                  Gap(context.isDesktop ? 80 : 48),
                  _buildEquipaments(),
                ],
              ),
            ).expandedH(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return SeparatedFlex(
      direction: context.width < 1250 ? Axis.vertical : Axis.horizontal,
      separatorBuilder: () => Gap(context.pageMargin),
      crossAxisAlignment: context.width < 1250 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        NamedTitle(
          title: 'Nossos',
          subtitle: 'Equipamentos',
          fontSize: context.isDesktop ? 64 : 36,
          inverted: true,
        ),
        Gap(context.isDesktop ? 24 : 12),
        GradientTextHighlight(
          text: equipamentos.descricao.text,
          spans: equipamentos.descricao.textHighlight,
          gradient: AppColors.gradient,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
          ),
        ).expanded(flex: context.width < 1250 ? null : 1),
      ],
    ).pH(context.pageMargin / 2);
  }

  Widget _buildControllerAndDivider() {
    return Row(
      children: [
        const Divider(
          color: AppColors.white,
        ).expanded(),
        const Gap(40),
        IconButton(
          onPressed: () {
            carouselController.previousPage();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            color: AppColors.white,
            size: 80,
          ),
        ),
        const Gap(10),
        IconButton(
          onPressed: () {
            carouselController.nextPage();
          },
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            color: AppColors.white,
            size: 80,
          ),
        ),
      ],
    ).pH(context.pageMargin / 5);
  }

  Widget _buildEquipaments() {
    var va = getVA();

    return SizedBox(
      width: context.width,
      child: CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          viewportFraction: va.viewport,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: 6.seconds,
          aspectRatio: va.aspectRatio,
        ),
        items: [
          ...equipamentos.equipamentos.map(
            (e) => equipementItem(
              e.imagem,
              e.titulo,
              e.descricao,
            ).pH(8),
          ),
        ],
      ).pH(context.pageMargin / 2),
    );
  }

  Widget equipementItem(String image, String title, String description) {
    double size = context.width > 1250
        ? 450
        : context.isMobile
            ? 300
            : 350;
    return SizedBox(
      width: size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            width: size,
            height: size,
          ),
          Gap(context.isDesktop ? 24 : 12),
          Text(
            title,
            style: TextStyle(
              fontSize: context.isDesktop ? 32 : 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          Gap(context.isDesktop ? 24 : 12),
          AutoSizeText(
            description,
            style: TextStyle(
              fontSize: context.isDesktop ? 18 : 16,
              fontWeight: FontWeight.normal,
              color: AppColors.white.withOpacity(0.6),
            ),
          ).expandedH(),
        ],
      ),
    );
  }

  ({double viewport, double aspectRatio}) getVA() {
    var viewport = 0.35;
    double aspectRatio = 2;
    if (context.width < 1600) {
      aspectRatio = 1.7;
    }
    if (context.width < 1300) {
      aspectRatio = 1.5;
    }
    if (context.width < 1050) {
      aspectRatio = 1.3;
      viewport = 0.4;
    }
    if (context.width < 820) {
      aspectRatio = 1;
    }
    if (context.width < 680) {
      viewport = 0.6;
    }
    if (context.width < 580) {
      aspectRatio = 0.8;
    }
    if (context.width < 490) {
      viewport = 0.7;
      aspectRatio = 0.6;
    }
    if (context.width < 400) {
      viewport = 0.8;
      aspectRatio = 0.5;
    }
    if (context.width < 335) {
      viewport = 1;
      aspectRatio = 0.4;
    }
    return (viewport: viewport, aspectRatio: aspectRatio);
  }
}
