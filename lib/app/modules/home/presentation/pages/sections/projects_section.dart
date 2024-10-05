import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  static GlobalKey currentKey = GlobalKey();

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: ProjectsSection.currentKey,
      child: Column(
        children: [
          const Gap(60),
          Container(
            width: 200,
            height: 100,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
