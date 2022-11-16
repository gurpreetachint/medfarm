import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medfarm/screens/home/Doctor/doctordetails.dart';
import 'package:medfarm/services/model/doctorinfo.dart';
// import 'package:medfarm/services/profile.dart';

class DoctorClinic extends StatefulWidget {
  const DoctorClinic({Key? key}) : super(key: key);

  @override
  State createState() => _DoctorClinic();
}

class _DoctorClinic extends State<DoctorClinic> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

     
  var doctorDocumentList= FirebaseFirestore.instance.collection('doctors');
  
 
   Stream<List<DoctorInfo>> showDoctorsProfile(){
        return doctorDocumentList.snapshots().map((snapshot) => snapshot.docs.map((doc) => DoctorInfo.fromJson(doc.data())).toList());
    } 
  

    return Scaffold(
       resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Doctors Appointment"),
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        // actions: [
        //   GestureDetector(
        //     child: Container(
             
        //       margin: const EdgeInsets.only(right: 10),
        //       child: const Icon(
        //         Icons.notifications_rounded,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        //   GestureDetector(
        //     child: Container(
        //        height: 40,
        //       width: 40,
        //       margin: const EdgeInsets.only(right: 10),
              
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(50),
        //       ),
        //       child: Image.asset("lib/images/medicine.jpeg"),
        //     ),
        //   )
        // ],
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius:const  BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                child: const Text(
                  "Hi  ",
                  style: TextStyle(
                    color: Color(0xff363636),
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 20),
                child: const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff363636),
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left:10 ,right: 10),
                margin: const EdgeInsets.only(top:10),
                child: const Divider(                  
                  height: 2,
                  thickness: 2,
                  indent: 1,
                  endIndent: 1,                  
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(left: 20, top: 25, right: 20),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(5),
              //     boxShadow: const [
              //       BoxShadow(
              //           color: Color(0x1400000),
              //           offset: Offset(0, 10),
              //           blurRadius: 15,
              //           spreadRadius: 0)
              //     ],
              //   ),
              //   height: 60,
              //   width: size.width,
              //   child: Row(
              //     children:const [
              //       // Expanded(
              //       //   flex: 5,
              //       //   child: Container(
              //       //     child: TextFormField(
              //       //       decoration: InputDecoration(
              //       //         fillColor: Colors.white,
              //       //         filled: true,
              //       //         prefixIcon: const Icon(Icons.medication_rounded),
              //       //         suffixIcon: const Icon(
              //       //           Icons.search,
              //       //         ),
              //       //         border: OutlineInputBorder(
              //       //             borderRadius: BorderRadius.circular(10)),
              //       //         hintText: "Search Doctors Here",
              //       //       ),
              //       //       onChanged: (value) {},
              //       //       onFieldSubmitted: (val) {},
              //       //     ),
              //       //   ),
              //       // ),

              //     ],
              //   ),
              // ),
              Container(
                width: size.width,
                margin: const EdgeInsets.only(top: 20, left: 20),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      child: const Text(
                        "Category",
                        style: TextStyle(
                            color: Color(0xff363636),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                     Container(
                      margin: const EdgeInsets.only(right: 20, top: 5),
                      child:const  Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "SCROLL LEFT",
                          style: TextStyle(
                            color: Color(0xff363636),
                            fontSize: 10,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 120,
                margin: const EdgeInsets.only(top: 20, left: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  
                  children: [
                    demoCategories(
                        "lib/images/tooth.png", "Tooth", "10 doctors",
                        ),
                    demoCategories(
                        "lib/images/brain.png", "Brain", "10 doctors"),
                    demoCategories(
                        "lib/images/heart.png", "Heart", "10 doctors"),
                    demoCategories(
                        "lib/images/bone.png", "Bones", "10 doctors"),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left:10 ,right: 10),
                margin: const EdgeInsets.only(top:30),
                child: const Divider(                  
                  height: 2,
                  thickness: 2,
                  indent: 1,
                  endIndent: 1,                  
                ),
              ),
              Container(
                width: size.width,
                margin: const EdgeInsets.only(top: 20, left: 20),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      child: const Text(
                        "Top Rated",
                        style: TextStyle(
                            color: Color(0xff363636),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, top: 5),
                      child:const  Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "REGISTERED DOCTORS",
                          style: TextStyle(
                            color: Color(0xff363636),
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: StreamBuilder<List<DoctorInfo>>(
                    stream: showDoctorsProfile(),
                    builder:(context,snapshot){
                      if(snapshot.hasData){
                        if(snapshot.data !=null){
                          final doctors=snapshot.data!;
                        return ListView(
                      children:doctors.map(buildDoctor).toList(),
                    );
                        }
                        else{
                        return ListView(
                      children: [
                        demoTopRatedDr("lib/images/heart.jpeg",
                            "Dr. Gupreet Singh", "MD Physician", "5","idraksheikh111@gmail.com"),
                        demoTopRatedDr("lib/images/heart.jpeg",
                            "Dr. Ashwin Khale", "Nephrologist", "5","idraksheikh111@gmail.com"),
                        demoTopRatedDr("lib/images/heart.jpeg",
                            "Dr. Abdul ", "MD Physician", "5","idraksheikh111@gmail.com"),
                       
                      ],
                    );
                      }
                      
                      }
                      else{
                        return ListView(
                      children: [
                        demoTopRatedDr("lib/images/heart.jpeg",
                            "Dr. Gupreet Singh", "MD Physician", "5","idraksheikh111@gmail.com"),
                        demoTopRatedDr("lib/images/heart.jpeg",
                            "Dr. Ashwin Khale", "Nephrologist", "5","idraksheikh111@gmail.com"),
                        demoTopRatedDr("lib/images/heart.jpeg",
                            "Dr. Abdul ", "MD Physician", "5","idraksheikh111@gmail.com"),
                       
                      ],
                    );
                      }
                      
                    } 
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget demoCategories(String image, String name, String drQuantity) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 100,
      decoration: BoxDecoration(
        color:Colors.blue.shade500,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(image),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(7),
            decoration:
                BoxDecoration(color: Color(0xffd9fffa).withOpacity(.07)),
            child: Text(
              drQuantity,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget demoTopRatedDr(
      String image, String name, String speciality, String rating,String email) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DoctorDetails(email:email)));
      },
      child: Container(
        height: 90,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: 90,
              width: 50,
              child: Image.asset(image),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      name,
                      style: const TextStyle(
                          color: Color(0xff363636),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            speciality,
                            style: const TextStyle(
                              color: Color(0xffababab),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 3, left: size.width * 0.25),
                          child: Row(
                            children: [
                              Container(
                                child: const Text(
                                  "Rating ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  rating,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

   Widget buildDoctor(DoctorInfo doctor){
    return demoTopRatedDr("lib/images/heart.jpeg", doctor.doctorname!,doctor.specialisation!, "5",doctor.email!);
   }
}
