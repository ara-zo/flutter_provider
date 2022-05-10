import 'package:flutter/material.dart';
import 'package:flutter_provider/src/models/movie.dart';
import 'package:flutter_provider/src/provider/movie_provider.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key}) : super(key: key);
  late MovieProvider _movieProvider;

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();
    // context.read<MovieProvider>().~   Provider.of<MovieProvider>(context, listen: false);
    // context.watch<MovieProvider>().~   Provider.of<MovieProvider>(context);

    return ChangeNotifierProvider(
      create: (BuildContext context) => MovieProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movie Provider"),
        ),
        body: Consumer<MovieProvider>(
          builder: (context, value, child) {
            if (value.movies.isNotEmpty) {
              return makeListView(value.movies);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget makeListView(List<Movie> movies) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  )
                ],
                color: Colors.white,
              ),
              child: _makeMovieOne(movies[index]),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: movies.length);
  }

  Widget _makeMovieOne(Movie movie) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Image.network("https://image.tmdb.org/t/p/w500${movie.posterPath}")),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                movie.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Gap(10),
              Expanded(
                child: Text(
                  movie.overview,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 8,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
