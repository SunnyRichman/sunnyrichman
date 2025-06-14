import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sunnyrichman/models/irproject_model.dart';
import 'package:url_launcher/url_launcher.dart';

const Color oceanGreen = Color.fromARGB(255, 0, 108, 108);
const Color cream = Color.fromARGB(255, 255, 255, 201);

int _selectedIndex = 1;
int? _tappedIndex;

List<IrprojectGallery> gallery = IrprojectGallery.getGallery();
List<IrprojectTools> tools = IrprojectTools.getTools();

class IRprojectPage extends StatefulWidget{

  const IRprojectPage({super.key});

  @override
  State<IRprojectPage> createState() => _IRprojectPageState();
}

class _IRprojectPageState extends State<IRprojectPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: Scaffold(
        appBar: AppBar(title: FittedBox(child: (Text('Xiang Cao Project Exhibition', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: cream)))), centerTitle: true, backgroundColor: oceanGreen,),
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
                              left: 0,
                              bottom: 0,
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
                          children: List.generate(2, (index) {
                            // URLs and labels
                            final List<String> labels = [
                              'Assistant Professor Dr. Charnyote Pluempitiwiriyawej',
                              'Associate Professor Dr. Suppawong Tuarob'
                            ];
                            final List<String> urls = [
                              'https://www.ict.mahidol.ac.th/th/people/computer-science-academic-group/charnyote_pluempitiwiriyawej/',
                              'https://www.ict.mahidol.ac.th/th/people/computer-science-academic-group/suppawong_tuarob/'
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
                      heading(context, 'Crews'),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bulletPoint('Mr. Raweerot Bhasidhchirapiroch (Co-worker, Full-stack developer, Data cleaner, Report)'),
                            SizedBox(height: 10),
                            bulletPoint('Mr. Ziyan Cheng (Data cleaner, Report)'),
                            SizedBox(height: 10),
                            bulletPoint('Mr. Napat Cholkuljana (Data cleaner, Report)'),
                          ],
                        )
                      ),
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
                            bulletPoint('A web search engine dedicated to Chinese herbs and their properties'),
                            SizedBox(height: 10),
                            bulletPoint('Helping individuals use herbs efficiently and properly by offering detailed insights into their properties, uses, and names.'),
                            SizedBox(height: 10),
                            bulletPoint('Leveraging the power of Kibana and Elasticsearch to ensure the fast and accurate search results through its robust search and analytics engine'),
                          ],
                        )
                      ),
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
                      heading(context, 'Existing Relevant Systems'),
                     Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bulletPoint('MeandQi.com'),
                            SizedBox(height: 10),
                            bulletPoint('The Chinese Medicine Database (CMDB)'),
                          ],
                        )
                      ),
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
                      heading(context, 'Tools'),
                      Container(
                        padding: const EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        height: 120, // Add a fixed height to contain horizontal ListView
                        child: ListView.separated(
                          itemCount: tools.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(6),
                              width: 100,
                              decoration: BoxDecoration(
                                color: oceanGreen,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: cream,
                                    radius: 24,
                                    child: SvgPicture.asset(tools[index].iconpath, color: oceanGreen),
                                  ),
                                  Text(tools[index].label, textAlign: TextAlign.center, style: TextStyle(color: cream, fontWeight: FontWeight.w700)
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(width: 10),
                        ),
                      ),
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
                      heading(context, 'Limitation'),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bulletPoint('The current database lacks a variety of herbs, limiting the scope of information available.'),
                            SizedBox(height: 10),
                            bulletPoint('Searching with common words often returns all herbs, making it difficult to find specific results.'),
                            SizedBox(height: 10),
                            bulletPoint('The user interface could benefit from further improvements to enhance usability and aesthetics.'),
                          ],
                        )
                      ),
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
                      heading(context, 'Technical difficulties and challenges'),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bulletPoint('Implementing Kibana and Elasticsearch took considerable time due to their complexity.'),
                            SizedBox(height: 10),
                            bulletPoint('Data cleaning was a time-consuming process, necessary to ensure the accuracy and relevance of the information.'),
                            SizedBox(height: 10),
                            bulletPoint('Managing large datasets efficiently to prevent lag and ensure smooth operation.'),
                            SizedBox(height: 10),
                            bulletPoint('Integrating diverse sources of herbal information without causing data discrepancies.')
                          ],
                        )
                      ),
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
                      heading(context, 'Lesson Learned'),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bulletPoint('We learned how to effectively use Kibana and Elasticsearch to create a responsive and efficient search engine.'),
                            SizedBox(height: 10),
                            bulletPoint('Data cleaning was a time-consuming process, necessary to ensure the accuracy and relevance of the information.'),
                            SizedBox(height: 10),
                            bulletPoint('Managing large datasets efficiently to prevent lag and ensure smooth operation.'),
                            SizedBox(height: 10),
                            bulletPoint('Integrating diverse sources of herbal information without causing data discrepancies.')
                          ],
                        )
                      ),
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
                      heading(context, 'Opportunities for future improvements'),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bulletPoint('Redesigning the user interface to make it more user-friendly and visually appealing.'),
                            SizedBox(height: 10),
                            bulletPoint('Adding a wider variety of herbs to provide more comprehensive information.'),
                            SizedBox(height: 10),
                            bulletPoint('Improving search algorithms to better handle common terms and deliver more precise results.'),
                            SizedBox(height: 10),
                            bulletPoint('Incorporating additional reliable sources for a more extensive and enriched herb database.')
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
        _onItemTapped(1);
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