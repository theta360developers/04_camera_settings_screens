# THETA X Multi Bloc

![animated gif](docs/images/videoscreen.gif)

This is a test of using multiple Blocs in a RICOH THETA application. This simple app will show multiple screens with one Bloc attached to each screen. 

## Multiple Blocs

```dart
return MultiBlocProvider(
      providers: [
          BlocProvider<ImageSettingsBloc>(
            create: (context) => ImageSettingsBloc()),
        BlocProvider<CameraUseBloc>(create: (context) => CameraUseBloc()),
        BlocProvider<VideoSettingsBloc>(
            create: (context) => VideoSettingsBloc())
      ],
      child: MaterialApp())
```

In this application, each screen has its own Bloc to make the State more manageable. In the `main.dart` file, I used the `MultiBlocProvider` instead of the `BlocProvider` to list out all the Blocs. This enables me to use multiple Blocs throughout the application.

```dart
return BlocBuilder<VideoSettingsBloc, VideoSettingsState>(
      builder: (context, state) {
        return Scaffold(),
        })
```

For example, in the Video Settings Screen, the `Scaffold` is wrapped with a `BlocBuilder` that uses the `VideoSettingsBloc`. Each screen has its own specific Bloc. 

With the use of Bloc, it's fairly straightforward to create multiple buttons on a screen. 

<img src="docs/images/imagebutton.png" width=50%>

## Ternary Operator

To switch the recording button into a square, I utilized the ternary operator from Dart. The ternary operator first checks if `isRecording` is false and sets the button to a circular button. Else, when `isRecording` is true, the button is set to a square button. 

```mermaid
  graph TD;
      A[!isRecording] -- true -->B[Circular Button];
      A[!isRecording] -- false -->C[Square Button];
     
```

```dart
!state.isRecording
                ? IconButton(
                    //circular shape
                    onPressed: () {
                      context.read<CameraUseBloc>().add(StartCaptureEvent());
                    },
                    iconSize: 200,
                    )
                : IconButton(
                    //square shape
                    onPressed: () {
                      context.read<CameraUseBloc>().add(StopCaptureEvent());
                    },)
```

In the `CameraUseBloc`, I set the variable `isRecording` to true when `StartCaptureEvent` is called and false when `StopCaptureEvent` is called. By changing the state of `isRecording`, the button will change its shape. 

## Chopper

[Chopper](https://pub.dev/packages/chopper) is a Flutter package that generates http requests and helps organize the code.

### How to Use

1. Download Chopper package and create a new file (ex: `theta_service.dart`)
2. Import the Chopper package into this file and use the `@ChopperApi` annotation above the class declaration. The `@ChopperApi` has the parameter `baseUrl` which is the url for the THETA camera.

```dart 
@ChopperApi(baseUrl: 'http://192.168.1.1/osc')
abstract class ThetaService extends ChopperService {}
```

3. Use the `@Post` request and pass in the `path` and `headers`. The `path` and `headers` are from the [THETA API](https://api.ricoh/docs/theta-web-api-v2.1/getting_started/). Also, define the method `command`. This method will be used to pass in the name of the camera commands. 

```dart
  @Post(
      path: '/commands/execute',
      headers: {'Content-Type': 'application/json;charset=utf-8'})
  Future<Response> command(@Body() Map<String, dynamic> body);
```

4. Lastly, run `flutter pub run build_runner build`.

Inside of a Bloc file, we have to define chopper and create the `ChopperClient`.

```dart 
var chopper = ChopperClient(
        services: [ThetaService.create()], converter: const JsonConverter());
    final thetaService = chopper.getService<ThetaService>();
```

Now, we are ready to use Chopper inside of the Bloc! Here is an example of using Chopper to run a command for image stitching. The code inside of the Bloc is condensed using Chopper. All we have to run is the `command` method which cuts down on the repetition. Chopper runs the POST request for us.

```dart
 on<ImageStitchingAutoEvent>((event, emit) async {
      var response = await thetaService.command({
        'name': 'camera.setOptions',
        'parameters': {
          'options': {'_imageStitching': 'auto'}
        }
      });
      emit(ImageSettingsState(response: response.body));
    });
````