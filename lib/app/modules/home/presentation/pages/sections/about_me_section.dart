import 'package:flutter/material.dart';

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({super.key});

  static GlobalKey currentKey = GlobalKey();

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  // Apres? content;

  @override
  void initState() {
    // content = PrismicMemory().aboutMe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: AboutMeSection.currentKey,
      child: Builder(
        builder: (context) {
          // if (content == null) {
          return const Center();
          // }

          // return Row(
          //   children: [
          //     ClipRRect(
          //       borderRadius: BorderRadius.circular(10),
          //       child: Image.network(
          //         content!.image,
          //         width: 300,
          //         height: 300,
          //       ),
          //     ),
          //     const Gap(80),
          //     _buildAboutMe.expanded(),
          //   ],
          // ).pH(context.pageMargin).pV(80);
        },
      ),
    );
  }

  // Widget get _buildAboutMe => SelectionArea(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             content!.title.text,
  //             style: context.textTheme.titleLarge,
  //           ),
  //           const Gap(16),
  //           Text(
  //             content!.subtitle.text,
  //             style: context.textTheme.titleMedium,
  //           ),
  //           const Gap(16),
  //           GradientTextHighlight(
  //             text: content!.description.text,
  //             spans: content!.description.textHighlight,
  //             gradient: AppColors.gradient,
  //           ),
  //           const Gap(80),
  //           Row(
  //             children: [
  //               Button(
  //                 onPressed: () async {
  //                   launchUrl(
  //                     Uri.parse(content!.curriculumLink),
  //                   );
  //                 },
  //                 child: Row(
  //                   children: [
  //                     const Icon(Icons.download, color: AppColors.primary).pTop(2),
  //                     const Gap(8),
  //                     const Text('Curriculo'),
  //                   ],
  //                 ),
  //               ),
  //               const Gap(8),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
}
