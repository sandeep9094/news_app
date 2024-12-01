part of 'home_screen.dart';

abstract class HomeController extends State<HomeScreen> {

  bool isLoading = true;
  final _viewModel = HomeViewModel();
  List<TopHeadlineArticles> topHeadlines = [];

  @override
  void initState() {
    super.initState();
    
    initObservers();
    
    _viewModel.getTopHeadlines();
  }

  @override
  void dispose() {
    _viewModel.closeStreams();
    super.dispose();
  }
  
  initObservers() {
    _viewModel.headlineStream.stream.listen((result){
      if(result.status == ApiResultStatus.loading) {
        logger.d("Headlines Result loading------");
        setState(() {
          isLoading = true;
        });
      } else if(result.status == ApiResultStatus.error) {
        setState(() {
          isLoading = false;
        });
        context.showErrorFlushBar(result.errorMessage);
        logger.d("Headlines Result error: ${result.errorMessage}");
      } else if(result.status == ApiResultStatus.success) {
        final headlines = result.data?.articles ?? [];
        logger.d("Headlines Result list : ${headlines.length}");
        setState(() {
          isLoading = false;
          topHeadlines.addAll(headlines);
        });
      }

    });
  }
}