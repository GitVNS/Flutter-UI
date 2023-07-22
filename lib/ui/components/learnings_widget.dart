import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/models/learning.dart';
import 'package:routine/ui/components/space.dart';

import '../../utils/app_colors.dart';
import '../animations/tap_bounce.dart';

class LearningsWidget extends StatelessWidget {
  const LearningsWidget({super.key, required this.learnings});

  final Learnings learnings;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                learnings.heading,
                style: GoogleFonts.lora(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDarkest,
                ),
              ),
              SizedBox(
                height: 24,
                width: 70,
                child: TapBounce(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "View all",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColors.greyDarker),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                            "assets/icons/ic_forward_arrow.svg",
                            width: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.separated(
            itemCount: learnings.topics.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return imageCard(
                  onTap: learnings.topics[index].onTap,
                  imagePath: learnings.topics[index].imagePath,
                  title: learnings.topics[index].title,
                  description: learnings.topics[index].description,
                  information: learnings.topics[index].information,
                  topicAction: learnings.topics[index].action);
            },
            separatorBuilder: (context, index) => const Space(horizontal: 16),
          ),
        ),
      ],
    );
  }

  Widget imageCard(
      {required VoidCallback onTap,
      required String imagePath,
      required String title,
      required String description,
      required String information,
      required TopicAction topicAction}) {
    return TapBounce(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        width: 242,
        height: 280,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: AppColors.greyLighter,
                blurRadius: 5,
              ),
            ],
            border: Border.all(width: 1, color: AppColors.greyLighter)),
        child: Column(
          children: [
            Image(
              image: AssetImage(imagePath),
              height: 140,
              fit: BoxFit.cover,
              width: 242,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: AppColors.primary),
                  ),
                  const Space(vertical: 16),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const Space(vertical: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        information,
                        style: GoogleFonts.inter(
                            color: AppColors.greyDarker,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      getAction(topicAction: topicAction)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getAction({required TopicAction topicAction}) {
    switch (topicAction) {
      case TopicAction.none:
        return Container();
      case TopicAction.book:
        return Container(
          height: 26,
          width: 62,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 1, color: AppColors.primary)),
          alignment: Alignment.center,
          child: Text(
            "Book",
            style: GoogleFonts.inter(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
        );
      case TopicAction.lock:
        return SvgPicture.asset("assets/icons/ic_lock.svg");
      default:
        return Container();
    }
  }
}
