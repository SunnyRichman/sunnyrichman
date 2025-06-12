import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';
import 'package:sunnyrichman/models/expertises_model.dart';
import 'package:sunnyrichman/models/contacts_model.dart';


const Color oceanGreen = Color.fromARGB(255, 0, 108, 108);
const Color cream = Color.fromARGB(255, 255, 255, 201);

List<ExpertiseModel> expertiseModel = ExpertiseModel.getExpertise();
List<ContactsModel> contactModel = ContactsModel.getContacts();

int? tappedIndex;

int _selectedIndex = 0;

class AboutmePage extends StatefulWidget{

  const AboutmePage ({super.key});

  @override
  State<AboutmePage> createState() => _AboutmePageState();
}

class _AboutmePageState extends State<AboutmePage> {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: Scaffold(
        appBar: AppBar(title: (Text('About me', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: cream))), centerTitle: true, backgroundColor: oceanGreen),
        drawer: newDrawer(),
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: cream,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,      
              children: [
                Text('Raweerot Bhasidhchirapiroch', style: TextStyle(fontWeight: FontWeight.w700, color: oceanGreen, fontSize: 24),),
                SizedBox(height: 20),
                CircleAvatar(backgroundImage: AssetImage('assets/profile.jpg'),radius: MediaQuery.sizeOf(context).width*0.25),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: oceanGreen, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      heading(context, 'About me'),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Text('I am the senior student who are ready and desire to learn new things to improve myself all time. ', style: TextStyle(fontWeight: FontWeight.w500, color: oceanGreen),)
                      ),
                    ],
                  )
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: oceanGreen, width: 2), borderRadius: BorderRadius.circular(12)),
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      heading(context, 'Education'),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: (MediaQuery.sizeOf(context).width*0.75)/2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.school, color: oceanGreen),
                                      Text('Mahidol University', textAlign: TextAlign.center, style: TextStyle(color: oceanGreen, fontWeight: FontWeight.w700)),
                                      Text('(2022 - Present)', textAlign: TextAlign.center, style: TextStyle(color: oceanGreen, fontWeight: FontWeight.w700))
                                    ]
                                  ),
                                ),
                                Container(
                                  width: (MediaQuery.sizeOf(context).width*0.75)/2,
                                  child: educationDetail('Stydying', '3.15', 'Software Engineering'),
                                ),  
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: (MediaQuery.sizeOf(context).width*0.75)/2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.school, color: oceanGreen),
                                      Text('Sukhondheerawidh School', textAlign: TextAlign.center, style: TextStyle(color: oceanGreen, fontWeight: FontWeight.w700)),
                                      Text('(2019 - 2021)', textAlign: TextAlign.center, style: TextStyle(color: oceanGreen, fontWeight: FontWeight.w700))
                                    ]
                                  ),
                                ),
                                Container(
                                  width: (MediaQuery.sizeOf(context).width*0.75)/2,
                                  child: educationDetail('Graduated', '3.77', 'Math-Science')
                                ),  
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]
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
                      heading(context, 'Language'),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          children: [
                            Row(children: [Icon(Icons.arrow_forward_ios, size: 12, color: oceanGreen), Text(' Thai:',style: TextStyle(fontWeight: FontWeight.w700, color: oceanGreen)), Text('\tNative',style: TextStyle(fontWeight: FontWeight.w500, color: oceanGreen))]),
                            Row(children: [Icon(Icons.arrow_forward_ios, size: 12, color: oceanGreen), Text(' English:',style: TextStyle(fontWeight: FontWeight.w700, color: oceanGreen)), Text('\tB2',style: TextStyle(fontWeight: FontWeight.w500, color: oceanGreen))])
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
                      heading(context, 'Expertise'),
                      Container(
                        padding: const EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        height: 120, // Add a fixed height to contain horizontal ListView
                        child: ListView.separated(
                          itemCount: expertiseModel.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
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
                                    child: SvgPicture.asset(expertiseModel[index].iconpath, color: oceanGreen),
                                  ),
                                  Text(expertiseModel[index].name, style: TextStyle(color: cream, fontWeight: FontWeight.w700)
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(width: 10),
                        ),
                      ),
                    ]
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
                      heading(context, 'Contact'),
                      Container(
                        padding: const EdgeInsets.all(6),
                        width: MediaQuery.sizeOf(context).width,
                        height: 120, // Important for horizontal ListView
                        child: ListView.separated(
                          itemCount: contactModel.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final contact = contactModel[index];
                            final type = contact.type;
                            final value = contact.path;
                            
                            final isTapped = tappedIndex == index;

                            return GestureDetector(
                              onTap: () async{
                                setState(() => tappedIndex = index);

                                await Future.delayed(const Duration(milliseconds: 200));

                                setState(() => tappedIndex = null);

                                if (type == 'phone') {
                                  dialPhone(value);
                                } else if (type == 'email') {
                                  sendEmail(value);
                                } else if (type == 'url') {
                                  openUrl(value);
                                } else {
                                  debugPrint('Unknown type: $type');
                                }
                              },
                              child: Container(
                                width: 100,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: isTapped? cream : oceanGreen,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: isTapped? oceanGreen : cream,
                                      radius: 24,
                                      child: SvgPicture.asset(contact.iconpath, color: isTapped? cream : oceanGreen, width: 24, height: 24,
                                      ),
                                    ),
                                    Text(
                                      contact.label,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: isTapped? oceanGreen: cream,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ]
                  )
                )
              ],
            ),
          )
        ),
      ),
    );
  }

  Column educationDetail(String status, String gpa, String major) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [Icon(Icons.radio_button_off, size: 10, color: oceanGreen), SizedBox(width:10), Expanded(child: Text(status, style: TextStyle(color: oceanGreen, fontWeight: FontWeight.w500)))]),
        Row(children: [Icon(Icons.radio_button_off, size: 10, color: oceanGreen), SizedBox(width:10), Expanded(child: Text('CUM-GPA: $gpa', style: TextStyle(color: oceanGreen, fontWeight: FontWeight.w500)))]),
        Row(children: [Icon(Icons.radio_button_off, size: 10, color: oceanGreen), SizedBox(width:10), Expanded(child: Text('Major: $major', style: TextStyle(color: oceanGreen, fontWeight: FontWeight.w500)))])
      ]
    );
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

  Future<void> dialPhone(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  Future<void> sendEmail(String toEmail) async {
    final Uri uri = Uri(scheme: 'mailto', path: toEmail);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
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
        _onItemTapped(0);
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}