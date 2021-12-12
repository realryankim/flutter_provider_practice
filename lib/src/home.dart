import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/src/provider/bottom_navigation_provider.dart';
import 'package:sample_provider/src/provider/count_provider.dart';
import 'package:sample_provider/src/ui/count_home_widget.dart';
import 'package:sample_provider/src/ui/movie_list_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  late BottomNavigationProvider _bottomNavigationProvider;

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentPage) {
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return MovieListWidget();
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie"),
      ],
      currentIndex: _bottomNavigationProvider.currentPage,
      selectedItemColor: Colors.red,
      onTap: (index) {
        // provider navigation state
        _bottomNavigationProvider.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Provider 부르기
    // listen을 언제 써야되는 지는 많이 써보면서 알아가기
    // listen: false를 주면, 업데이트가 일어나지않도록 한다.
    // listen이 false면 Consumer를 사용해서 Provider 변수를 변경해줘야한다.
    // listen을 따로 안주면, Consumer를 사용하지않아도 된다.
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
