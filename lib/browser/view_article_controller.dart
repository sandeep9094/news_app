part of 'view_article_screen.dart';

abstract class ViewArticleController extends State<ViewArticleScreen> {

  late final WebViewController _controller;
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    initWebview();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initWebview() {
    late final PlatformWebViewControllerCreationParams params;
    params = const PlatformWebViewControllerCreationParams();
    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            setState(() {
              isLoading = false;
            });
          },
          onHttpError: (HttpResponseError error) {
            context.showErrorFlushBar("Content not available!");
          }
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

}