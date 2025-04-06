import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/presentation/widgets/offers_list.dart';
import 'banner_list_with_indicator.dart';
import 'home_app_bar.dart';
import 'home_text_title.dart';
import 'newly_added_list.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [  Padding(
        padding: const EdgeInsets.all(20),
        child: HomeAppBar(),
      ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerListWithIndicator(),
                HomeTextTitle(
                title:   'Newly Added',
                        ),
                NewlyAddedList(),
                HomeTextTitle(
                 title:  'Offers',

                ),
                OffersList(),
                SizedBox(
                  height: 20,
                )

              ],
            ),
          ),
        ),
      ],
    );
  }
}

