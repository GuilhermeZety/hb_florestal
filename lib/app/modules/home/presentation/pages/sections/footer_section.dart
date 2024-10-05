import 'package:flutter/material.dart';
import 'package:hb_florestal/app/core/common/extensions/context_extension.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  static GlobalKey currentKey = GlobalKey();

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: FooterSection.currentKey,
      child: Container(
        height: 200,
        color: context.colorScheme.secondaryContainer,
      ),
    );
  }
}
