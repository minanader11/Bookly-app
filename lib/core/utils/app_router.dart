import 'package:books_app/core/utils/setup_service_locator.dart';
import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:books_app/features/home/data/repos/home_repo_impl.dart';
import 'package:books_app/features/home/presentaion/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:books_app/features/home/presentaion/view/book_details_view.dart';
import 'package:books_app/features/home/presentaion/view/home_view.dart';
import 'package:books_app/features/search/presentation/manger/search_book_cubit/search_book_cubit.dart';
import 'package:books_app/features/search/presentation/views/search_view.dart';
import 'package:books_app/features/search/repos/search_repo_impl.dart';
import 'package:books_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSearchView = '/searchView';
  static const kBookDetailsView = '/bookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
            create: (context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
            child:  SearchView()),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      )
    ],
  );
}
