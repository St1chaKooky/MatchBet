import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/bet/bet_bloc.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';

import '../router/router.dart';
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
    final theme = Theme.of(context).textTheme;
    return BlocBuilder<BetBloc, BetState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is BetLoaded) {
          return SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 18),
            sliver: SliverList.builder(
                itemCount: state.betList.length,
                itemBuilder: (context, i) {
                  final betList = state.betList;
                  final nameBet = betList[i].name;
                  print(state.betList.length);
                  print(nameBet);
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
                          child: Column(
                            children: [
                              SizedBox(
                                height: 3,
                              ),
                              InkWell(
                                onTap: () {
                                  AutoRouter.of(context)
                                      .push(MyPublicationRoute());
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
