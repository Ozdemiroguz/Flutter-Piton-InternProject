import 'package:defaultproject/models/models.dart';

Future<List<TrendingPage>> fetchTrendingPages() async {
  // Simüle edilmiş asenkron bir operasyon (örneğin, bir API'den veri çekme)
  await Future.delayed(Duration(seconds: 2));

  // Simüle edilmiş veri

  TrendingPage trendingPage1 = TrendingPage(
    title: 'The missing 96 percent of the universe',
    name: 'Claire Malone',
    image: 'assets1.png',
    backIamge: "",
    backColor: "0xFFB548C6",
  );
  TrendingPage trendingPage2 = TrendingPage(
    title: 'How Dolly Parton led me to an epiphany',
    name: 'Abumenyang',
    image: 'assets2.png',
    backIamge: 'backImage2.jpg',
    backColor: "0xFF32A7E2",
  );
  TrendingPage trendingPage3 = TrendingPage(
    title: 'The missing 96 percent of the universe',
    name: 'Tir McDohl',
    image: 'assets3.png',
    backIamge: "",
    backColor: "0xFFEC663C",
  );
  TrendingPage trendingPage4 = TrendingPage(
    title: 'Ngobam with Denny Caknan',
    name: 'Denny Kulon',
    image: 'assets4.png',
    backIamge: "",
    backColor: "0xFFFFBF47",
  );
  List<TrendingPage> datas = [
    trendingPage1,
    trendingPage2,
    trendingPage3,
    trendingPage4,
  ];

  // Veriyi çekip TrendingPage nesnelerini oluştur

  return datas;
}
