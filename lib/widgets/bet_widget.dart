import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router/router.dart';
import '../utils/colors.dart';

class BetWidget extends StatelessWidget {
  const BetWidget({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: whiteColor),
      child: BetBlocInfo(),
    );
  }
}

class BetBlocInfo extends StatelessWidget {
  const BetBlocInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          color: primaryColor,
          height: 36,
          width: double.infinity,
          child: Center(
              child: Text(
            '1x2',
            style: TextStyle(
                color: whiteColor, fontSize: 17, fontWeight: FontWeight.w600),
          )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 3,
              ),
              InkWell(
                onTap: () {
                  AutoRouter.of(context).push(MyPublicationRoute());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'П1',
                      style: theme.headlineSmall,
                    ),
                    Text(
                      '8.83',
                      style: theme.headlineSmall,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              InkWell(
                onTap: () {
                  print('laala');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'П1',
                      style: theme.headlineSmall,
                    ),
                    Text(
                      '8.83',
                      style: theme.headlineSmall,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              InkWell(
                onTap: () {
                  print('laala');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'П1',
                      style: theme.headlineSmall,
                    ),
                    Text(
                      '8.83',
                      style: theme.headlineSmall,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
