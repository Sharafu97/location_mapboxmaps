import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class ScreenHeadder extends StatelessWidget {
  const ScreenHeadder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomRight,
      decoration: const BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.person_rounded,
            size: 50,
          ),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Robert Doe',
                  style: TextStyle(
                      color: AppColors.whiteFFFFFF,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'robrt@Gmail.com',
                  style: TextStyle(
                    color: AppColors.whiteFFFFFF,
                  ),
                )
              ])
        ],
      ),
    );
  }
}
