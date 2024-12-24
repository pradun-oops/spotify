import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/appbar.dart';
import 'package:spotify/core/confg/assets/app_images.dart';
import 'package:spotify/core/confg/assets/app_vector.dart';
import 'package:spotify/core/confg/theme/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVector.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_homeTopCard(), _tabs()],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              AppVector.homeTopCard,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Image.asset(
                AppImages.homeArtist,
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
        controller: _tabController,
        indicatorWeight: 2,
        indicatorColor: AppColors.primary,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 40),
        tabs: const [
          Text(
            'New',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          Text('Videos',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
          Text('Artist',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
          Text('Podcast',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        ]);
  }
}
