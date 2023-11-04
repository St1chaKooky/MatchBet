import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:match_bet/bloc/bloc_auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:match_bet/bloc/update_user_info/update_user_info_bloc.dart';
import 'package:match_bet/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
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
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            BlocBuilder<MyUserBloc, MyUserState>(
              builder: (context, state) {
                if (state.status == MyUserStatus.success) {
                  return Column(
                    children: [
                      state.user!.picture == ""
                          ? GestureDetector(
                              onTap: () async {
                                final ImagePicker picker = ImagePicker();
                                final XFile? image = await picker.pickImage(
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
                                          toolbarWidgetColor: Colors.white,
                                          initAspectRatio:
                                              CropAspectRatioPreset.original,
                                          lockAspectRatio: false),
                                      IOSUiSettings(
                                        title: 'Cropper',
                                      ),
                                    ],
                                  );
                                  if (croppedFile != null) {
                                    setState(() {
                                      context.read<UpdateUserInfoBloc>().add(
                                          UploadPicture(
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
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    shape: BoxShape.circle),
                                child: Icon(CupertinoIcons.person,
                                    color: Colors.grey.shade400),
                              ),
                            )
                          : Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        state.user!.picture!,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                      const SizedBox(width: 10),
                      Text(
                        "${state.user!.name}",
                        style: theme.bodyMedium,
                      )
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
            Center(
                child: ElevatedButton(
              child: Text('Logout'),
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
            )),
          ],
        ),
      ),
    );
  }
}
