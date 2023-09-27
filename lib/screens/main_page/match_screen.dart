import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';
import '../../widgets/match_widget.dart';

@RoutePage()
class MatchScreen extends StatefulWidget {
  final int id;
  const MatchScreen({
    Key? key,
    @PathParam('id') required this.id,
  }) : super(key: key);

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 60,
            floating: false,
            backgroundColor: whiteColor,

            title: Center(
              child: Text(
                'Все матчи',
                style: theme.titleSmall,
              ),
            ),
            // другие настройки flexibleSpace

            elevation: 0,
          ),
          MatchWidget(
            id: widget.id,
            theme: theme,
          ),
        ],
      ),
    );
  }
}
