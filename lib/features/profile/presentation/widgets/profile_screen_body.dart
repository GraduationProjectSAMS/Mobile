import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/profile/presentation/widgets/profile_menu_list.dart';
import 'package:graduation_project/features/profile/presentation/widgets/profile_stats_fields.dart';

import 'profile_bloc_builder.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(right: 20.0, left: 20.0, bottom: 15.0, top: 9.hR),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              ProfileBlocBuilder(),
              SizedBox(height: 20),
              ProfileStatsFields(),
              SizedBox(height: 30),
              ProfileMenuList(),
            ],
          ),
        ),
      ),
    );
  }
}
