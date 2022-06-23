import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theta_x_multi_bloc/blocs/video_settings/video_settings_bloc.dart';

class VideoSettingsScreen extends StatelessWidget {
  const VideoSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoSettingsBloc, VideoSettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: Text('Video Settings'),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Frame Format',
                  style: TextStyle(fontSize: 30, fontFamily: 'LemonMilk'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<VideoSettingsBloc>()
                            .add(Video8K2FPSEvent());
                      },
                      child: Text(
                        '8K 2FPS',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<VideoSettingsBloc>()
                            .add(Video8K10FPSEvent());
                      },
                      child: Text(
                        '8K 10FPS',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<VideoSettingsBloc>()
                            .add(Video4K30FPSEvent());
                      },
                      child: Text(
                        '4K 30FPS',
                      ),
                    ),
                  ],
                ),
                Text(
                  'Bit Rate',
                  style: TextStyle(fontSize: 30, fontFamily: 'LemonMilk'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<VideoSettingsBloc>()
                            .add(FineBitRateEvent());
                      },
                      child: Text(
                        'Fine',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<VideoSettingsBloc>()
                            .add(NormalBitRateEvent());
                      },
                      child: Text(
                        'Normal',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<VideoSettingsBloc>()
                            .add(EconomyBitRateEvent());
                      },
                      child: Text(
                        'Economy',
                      ),
                    ),
                  ],
                ),
                Text(
                  'Video Stitching',
                  style: TextStyle(fontSize: 30, fontFamily: 'LemonMilk'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<VideoSettingsBloc>()
                            .add(VideoStitchingOnEvent());
                      },
                      child: Text(
                        'On',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<VideoSettingsBloc>()
                            .add(VideoStitchingOffEvent());
                      },
                      child: Text(
                        'Off',
                      ),
                    ),
                  ],
                )
              ]),
        );
      },
    );
  }
}
