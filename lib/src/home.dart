import 'package:flutter/material.dart';
import 'package:flutter_provider/src/provider/bottom_navigation_provider.dart';
import 'package:flutter_provider/src/ui/count_home_widget.dart';
import 'package:flutter_provider/src/ui/movie_list_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  late BottomNavigationProvider _bottomNavigationProvider;

  @override
  Widget build(BuildContext context) {
    // provider 불러들이는 방법 Provider.of<>(context);
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentPage) {
      case 0:
        return CountHomeWidget();
      case 1:
        return MovieListWidget();
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      currentIndex: _bottomNavigationProvider.currentPage,
      selectedItemColor: Colors.red,
      onTap: (index) {
        // provider navigation state;
        _bottomNavigationProvider.updateCurrentPage(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: "movie",
        ),
      ],
    );
  }
}


