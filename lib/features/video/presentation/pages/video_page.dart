import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/web_view_bloc.dart';
import '../widgets/navigation_app_bar.dart';


class VideoPage extends StatelessWidget {
  const VideoPage({super.key});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<WebViewBloc>().add(GoBack());
        return false;
      },
      child: Scaffold(
        body: Stack(
            children: [
              BlocBuilder<WebViewBloc, WebViewState>(
                builder: (context, state) {
                  if(state is WebViewCreated || state is WebViewReady){
                    return InAppWebView(
                      initialUrlRequest: URLRequest(url: Uri.parse(state.url)),
                      onWebViewCreated: (controller) => context.read<WebViewBloc>().add(CreateWebViewController(controller: controller)),
                      onTitleChanged: (controller, title)  => context.read<WebViewBloc>().add(ChangeTitle(title: title)),
                      onProgressChanged: (controller, progress) => context.read<WebViewBloc>().add(ChangeProgress(progress: progress)),
                      shouldOverrideUrlLoading: (controller,
                          navigationAction) async {
                        final url = navigationAction.request.url;
                        if (navigationAction.isForMainFrame &&
                            url != null &&
                            ![
                              'http',
                              'https',
                              'file',
                              'chrome',
                              'data',
                              'javascript',
                              'about'
                            ].contains(url.scheme)) {
                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                            return NavigationActionPolicy.CANCEL;
                          }
                        }
                        return NavigationActionPolicy.ALLOW;
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator.adaptive());
                },
              ),
              const NavigationAppBar()
            ]
        ),
      ),
    );
  }

}