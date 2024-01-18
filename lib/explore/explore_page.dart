import 'package:defaultproject/explore/explore_page_widget.dart';
import 'package:defaultproject/models/models.dart';
import 'package:defaultproject/now_playing/now_playing_page.dart';
import 'package:defaultproject/styles/styles.dart';
import 'package:defaultproject/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:defaultproject/services/services.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  List<TrendingPage>? veriler;

  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchTrendingPages();
  }

  _fetchTrendingPages() async {
    List<TrendingPage>? _veriler = await fetchTrendingPages();
    print(_veriler[0].name);

    if (_veriler != null) {
      setState(() {
        veriler = _veriler;
      });
    } else {
      print("Veriler boş geldi");
    }
  }

  int _length = 4;
  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.getScreenWidthPercentage(context, 1);
    double screenHeight = ScreenUtil.getScreenHeightPercentage(context, 1);
    TextEditingController tfController;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: screenHeight * 0.09,
          backgroundColor: Colors.transparent,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: GestureDetector(
                  onTap: () {
                    // Image'a tıklandığında gerçekleşecek işlemler
                    print("Leading Image Tıklandı!");
                    // İşlevinizi buraya ekleyin
                  },
                  child: Image.asset(
                    'assets/grop1003.png',
                    width: 22,
                    height: 12,
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            'Podkes',
            style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 21,
                    ),
                    onPressed: () {
                      // Bildirim düğmesine basıldığında gerçekleşecek işlemler
                    },
                  ),
                  Positioned(
                    top: 12,
                    right: 14,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 6,
                        minHeight: 6,
                      ),
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 90,
          child: BottomNavigationBar(
            selectedItemColor: Color(0xFFFFFFFF),
            unselectedItemColor: Color(0xFF979797),
            backgroundColor: Color(0xFF252836),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_add_check),
                label: 'Library',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Center(
            child: Column(children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: 20, top: 16, bottom: 16, right: 170),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      IconlyLight.search,
                      size: 20,
                      color: Color(0xFFFFFFFF),
                    ),
                  ), // Sol tarafta arama ikonu
                  labelText: 'Search',
                  fillColor: Color(0xFF252836), // Arka plan rengini ayarlar
                  filled: true,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    letterSpacing: 0.5,
                    fontFamily: 'Inter',
                    height: 2.1,
                    color: Color(0xFFFFFFFF),
                  ),
                  // Sol tarafta 'Search' yazısı
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildFilterChip("All"),
                        _buildFilterChip("Life"),
                        _buildFilterChip("Commedy"),
                        _buildFilterChip("Tech"),
                        // Diğer filtre seçeneklerinizi buraya ekleyebilirsiniz.
                      ],
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
              veriler == null
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: GridView.builder(
                        itemCount: veriler?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,
                            childAspectRatio: 160 / 225),
                        itemBuilder: (BuildContext context, int index) {
                          return trendingPage(veriler![index], context);
                        },
                      ),
                    )
            ]),
          ),
        ));
  }
}

Widget _buildFilterChip(String text) {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Color(0xFF2F3142),
          borderRadius: BorderRadius.circular(36),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Center(
            child: Text(
              text,
              style: myTextStyle,
            ),
          ),
        )),
  );
}
