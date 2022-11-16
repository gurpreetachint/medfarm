// ignore_for_file: unnecessary_brace_in_string_interps

// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';



import 'package:medfarm/screens/home/BMI/bmi.dart';
import 'package:medfarm/screens/home/Emergency/polyline.dart';

import 'package:medfarm/screens/home/Dashboard/dashboard.dart';
import 'package:medfarm/screens/home/Doctor/doctorclinic.dart';
// import 'package:medfarm/screens/home/Emergency/emergency.dart';
import 'package:medfarm/screens/home/Guide/guide.dart';
import 'package:medfarm/screens/home/Pharmacy/pharmacypage.dart';
import 'package:medfarm/screens/home/Navigation/mydrawer.dart';
import 'package:medfarm/services/profile.dart';

// import '../../services/model/user.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  int forTap;
   
   Home({Key? key,required this.forTap}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State createState() => _HomeState(forTap);
}

class _HomeState extends State<Home> {
  int currentTap = 0;
  final ProfileService _profile= ProfileService();

  final List<Widget> screens = <Widget>[
    const DashBoard(),
    const PharmacyPage(),
    const PolylinePage(),
    const DoctorClinic(),
    const GuidePage()
  ];
  
  Widget currentScreen = const DashBoard();
  PageStorageBucket bucket = PageStorageBucket();

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  int forTap;
   
  _HomeState( this.forTap);

    var scaffoldKey = GlobalKey<ScaffoldState>();
    
   @override
  void initState() {
    super.initState();
    setState(() {
    
      currentTap=forTap;
      currentScreen=screens.elementAt(currentTap);
      
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
    
      drawerEnableOpenDragGesture: true,
       resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      drawer:  MyDrawer(),
      

      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     setState(() {
      //       currentTap = 2;
      //       currentScreen = screens.elementAt(currentTap);
      //     });
      //   },
      // ),

      floatingActionButton: SpeedDial(
        onPress: (() {
          setState(() {
            isDialOpen.value = !(isDialOpen.value);
          });
        }),
        icon: Icons.add,
        activeIcon: Icons.close,
        openCloseDial: isDialOpen,
        spacing: 3,
        children: [
          SpeedDialChild(
            onTap: () {
              setState(() {
                currentTap = 2;
                currentScreen = screens.elementAt(currentTap);
              });
            },
            child: Icon(
              Icons.emergency_outlined,
              color: Colors.blue.shade600,
            ),
            label: "Emergency",
          ),
          SpeedDialChild(
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const BMI(),
                ));
                
              });
            },
            child: Icon(
              Icons.sports_gymnastics_outlined,
              color: Colors.blue.shade600,
            ),
            label: "BMI",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentTap = 0;
                          currentScreen = screens.elementAt(currentTap);
                        });
                      },
                      minWidth: 40,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              currentTap == 0
                                  ? Icons.home
                                  : Icons.home_outlined,
                              color: Colors.blue.shade600,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.blue.shade600,
                              ),
                            ),
                          ])),
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentTap = 1;
                          currentScreen = screens.elementAt(currentTap);
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              currentTap == 1
                                  ? Icons.local_pharmacy
                                  : Icons.local_pharmacy_outlined,
                              color: Colors.blue.shade600,
                            ),
                            Text(
                              'Pharmacy',
                              style: TextStyle(
                                color: Colors.blue.shade600,
                              ),
                            ),
                          ])),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentTap = 3;
                          currentScreen = screens.elementAt(currentTap);
                        });
                      },
                      minWidth: 40,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              currentTap == 3
                                  ? Icons.medical_services
                                  : Icons.medical_services_outlined,
                              color: Colors.blue.shade600,
                            ),
                            Text(
                              'Doctor',
                              style: TextStyle(
                                color: Colors.blue.shade600,
                              ),
                            ),
                          ])),
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentTap = 4;
                          currentScreen = screens.elementAt(currentTap);
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              currentTap == 4
                                  ? Icons.medical_information
                                  : Icons.medical_information_outlined,
                              color: Colors.blue.shade600,
                            ),
                            Text(
                              'Guide',
                              style: TextStyle(
                                color: Colors.blue.shade600,
                              ),
                            ),
                          ])),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
 
}
