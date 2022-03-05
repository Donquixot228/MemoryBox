import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memorybox2/cubits/collections_builder_cubit/collections_builder_cubit.dart';
import 'package:memorybox2/resources/resources.dart';

class BuildImageCard extends StatelessWidget {
  BuildImageCard({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsBuilderCubit, CollectionsBuilderState>(
      builder: (context, state) {
        return Stack(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: AppColors.whiteColor.withOpacity(0.9),
                child: SizedBox(
                  height: 240,
                  width: width-10,
                  child: state.imageUrl != ''
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            state.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        )
                      : null
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: InkWell(
                  onTap: () async {
                    ImagePicker _picker = ImagePicker();
                    final XFile? _image =
                        await _picker.pickImage(source: ImageSource.gallery);

                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('No pictures was selected'),
                        ),
                      );
                    }
                    if (_image != null) {
                      log('Uploading....');
                      File _imagePath = File(_image.path);
                      context
                          .read<CollectionsBuilderCubit>()
                          .uploadCollectionImage(file: _imagePath);
                    }
                  },
                  child: Container(
                    height: 235,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Container(
                        width: height * 0.11,
                        height: height * 0.11,
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.5,
                            color: AppColors.textColor.withOpacity(0.8),
                          ),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.Camera,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],

        );
      },
    );
  }
}
