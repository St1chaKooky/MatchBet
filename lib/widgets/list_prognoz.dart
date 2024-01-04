import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:match_bet/bloc/bloc_post/get_post_bloc/get_post_bloc_bloc.dart';
import 'package:match_bet/repositories/post_repositories/firebase_post_repositories.dart';
import 'package:match_bet/repositories/post_repositories/models/post_model.dart';
import 'package:match_bet/utils/colors.dart';

import '../router/router.dart';

class ListPrognozWidget extends StatefulWidget {
  const ListPrognozWidget({super.key});

  @override
  State<ListPrognozWidget> createState() => _ListPrognozWidgetState();
}

class _ListPrognozWidgetState extends State<ListPrognozWidget> {
  late GetPostBlocBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = GetPostBlocBloc(
        postRepository: FirebasePostRepository()); // Инициализируем здесь
    _bloc.add(GetPosts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostBlocBloc, GetPostBlocState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is GetPostSuccess) {
            return SliverList.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, i) {
                Post post = state.posts[i];
                int matchId = post.matchId;

                String k = post.k;
                String postText = post.post;
                String name = post.myUser.name;
                String date = post.date;
                String nameBet = post.nameBet;
                String team1 = post.team1;
                String team2 = post.team2;
                int like = post.like;
                int dislike = post.disLike;
                String? picture = post.myUser.picture;
                return PrognozWidget(
                  post: postText,
                  matchId: matchId,
                  picture: picture,
                  team1: team1,
                  team2: team2,
                  k: k,
                  date: date,
                  like: like,
                  nameBet: nameBet,
                  dislike: dislike,
                  name: name,
                );
              },
            );
          } else if (state is GetPostLoading) {
            return SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: primaryColor,
                ),
              ),
            );
          } else {
            return const SliverFillRemaining(
              child: Center(
                child: Text('Список прогнозов на сегодня пуст'),
              ),
            );
          }
        });
  }
}

class PrognozWidget extends StatefulWidget {
  final String post;
  final String k;
  final String name;
  final String date;
  final String nameBet;
  final String team1;
  final String team2;
  final int like;
  final int dislike;
  final String? picture;
  final int matchId;
  const PrognozWidget({
    required this.post,
    required this.matchId,
    required this.picture,
    required this.team1,
    required this.team2,
    required this.date,
    required this.k,
    required this.nameBet,
    required this.like,
    required this.dislike,
    required this.name,
    super.key,
  });

  @override
  State<PrognozWidget> createState() => _PrognozWidgetState();
}

String parseDateAndTime(String dateTime, bool timeA) {
  // Разделение строки на дату и время
  List<String> parts = dateTime.split(' ');
  String dayss = parts[0];
  String timee = parts[2];
  if (timeA) {
    return timee;
  } else {
    return dayss;
  }
}

class _PrognozWidgetState extends State<PrognozWidget> {
  @override
  Widget build(BuildContext context) {
    String time = parseDateAndTime(widget.date, true);
    String days = parseDateAndTime(widget.date, false);
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 220,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                AutoRouter.of(context).push(PrognozRoute(
                  post: widget.post,
                  matchId: widget.matchId,
                  picture: widget.picture,
                  team1: widget.team1,
                  team2: widget.team2,
                  date: widget.date,
                  k: widget.k,
                  like: widget.like,
                  nameBet: widget.nameBet,
                  dislike: widget.dislike,
                  name: widget.name,
                ));
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          widget.picture!.isNotEmpty
                              ? Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            widget.picture!,
                                          ),
                                          fit: BoxFit.cover)),
                                )
                              : CircleAvatar(
                                  backgroundColor: bottomBarColor,
                                  radius: 13,
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.name,
                            style: theme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.team1,
                            style: theme.headlineSmall,
                          ),
                          Text(widget.team2, style: theme.headlineSmall)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            days,
                            style: theme.bodyMedium,
                          ),
                          Text(
                            time,
                            style: theme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Прогноз',
                            style: theme.bodySmall,
                          ),
                          Text(
                            widget.nameBet,
                            style: theme.bodyLarge,
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: primaryColor),
                        width: 60,
                        height: 35,
                        child: Center(
                            child: Text(
                          widget.k,
                          style: TextStyle(
                              fontSize: 14,
                              color: whiteColor,
                              fontWeight: FontWeight.w400),
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => print('like'),
                      child: SvgPicture.asset(
                        'images/like.svg',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '${widget.like}',
                      style: theme.labelMedium,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () => print('dizlike'),
                      child: SvgPicture.asset(
                        'images/dizlike.svg',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '${widget.dislike}',
                      style: theme.labelMedium,
                    ),
                  ],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    AutoRouter.of(context).push(PrognozRoute(
                      post: widget.post,
                      matchId: widget.matchId,
                      picture: widget.picture,
                      team1: widget.team1,
                      team2: widget.team2,
                      date: widget.date,
                      k: widget.k,
                      like: widget.like,
                      nameBet: widget.nameBet,
                      dislike: widget.dislike,
                      name: widget.name,
                    ));
                  },
                  child: Text(
                    'Читать дальше',
                    style: theme.labelMedium,
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
