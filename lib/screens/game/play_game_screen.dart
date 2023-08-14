import 'package:cocoon_kids_flutter/bloc/game_cubit.dart';
import 'package:cocoon_kids_flutter/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlayGameScreen extends StatefulWidget {
  final int gameId;

  PlayGameScreen(this.gameId, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _PlayGameState();
  }
}

class _PlayGameState extends State<PlayGameScreen> {
  WebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.yellowLight,
        body: BlocProvider(
            create: (_) => GameCubit(widget.gameId),
            child: BlocBuilder<GameCubit, GameState>(
                builder: (context, state) {
                  if (state is GameLoadedState) {
                    webViewController ??= WebViewController.fromPlatformCreationParams(const PlatformWebViewControllerCreationParams())
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..setBackgroundColor(const Color(0x00000000))
                        ..setNavigationDelegate(
                          NavigationDelegate(
                            onProgress: (int progress) {
                              // Update loading bar.
                            },
                            onPageStarted: (String url) {},
                            onPageFinished: (String url) {},
                            onWebResourceError: (WebResourceError error) {},
                          ),
                        )
                        ..loadRequest(Uri.parse(state.url));
                    return WebViewWidget(controller: webViewController!);
                  } else {
                    return const CircularProgressIndicator();
                  }
                }
            )
        )
    );
  }
}