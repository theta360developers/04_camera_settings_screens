import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/image_settings/image_settings_bloc.dart';

class ImageSettingsScreen extends StatelessWidget {
  const ImageSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageSettingsBloc, ImageSettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: Text(
              "Image Settings",
            ),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Image Stitching',
                  style: TextStyle(fontSize: 30, fontFamily: 'LemonMilk'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImageSettingsBloc>()
                            .add(ImageStitchingAutoEvent());
                      },
                      child: Text('Auto'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImageSettingsBloc>()
                            .add(ImageStitchingNoneEvent());
                      },
                      child: Text('None'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImageSettingsBloc>()
                            .add(ImageStitchingStaticEvent());
                      },
                      child: Text('Static'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImageSettingsBloc>()
                            .add(ImageStitchingDynamicEvent());
                      },
                      child: Text('Dynamic'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImageSettingsBloc>()
                            .add(ImageStitchingDynamicSemiAutoEvent());
                      },
                      child: Text('DynamicSemiAuto'),
                    ),
                  ],
                ),
                Text(
                  'Top Bottom Correction',
                  style: TextStyle(fontSize: 30, fontFamily: 'LemonMilk'),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImageSettingsBloc>()
                            .add(TopBottomCorrectionEvent());
                      },
                      child: Text('Apply'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImageSettingsBloc>()
                            .add(TopBottomDisapplyEvent());
                      },
                      child: Text('Disapply'),
                    ),
                  ],
                ),
                Text(
                  'Exposure',
                  style: TextStyle(fontSize: 30, fontFamily: 'LemonMilk'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImageSettingsBloc>()
                            .add(ExposureMinus2Event());
                      },
                      child: Text('-2.0'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImageSettingsBloc>()
                            .add(ExposureMinus1Event());
                      },
                      child: Text('-1.0'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ImageSettingsBloc>().add(Exposure0Event());
                      },
                      child: Text('0.0'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ImageSettingsBloc>().add(Exposure1Event());
                      },
                      child: Text('1.0'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ImageSettingsBloc>().add(Exposure2Event());
                      },
                      child: Text('2.0'),
                    ),
                  ],
                ),
                Text(
                  'Filter',
                  style: TextStyle(fontSize: 30, fontFamily: 'LemonMilk'),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<ImageSettingsBloc>()
                              .add(FilterHDREvent());
                        },
                        child: Text('HDR'),
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 2, color: Colors.blue),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            context
                                .read<ImageSettingsBloc>()
                                .add(FilterOffEvent());
                          },
                          child: Text(
                            'Off',
                          ))
                    ]),
              ]),
        );
      },
    );
  }
}
