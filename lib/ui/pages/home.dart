import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/leanings_data.dart';
import '../../utils/app_colors.dart';
import '../animations/tap_bounce.dart';
import '../components/learnings_widget.dart';
import '../components/space.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          appbar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.white,
                child: ListView.builder(
                    itemCount: learningsData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 24),
                    itemBuilder: ((context, index) =>
                        LearningsWidget(learnings: learningsData[index]))),
              ),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar appbar() {
    return SliverAppBar(
      expandedHeight: 276,
      backgroundColor: AppColors.lightPrimary,
      elevation: 0,
      leadingWidth: 40,
      leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SvgPicture.asset("assets/icons/ic_drawer.svg")),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TapBounce(
            onTap: () {},
            child: SvgPicture.asset("assets/icons/ic_messaging.svg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TapBounce(
            onTap: () {},
            child: SvgPicture.asset("assets/icons/ic_notification.svg"),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 220),
        child: greetingWidget(),
      ),
    );
  }

  Widget greetingWidget() {
    return Container(
      color: AppColors.lightPrimary,
      height: 220,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Space(vertical: 8),
          Text("Hello, Priya!",
              style: GoogleFonts.lora(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDarkest)),
          const Space(vertical: 2),
          Text("What do you wanna learn today?",
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDarker)),
          const Space(vertical: 32),
          Row(
            children: [
              outlinedButton(
                  title: "Programs",
                  icon: SvgPicture.asset("assets/icons/ic_program.svg"),
                  onTap: () {}),
              const Space(horizontal: 8),
              outlinedButton(
                title: "Get help",
                icon: SvgPicture.asset("assets/icons/ic_help.svg"),
                onTap: () {},
              ),
            ],
          ),
          const Space(vertical: 10),
          Row(
            children: [
              outlinedButton(
                title: "Learn",
                icon: SvgPicture.asset("assets/icons/ic_learn.svg"),
                onTap: () {},
              ),
              const Space(horizontal: 8),
              outlinedButton(
                  title: "DD Tracker",
                  icon: SvgPicture.asset("assets/icons/ic_tracker.svg"),
                  onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget outlinedButton(
      {required String title,
      required Widget icon,
      required VoidCallback onTap}) {
    return Expanded(
      flex: 1,
      child: TapBounce(
        onTap: onTap,
        child: Container(
          height: 48,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.primary),
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon,
              const Space(horizontal: 16),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
