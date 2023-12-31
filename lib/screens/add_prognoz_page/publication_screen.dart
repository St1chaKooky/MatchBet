import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/bloc_auth/my_user_bloc/my_user_bloc.dart';
import 'package:match_bet/repositories/post_repositories/models/post_model.dart';
import 'package:match_bet/utils/colors.dart';

import '../../widgets/button_litle.dart';

import '../../widgets/prognoz_widget.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MyPublicationScreen extends StatefulWidget {
  MyPublicationScreen({Key? key}) : super(key: key);

  @override
  State<MyPublicationScreen> createState() => _MyPublicationScreenState();
}

class _MyPublicationScreenState extends State<MyPublicationScreen> {
  bool f = false;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Post post;
    String name = ' ';
    final theme = Theme.of(context).textTheme;
    return BlocBuilder<MyUserBloc, MyUserState>(builder: (context, state) {
      if (state.status == MyUserStatus.success) {
        name = state.user!.name;
        post = Post.empty;
        post.myUser = state.user!;
        log(post.toString());
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
                                        CircleAvatar(
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
                                          'Интер',
                                          style: theme.headlineSmall,
                                        ),
                                        Text('Монца',
                                            style: theme.headlineSmall)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Сегодня',
                                          style: theme.bodyMedium,
                                        ),
                                        Text(
                                          '11:00',
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
                                          'ТМ1.5',
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
                                        '2.47',
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
                        onTap: () {},
                        buttonText: 'Опубликовать',
                        width: double.infinity,
                        colorFill: proverka() ? primaryColor : textColor,
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
