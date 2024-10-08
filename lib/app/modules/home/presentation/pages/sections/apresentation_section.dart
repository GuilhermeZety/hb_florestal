import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/constants/app_fonts.dart';
import 'package:hb_florestal/app/core/common/extensions/context_extension.dart';
import 'package:hb_florestal/app/core/common/extensions/text_extension.dart';
import 'package:hb_florestal/app/core/common/extensions/widget/widget_extension.dart';
import 'package:hb_florestal/app/core/shared/features/prismic/models/content_model.dart';
import 'package:hb_florestal/app/core/shared/prismic_memory.dart';
import 'package:hb_florestal/app/core/shared/session_memory.dart';
import 'package:hb_florestal/app/ui/components/gradient_text_highlight.dart';
import 'package:signals/signals_flutter.dart';

class ApresentationSection extends StatefulWidget {
  const ApresentationSection({super.key});

  static GlobalKey currentKey = GlobalKey();

  @override
  State<ApresentationSection> createState() => _ApresentationSectionState();
}

class _ApresentationSectionState extends State<ApresentationSection> {
  ApresentationContent apresentation = PrismicMemory().apresentation;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: ApresentationSection.currentKey,
      child: Container(
        height: context.height - 160,
        color: context.colorScheme.primaryContainer,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.memory(
                SessionMemory().backgroundPNG,
                width: context.width,
                height: context.height,
                fit: BoxFit.cover,
              ),
            ),
            if (!context.isDesktop)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            Center(
              child: Row(
                mainAxisAlignment: !context.isDesktop ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  _buildApresentation().pH(context.pageMargin).pBottom(64).expanded(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApresentation() {
    return SelectionArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            apresentation.subtitulo.text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: AppFonts.normal,
              color: AppColors.white.withOpacity(0.6),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: GradientTextHighlight(
              text: apresentation.titulo.text,
              spans: apresentation.titulo.textHighlight,
              gradient: AppColors.gradient,
              style: TextStyle(
                fontSize: context.isDesktop ? 48 : 32,
                fontWeight: AppFonts.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ).shim(),
    );
  }
}

class AnimatedName extends StatefulWidget {
  const AnimatedName({super.key});

  @override
  State<AnimatedName> createState() => _AnimatedNameState();
}

class _AnimatedNameState extends State<AnimatedName> {
  @override
  Widget build(BuildContext context) {
    return Watch(
      (context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: const AutoSizeText(
              '12312',
              style: TextStyle(
                fontSize: 42,
                fontWeight: AppFonts.bold,
              ),
              maxLines: 1,
            ).gradient(AppColors.gradient),
          ),
        ],
      ),
    );
  }
}
