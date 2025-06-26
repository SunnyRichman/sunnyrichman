import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sunnyrichman/models/ecartproject_model.dart';
import 'package:url_launcher/url_launcher.dart';

const Color oceanGreen = Color.fromARGB(255, 0, 108, 108);
const Color cream = Color.fromARGB(255, 255, 255, 201);

int _selectedIndex = 3;
int? _tappedIndex;

List<EcartprojectGallery> gallery = EcartprojectGallery.getGallery();

class EcartprojectPage extends StatefulWidget{

  const EcartprojectPage({super.key});

  @override
  State<EcartprojectPage> createState() => _EcartprojectPageState();
}

class _EcartprojectPageState extends State<EcartprojectPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: Scaffold(
        appBar: AppBar(title: (Text('FESTA Project Exhibition',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: cream))), centerTitle: true, backgroundColor: oceanGreen),
        drawer: newDrawer(),
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: EdgeInsets.all(20),
          color: cream,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Gallery', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: oceanGreen))),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: oceanGreen),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: CarouselSlider(
                    items: gallery.map((item) => Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    child: Center(
                      child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2, color: oceanGreen),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: ClipRRect(borderRadius: BorderRadius.circular(10), 
                                child: Image.asset(item.imgpath)
                              ),
                            ),
                            Positioned(
                              left: 0, bottom: 0,
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    Color.fromARGB(0, 0, 108, 108),
                                    Color.fromARGB(127, 0, 108, 108),
                                    oceanGreen,
                                  ],
                                ),
                                ),
                                child: Text(item.label, style: TextStyle(color: cream, fontWeight: FontWeight.w700, fontSize: 18))
                              )
                            ), 
                          ]
                        ),
                    )
                    )).toList(),
                    options: CarouselOptions(
                      height: (MediaQuery.sizeOf(context).height)*0.2,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    )
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: oceanGreen, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      heading(context, 'Project Advisor'),
                      Container(
                        padding: const EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(1, (index) {
                            // URLs and labels
                            final List<String> labels = [
                              'Assistant Professor Dr. Ananta Srisuphab'
                            ];
                            final List<String> urls = [
                              'https://www.ict.mahidol.ac.th/th/people/computer-science-academic-group/ananta_srisuphab/',
                            ];

                            final isTapped = _tappedIndex == index;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  const Icon(Icons.circle, size: 10, color: oceanGreen),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() => _tappedIndex = index);

                                      await Future.delayed(const Duration(milliseconds: 200));

                                      setState(() => _tappedIndex = null);

                                      openUrl(urls[index]);
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width * 0.75,
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2, color: isTapped ? cream : oceanGreen),
                                        borderRadius: BorderRadius.circular(12),
                                        color: isTapped ? cream : oceanGreen,
                                      ),
                                      child: Text(
                                        labels[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: isTapped ? oceanGreen : cream,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: oceanGreen, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      heading(context, 'About This Project'),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bulletPoint('The platform that sells the cassette tape and vinyl disc from many artists of Thailand or Foreign artists.'),
                            SizedBox(height: 10),
                            bulletPoint('Interface is based on some websites on the internet, but we improve the appearance of ours to be attractive and easy to use for both customers and admin to manage the webpage'),
                            SizedBox(height: 10),
                            bulletPoint('The information for each album will be based on reliable sources such as Musicstax or Spotify'),
                          ],
                        )
                      ),
                    ],
                  )
                ),
              ]
            ),
          ),
        ),
      )
    );
  }

  Row bulletPoint(String msg) {
    return Row(children: [Icon(Icons.circle, size: 10, color: oceanGreen,),SizedBox(width: 10),Expanded(child: Text(msg, style: TextStyle(fontWeight: FontWeight.w500, color: oceanGreen)))]);
  }

  Container heading(BuildContext context, String heading) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.all(6),
      width: MediaQuery.sizeOf(context).width,
      color: oceanGreen,
      child: Text(heading, style: TextStyle(fontWeight: FontWeight.w700, color: cream)),
    );
  }

  Drawer newDrawer() {
    return Drawer(
      backgroundColor: oceanGreen,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(decoration: BoxDecoration(color: oceanGreen),
            child: Text('Menu'),
          ),
          buildDrawerItem(title: 'About me', index: 0, path: '/'),
          buildDrawerItem(title: 'Xiang Cao Project', index: 1, path: '/ir_project'),
          buildDrawerItem(title: 'FESTA Project', index: 2, path: '/web_project'),
          buildDrawerItem(title: 'E-cart Commerce System Project', index: 3, path: '/ecart_project'),
        ],
      ),
    );
  }

  Widget buildDrawerItem({required String title, required int index, required String path}) {
    final bool isSelected = _selectedIndex == index;

    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w700, color: isSelected ? oceanGreen : cream)),
      tileColor: isSelected ? cream : oceanGreen,
      onTap: () {
        _onItemTapped(index);
        context.go(path);
        _onItemTapped(3);
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
  }  
}