import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/bloc_auth/my_user_bloc/my_user_bloc.dart';
import 'package:match_bet/bloc/bloc_post/create_post_bloc/create_post_bloc_bloc.dart';
import 'package:match_bet/repositories/post_repositories/models/post_model.dart';
import 'package:match_bet/router/router.dart';
import 'package:match_bet/utils/colors.dart';

import '../../widgets/button_litle.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MyPublicationScreen extends StatefulWidget {
  final int matchId;
  final String date;
  final String k;
  final String nameBet;
  final String team1;
  final String team2;
  const MyPublicationScreen(
      {Key? key,
      required this.matchId,
      required this.team1,
      required this.team2,
      required this.date,
      required this.k,
      required this.nameBet})
      : super(key: key);

  @override
  State<MyPublicationScreen> createState() => _MyPublicationScreenState();
}

class _MyPublicationScreenState extends State<MyPublicationScreen> {
  bool f = false;
  final TextEditingController _controller = TextEditingController();
  late Post post;
  @override
  void initState() {
    super.initState();
    post = Post.empty;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    post = Post.empty;
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
    String name = ' ';
    final theme = Theme.of(context).textTheme;
    return BlocBuilder<MyUserBloc, MyUserState>(builder: (context, state) {
      if (state.status == MyUserStatus.success) {
        post.matchId = widget.matchId;
        post = Post.empty;
        name = state.user!.name;
        post = Post.empty;
        post.myUser = state.user!;
        String? picture = state.user!.picture!;
        String time = parseDateAndTime(widget.date, true);
        String days = parseDateAndTime(widget.date, false);

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              toolbarHeight: 65,
              surfaceTintColor: whiteColor,
              backgroundColor: whiteColor,
              automaticallyImplyLeading: true,
              centerTitle: true,
              title: Text(
                'Добавь описание',
                style: theme.titleSmall,
              ),
              // другие настройки flexibleSpace
            ),
            body: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 15)
                      .copyWith(top: 18),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        picture.isNotEmpty
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
                                          widget.team1,
                                          style: theme.headlineSmall,
                                        ),
                                        Text(widget.team2,
                                            style: theme.headlineSmall)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                          widget.nameBet,
                                          style: theme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
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
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: _controller,
                                  maxLines: 4,
                                  maxLength: 250,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your post here...',
                                    hintStyle: TextStyle(color: textColor),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: inputColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Закругление границы при фокусе
                                        borderSide: BorderSide(
                                            color:
                                                inputColor) // Убираем границу, оставляя только закругления
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      ButtonLitleWidget(
                        onTap: () {
                          if (_controller.text.isNotEmpty) {
                            setState(() {
                              post.post = _controller.text;
                              post.date = widget.date;
                              post.team1 = widget.team1;
                              post.team2 = widget.team2;
                              post.nameBet = widget.nameBet;
                              post.k = widget.k;
                            });
                            context
                                .read<CreatePostBlocBloc>()
                                .add(CreatePost(post));
                            AutoRouter.of(context).push(const MainRoute());
                          }
                        },
                        buttonText: 'Опубликовать',
                        width: double.infinity,
                        colorFill: primaryColor,
                        colorText: whiteColor,
                        bigButton: true,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: primaryColor,
            ),
          ),
        );
      }
    });
  }
}
