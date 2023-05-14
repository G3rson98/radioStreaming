import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/theme/colors.dart';
import '../bloc/web_view_bloc.dart';

class NavigationAppBar extends StatelessWidget {
  const NavigationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebViewBloc, WebViewState>(
      builder: (context, state) {
        if(state is WebViewReady){
          return Column(
            children: [
              Container(
                color: CustomColors.licorice,
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: (state.canGoBack) ? () => context.read<WebViewBloc>().add(GoBack()) : null
                    ),
                    Flexible(
                      child: Text(
                        state.pageName,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    FutureBuilder<bool>(
                      future: state.webController.canGoForward(),
                      builder: (context, snapshot) {
                        final canGoForward = snapshot.hasData ? snapshot.data! : false;
                        return IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: !canGoForward
                              ? null
                              : () {
                            state.webController.goForward();
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
              if(state.isLoading)
                LinearProgressIndicator(value: state.progress,color: CustomColors.prussianBlue,)
            ],
          );

        }

        return const SizedBox();
      },
    );
  }
}
