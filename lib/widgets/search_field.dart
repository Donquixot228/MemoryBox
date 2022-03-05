import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/cubits/audio_builder_cubit/audio_file_builder_cubit.dart';
import 'package:memorybox2/cubits/audio_builder_cubit/audio_file_builder_cubit.dart';
import 'package:memorybox2/resources/resources.dart';

class searchField extends StatelessWidget {
  const searchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioFileBuilder, AudioFileBuilderState>(
      builder: (context, state) {
        return Positioned(
          top: 155,
          left: 20,
          right: 20,
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(30),
            child: TextField(
              onChanged: (searchKey) {
                context.read<AudioFileBuilder>().searchAudio(searchKey);
              },
              showCursor: false,
              enableInteractiveSelection: true,
              obscureText: false,
              style: TextStyle(
                fontFamily: 'TTNorms_Regular',
                fontSize: 20,
                color: Color(0xFF3A3A55),
              ),
              decoration: InputDecoration(
                hintText: 'Поиск',
                hintStyle: TextStyle(
                  color: Colors.black45,
                ),

                suffixIcon: IconButton(
                  icon: SvgPicture.asset(AppIcons.Search),
                  onPressed: () {},
                  padding: EdgeInsets.only(right: 15,),
                ),
                filled: true,
                fillColor: AppColors.whiteColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      color: Colors.grey,
                      width: 5,
                      style: BorderStyle.none),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      color: Colors.grey,
                      width: 5,
                      style: BorderStyle.none),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
