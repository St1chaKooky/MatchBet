import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';

class PrognozMatchWidget extends StatefulWidget {
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

  const PrognozMatchWidget({
    required this.post,
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
  State<PrognozMatchWidget> createState() => _PrognozMatchWidgetState();
}

class _PrognozMatchWidgetState extends State<PrognozMatchWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    bool proverka() {
      if (widget.post.isNotEmpty) {
        return true;
      } else {
        return false;
      }
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

    String time = parseDateAndTime(widget.date, true);
    String days = parseDateAndTime(widget.date, false);
    return Expanded(
      child: Container(
        // height: 400,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.post,
              style: theme.bodyLarge,
            ),
            const SizedBox(
              height: 12,
            ),
          ]),
        ),
      ),
    );
  }
}
