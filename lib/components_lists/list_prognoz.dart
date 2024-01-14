import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
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
  bool isLiked = false;
  late GetPostBlocBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = GetPostBlocBloc(
        postRepository: FirebasePostRepository()); // Инициализируем здесь
    _bloc.add(GetPosts());
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocBuilder<GetPostBlocBloc, GetPostBlocState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is GetPostSuccess) {
            return SliverList.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, i) {
                Post post = state.posts[i];
                int matchId = post.matchId;
                String postId = post.postId;
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
                String time = parseDateAndTime(date, true);
                String days = parseDateAndTime(date, false);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10)
                      .copyWith(bottom: 10),
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
                              post: postText,
                              matchId: matchId,
                              picture: picture,
                              team1: team1,
                              team2: team2,
                              date: date,
                              k: k,
                              like: like,
                              nameBet: nameBet,
                              dislike: dislike,
                              name: name,
                            ));
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      picture!.isNotEmpty
                                          ? Container(
                                              width: 26,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        picture,
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
                                        name,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        team1,
                                        style: theme.headlineSmall,
                                      ),
                                      Text(team2, style: theme.headlineSmall)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Прогноз',
                                        style: theme.bodySmall,
                                      ),
                                      Text(
                                        nameBet,
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
                                      k,
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
                                LikeButton(
                                  size: 27,
                                  animationDuration:
                                      Duration(milliseconds: 500),
                                  onTap: (bool isLiked) async {
                                    final postsCollection = FirebaseFirestore
                                        .instance
                                        .collection('posts');
                                    try {
                                      final postDoc = await postsCollection
                                          .doc(postId)
                                          .get();
                                      if (postDoc.exists) {
                                        final currentLike =
                                            postDoc['like'] as int;
                                        isLiked
                                            ? await postsCollection
                                                .doc(postId)
                                                .update(
                                                    {'like': currentLike - 1})
                                            : await postsCollection
                                                .doc(postId)
                                                .update(
                                                    {'like': currentLike + 1});
                                      }
                                    } catch (e) {
                                      log(e.toString());
                                      rethrow;
                                    }

                                    return !isLiked;
                                  },
                                  countBuilder: (likeCount, isLiked, text) {
                                    Widget result = Text(
                                      '$likeCount',
                                      style: theme.labelMedium,
                                    );
                                    return result;
                                  },
                                  likeBuilder: (isLiked) {
                                    if (isLiked) {
                                      return SvgPicture.asset(
                                        'images/like.svg',
                                        width: 22,
                                        height: 22,
                                        // ignore: deprecated_member_use
                                        color: primaryColor,
                                      );
                                    }
                                    if (!isLiked) {
                                      return SvgPicture.asset(
                                        'images/like.svg',
                                        width: 22,
                                        height: 22,
                                      );
                                    }
                                    return null;
                                  },
                                  likeCountPadding:
                                      const EdgeInsets.only(left: 10),
                                  likeCount: like,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),

                                LikeButton(
                                  size: 27,
                                  animationDuration:
                                      Duration(milliseconds: 500),
                                  onTap: (bool isLiked) async {
                                    final postsCollection = FirebaseFirestore
                                        .instance
                                        .collection('posts');
                                    try {
                                      final postDoc = await postsCollection
                                          .doc(postId)
                                          .get();
                                      if (postDoc.exists) {
                                        final currentLike =
                                            postDoc['disLike'] as int;
                                        isLiked
                                            ? await postsCollection
                                                .doc(postId)
                                                .update({
                                                'disLike': currentLike - 1
                                              })
                                            : await postsCollection
                                                .doc(postId)
                                                .update({
                                                'disLike': currentLike + 1
                                              });
                                      }
                                    } catch (e) {
                                      log(e.toString());
                                      rethrow;
                                    }

                                    return !isLiked;
                                  },
                                  countBuilder: (dislikeCount, isLiked, text) {
                                    Widget result = Text(
                                      '$dislikeCount',
                                      style: theme.labelMedium,
                                    );
                                    return result;
                                  },
                                  likeBuilder: (isLiked) {
                                    if (isLiked) {
                                      return SvgPicture.asset(
                                        'images/dizlike.svg',
                                        width: 21,
                                        height: 21,
                                        // ignore: deprecated_member_use
                                        color: primaryColor,
                                      );
                                    }
                                    if (!isLiked) {
                                      return SvgPicture.asset(
                                        'images/dizlike.svg',
                                        width: 21,
                                        height: 21,
                                      );
                                    }
                                    return null;
                                  },
                                  likeCountPadding:
                                      const EdgeInsets.only(left: 10),
                                  likeCount: dislike,
                                ),
                                // Text(
                                //   '$like',
                                //   style: theme.labelMedium,
                                // ),
                                // const SizedBox(
                                //   width: 10,
                                // ),
                                // InkWell(
                                //   onTap: () async {
                                //     final postsCollection = FirebaseFirestore
                                //         .instance
                                //         .collection('posts');

                                //     try {
                                //       final postDoc = await postsCollection
                                //           .doc(postId)
                                //           .get();
                                //       if (postDoc.exists) {
                                //         final currentDislike =
                                //             postDoc['disLike'] as int;
                                //         await postsCollection
                                //             .doc(postId)
                                //             .update({
                                //           'disLike': currentDislike + 1
                                //         });
                                //       }
                                //     } catch (e) {
                                //       log(e.toString());
                                //       rethrow;
                                //     }
                                //   },
                                //   child: SvgPicture.asset(
                                //     'images/dizlike.svg',
                                //     width: 22,
                                //     height: 22,
                                //   ),
                                // ),
                                // const SizedBox(
                                //   width: 6,
                                // ),
                                // Text(
                                //   '$dislike',
                                //   style: theme.labelMedium,
                                // ),
                              ],
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                AutoRouter.of(context).push(PrognozRoute(
                                  post: postText,
                                  matchId: matchId,
                                  picture: picture,
                                  team1: team1,
                                  team2: team2,
                                  date: date,
                                  k: k,
                                  like: like,
                                  nameBet: nameBet,
                                  dislike: dislike,
                                  name: name,
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
