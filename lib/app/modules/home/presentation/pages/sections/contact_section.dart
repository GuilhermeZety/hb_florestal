import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  static GlobalKey currentKey = GlobalKey();

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: ContactSection.currentKey,
      child: Column(
        children: [
          const Gap(60),
          Container(
            width: 400,
            height: 500,
            color: Colors.teal,
          ),
          const Gap(60),
        ],
      ),
    );
  }
}
