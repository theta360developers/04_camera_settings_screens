import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/camera_use/camera_use_bloc.dart';

class RecordingButton extends StatelessWidget {
  const RecordingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraUseBloc, CameraUseState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !state.isRecording
                ? IconButton(
                    onPressed: () {
                      context.read<CameraUseBloc>().add(StartCaptureEvent());
                    },
                    iconSize: 200,
                    icon: Icon(
                      Icons.circle_outlined,
                      color: Color.fromARGB(255, 240, 114, 105),
                    ))
                : IconButton(
                    onPressed: () {
                      context.read<CameraUseBloc>().add(StopCaptureEvent());
                    },
                    iconSize: 200,
                    icon: Icon(
                      Icons.square_rounded,
                      color: Color.fromARGB(255, 240, 114, 105),
                    ))
          ],
        );
      },
    );
  }
}
