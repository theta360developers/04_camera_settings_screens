import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/camera_use/camera_use_bloc.dart';

class VideoButton extends StatelessWidget {
  const VideoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              context.read<CameraUseBloc>().add(VideoModeEvent());
            },
            iconSize: 40,
            icon: Icon(color: Colors.black54, Icons.video_camera_front))
      ],
    );
  }
}
