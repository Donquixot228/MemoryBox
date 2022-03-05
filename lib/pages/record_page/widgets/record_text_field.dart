import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorybox2/blocs/recording_bloc/recording_bloc.dart';

class RecordingTextField extends StatelessWidget {
  RecordingTextField({required this.showLine});

  TextInputType keyboardType = TextInputType.name;
  bool showLine = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordingBloc, RecordingState>(
      builder: (context, state) {
        return TextField(
          cursorColor: Colors.black45,
          textAlign: TextAlign.center,
          enabled: true,
          keyboardType: keyboardType,
          style: Theme.of(context).textTheme.headline5,
          onChanged: (name) {
            context.read<RecordingBloc>().add(ChangingNameFile(name));
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: state.fileName,
            hintStyle: Theme.of(context).textTheme.headline5,
            contentPadding: const EdgeInsets.only(top: 10),
            focusedBorder: showLine
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0x803A3A55)))
                : null,
            enabledBorder: showLine
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0x803A3A55)))
                : null,
          ),
        );
      },
    );
  }
}
