import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:match_bet/bloc/bloc_auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:match_bet/bloc/update_user_info/update_user_info_bloc.dart';
import 'package:match_bet/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:match_bet/components_lists/list_prognoz_account.dart';

import '../../bloc/bloc_auth/my_user_bloc/my_user_bloc.dart';

@RoutePage()
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return BlocListener<UpdateUserInfoBloc, UpdateUserInfoState>(
      listener: (context, state) {
        if (state is UploadPictureSuccess) {
          setState(() {
            context.read<MyUserBloc>().state.user!.picture = state.userImage;
          });
        }
      },
      child: BlocBuilder<MyUserBloc, MyUserState>(builder: (context, state) {
        if (state.status == MyUserStatus.success) {
          return Scaffold(
            backgroundColor: whiteColor,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            state.user!.picture == ""
                                ? GestureDetector(
                                    onTap: () async {
                                      final ImagePicker picker = ImagePicker();
                                      final XFile? image =
                                          await picker.pickImage(
                                              source: ImageSource.gallery,
                                              maxHeight: 500,
                                              maxWidth: 500,
                                              imageQuality: 40);
                                      if (image != null) {
                                        CroppedFile? croppedFile =
                                            await ImageCropper().cropImage(
                                          sourcePath: image.path,
                                          aspectRatio: const CropAspectRatio(
                                              ratioX: 1, ratioY: 1),
                                          aspectRatioPresets: [
                                            CropAspectRatioPreset.square
                                          ],
                                          uiSettings: [
                                            AndroidUiSettings(
                                                toolbarTitle: 'Cropper',
                                                toolbarColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                toolbarWidgetColor:
                                                    Colors.white,
                                                initAspectRatio:
                                                    CropAspectRatioPreset
                                                        .original,
                                                lockAspectRatio: false),
                                            IOSUiSettings(
                                              title: 'Cropper',
                                            ),
                                          ],
                                        );
                                        if (croppedFile != null) {
                                          setState(() {
                                            context
                                                .read<UpdateUserInfoBloc>()
                                                .add(UploadPicture(
                                                    croppedFile.path,
                                                    context
                                                        .read<MyUserBloc>()
                                                        .state
                                                        .user!
                                                        .id));
                                          });
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          shape: BoxShape.circle),
                                      child: Icon(CupertinoIcons.person,
                                          color: Colors.grey.shade400),
                                    ),
                                  )
                                : Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              state.user!.picture!,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  state.user!.name,
                                  style: theme.headlineSmall,
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                        const _Button()
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 10, left: 25, right: 25),
                    child: Text(
                      'Мои прогнозы ',
                      style: theme.headlineSmall,
                    ),
                  ),
                ),
                ListPrognozAccountWidget(
                  id: state.user!.id,
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: whiteColor,
            body: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: primaryColor,
              ),
            ),
          );
        }
      }),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SignInBloc>().add(const SignOutRequired());
      },
      child: Container(
          width: 85,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              color: Colors.red),
          child: Text(
            'Выйти',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: whiteColor,
            ),
          )),
    );
  }
}
