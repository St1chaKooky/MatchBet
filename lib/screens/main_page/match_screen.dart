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
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 0,
        toolbarHeight: 65,
        surfaceTintColor: whiteColor,
        backgroundColor: whiteColor,
        title: Text(
          'Все матчи',
          textAlign: TextAlign.center,
          style: theme.titleSmall,
        ),
        // другие настройки flexibleSpace
      ),
      body: CustomScrollView(
        slivers: [
          MatchWidget(
            id: widget.id,
            theme: theme,
          ),
        ],
      ),
    );
  }
}
