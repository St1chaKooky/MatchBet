import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/bet/bet_bloc.dart';
import 'package:match_bet/models/bets/valuee.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';

import '../utils/colors.dart';

class BetWidget extends StatefulWidget {
  final int id;
  const BetWidget({
    required this.id,
    super.key,
  });

  @override
  State<BetWidget> createState() => _BetWidgetState();
}

class _BetWidgetState extends State<BetWidget> {
  late BetBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BetBloc(ApiMethods(), widget.id);
    _bloc.add(LoadBet());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BetBloc, BetState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is BetLoaded) {
          return SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 18),
            sliver: SliverList.builder(
                itemCount: state.betList?.length,
                itemBuilder: (context, i) {
                  print(widget.id);
                  final betList = state.betList;
                  final nameBet = betList?[i].name;
                  List<Valuee>? listValues = betList?[i].values;
                  List<_MyBet> listWidget = [];
                  for (int i = 0; i < listValues!.length; i++) {
                    String value = 'ф';
                    String odd = '';
                    if (listValues[i].odd != null) {
                      odd = listValues[i].odd!;
                    }
                    if (listValues[i].value != null) {
                      value = listValues[i].value!;
                    }
                    listWidget.add(
                      _MyBet(
                        id: widget.id,
                        odd: odd,
                        value: value,
                      ),
                    );
                  }
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: whiteColor),
                    child: Column(
                      children: [
                        Container(
                          color: primaryColor,
                          height: 36,
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            nameBet == null ? ' ' : nameBet,
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(children: listWidget),
                        ),
                      ],
                    ),
                  );
                }),
          );
        }
        return SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: primaryColor,
            ),
          ),
        );
      },
    );
  }
}

class _MyBet extends StatefulWidget {
  final int id;
  final String value;
  final String odd;
  const _MyBet({
    super.key,
    required this.value,
    required this.odd,
    required this.id,
  });

  @override
  State<_MyBet> createState() => _MyBetState();
}

class _MyBetState extends State<_MyBet> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        print('laala');
      },
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.value,
                style: theme.headlineSmall,
              ),
              Text(
                widget.odd,
                style: theme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
        ],
      ),
    );
  }
}
