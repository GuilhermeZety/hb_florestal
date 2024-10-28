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

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  static GlobalKey currentKey = GlobalKey();

  @override
  State<ServicesSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ServicesSection> {
  ServicesContent servicos = PrismicMemory().servicos;
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: ServicesSection.currentKey,
      child: SelectionArea(
        child: Container(
          color: AppColors.green_50,
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              _buildTitle(),
              Gap(context.isDesktop ? 84 : 48),
              _buildServices(),
              Gap(context.isDesktop ? 48 : 32),
            ],
          ),
        ).expandedH(),
      ),
    );
  }

  Widget _buildTitle() {
    return SeparatedFlex(
      direction: context.width < 1250 ? Axis.vertical : Axis.horizontal,
      separatorBuilder: () => Gap(context.pageMargin / 3),
      crossAxisAlignment: context.width < 1250 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        NamedTitle(
          title: 'Nossos',
          subtitle: 'Serviços',
          fontSize: context.isDesktop ? 64 : 36,
          inverted: false,
        ),
        Gap(context.isDesktop ? 24 : 12),
        GradientTextHighlight(
          text: servicos.descricao.text,
          spans: servicos.descricao.textHighlight,
          gradient: AppColors.gradient,
          style: const TextStyle(
            fontSize: 16,
          ),
        ).expanded(flex: context.width < 1250 ? null : 1),
      ],
    ).pH(context.pageMargin);
  }

  Widget _buildServices() {
    if (context.width > 1250) {
      return SizedBox(
        width: context.width,
        height: 400,
        child: _buildServicesDesktop(),
      );
    }
    return LayoutBuilder(
      builder: (context, ccc) {
        var va = getVA(ccc.maxWidth);
        return SizedBox(
          width: context.width,
          height: 400,
          child: CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              viewportFraction: va.viewport,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: 6.seconds,
              aspectRatio: va.aspectRatio,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
            ),
            items: List.generate(
              servicos.servicos.length,
              (index) => serviceItem(
                index + 1,
                servicos.servicos[index].titulo,
                servicos.servicos[index].subtitulo,
                servicos.servicos[index].descricao,
              ).pH(4),
            ),
          ),
        );
      },
    ).pH(context.pageMargin);
  }

  Widget _buildServicesDesktop() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.8,
      children: List.generate(
        servicos.servicos.length,
        (index) => serviceItem(
          index + 1,
          servicos.servicos[index].titulo,
          servicos.servicos[index].subtitulo,
          servicos.servicos[index].descricao,
        ).pH(4),
      ),
    ).pH(context.pageMargin);
  }

  Widget serviceItem(int index, String title, String subtitle, String description) {
    double size = 300;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.green_500,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      width: size,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                index.toString(),
                style: TextStyle(
                  fontSize: context.isDesktop ? 32 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const Gap(12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ).expanded(),
            ],
          ),
          const Gap(24),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.white.withOpacity(0.6),
            ),
          ),
          Gap(context.isDesktop ? 24 : 12),
          AutoSizeText(
            description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.white,
            ),
          ).expanded(),
        ],
      ),
    );
  }

  ({double viewport, double aspectRatio}) getVA(double width) {
    var viewport = 0.3;
    double aspectRatio = 2;
    if (width < 1600) {
      aspectRatio = 1.7;
    }
    if (width < 1300) {
      aspectRatio = 1.5;
    }
    if (width < 1050) {
      aspectRatio = 1.3;
      viewport = 0.4;
    }
    if (width < 820) {
      aspectRatio = 1;
    }
    if (width < 680) {
      viewport = 0.6;
    }
    if (width < 580) {
      aspectRatio = 0.8;
    }
    if (width < 490) {
      viewport = 0.7;
      aspectRatio = 0.6;
    }
    if (width < 400) {
      viewport = 0.8;
      aspectRatio = 0.5;
    }
    if (width < 335) {
      viewport = 0.8;
      aspectRatio = 0.9;
    }
    aspectRatio = 1;
    return (viewport: viewport, aspectRatio: aspectRatio);
  }
}
