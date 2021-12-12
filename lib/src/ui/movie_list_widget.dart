import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/src/model/movie.dart';
import 'package:sample_provider/src/provider/movie_provider.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key}) : super(key: key);

  late MovieProvider _movieProvider;

  Widget _makeMovieOne(Movie movie) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(movie.posterUrl)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  movie.title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Text(
                    movie.overview!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                    style: const TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      movie.voteAverageString,
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    Text(
                      movie.voteCountString,
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _makeListView(List<Movie>? movies) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: _makeMovieOne(movies![index]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemCount: movies!.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    // listen이 false가 아니면 무한 루프에 빠질 수 있음
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Provider'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.movies != null && provider.movies!.isNotEmpty) {
            return _makeListView(provider.movies);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
