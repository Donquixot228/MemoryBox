import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memorybox2/blocs/profile_bloc/profile_bloc.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';
import 'package:memorybox2/resources/resources.dart';

class ImagePickerProfile extends StatelessWidget {
  ImagePickerProfile();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return BlocBuilder<DataBaseRepository, UserModel>(
          builder: (context, userState) {
            if (profileState is ProfileInitial) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Stack(
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: AppColors.whiteColor.withOpacity(0.9),
                      child: SizedBox(
                        height: 220,
                        width: 220,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            userState.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (profileState is ProfileEditing) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Stack(
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: AppColors.whiteColor.withOpacity(0.9),
                      child: SizedBox(
                        height: 220,
                        width: 220,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            userState.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.5, left: 4),
                      child: InkWell(
                        onTap: () async {
                          ImagePicker _picker = ImagePicker();
                          final XFile? _image = await _picker.pickImage(
                              source: ImageSource.gallery);

                          if (_image != null) {
                            File _imagePath = File(_image.path);
                            log('Uploading....');
                            context
                                .read<ProfileBloc>()
                                .add(ProfileUpdatePhoto(_imagePath));
                          }

                          if (_image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('No pictures was selected'),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 220,
                          width: 220,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Container(
                              width: 100,
                              height: 100,
                              padding: const EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1.5,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              child: SvgPicture.asset(
                                AppIcons.Camera,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
