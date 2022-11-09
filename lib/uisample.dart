

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:uisample2/viewLand.dart';

import 'location.dart';

class UiSample extends StatefulWidget {
  const UiSample({Key? key}) : super(key: key);

  @override
  State<UiSample> createState() => _UiSampleState();
}
//height : size.height * .9;

class _UiSampleState extends State<UiSample> {

  Future <dynamic> getdata()async{
    final Url = "https://api.xentice.com/api/postadSelect";
    var response = await get(Uri.parse(Url));
    print("sbsvj");
    if(response.statusCode==200){
      print(response.body);
      print("sbsvj");
      return jsonDecode(response.body);
    }
  }
  @override
  void initState(){
    getdata();
    super.initState();
  }
  int isFave=0;
  int isFave1=0;
  int isFave2=0;
  int isFave3=0;
  int isFave4=0;
  var selected_index ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white60,
          leading: Icon(Icons.sort,color: Colors.blue.shade900,),
          title: Text("xentice",style: GoogleFonts.comfortaa(color: Colors.blue.shade700,fontSize: 28,)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/3.jpg',),
                        fit: BoxFit.fill
                    ),
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            )
          ],
        ),
          body:SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Container(
                 // height: 40,
                 height: size.height *0.05,
                 margin:   EdgeInsets.fromLTRB(13, 9, 10, 5) ,
                 // color: Colors.redAccent,
                 child: TextField(
                   decoration: InputDecoration(
                     prefixIcon:  Icon(Icons.search,size: 30,),
                     hintText:'Search', hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey.shade400,fontWeight: FontWeight.bold),
                       contentPadding: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 10.0),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(7),
                       borderSide: BorderSide(color: Colors.grey.shade300,),
                     )
                   ),
                 ),
               ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(isFave4==0){
                            isFave4=1;
                          }else{
                            isFave4=0;
                          }
                          print(isFave4);
                        });
                      },
                      child: Container(
                        margin:   EdgeInsets.fromLTRB(11, 9, 4, 5) ,
                        width: 120,
                        height: 35,
                        child: Center(child: Text("Property",style: TextStyle(color:isFave4==0?Colors.black:Colors.grey,fontWeight: FontWeight.bold,fontSize:20),)),
                        decoration: BoxDecoration(
                          // color: Colors.redAccent,
                          border: Border.all(
                            color: isFave4==0?Colors.grey.shade300:Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(isFave4==0){
                            isFave4=1;
                          }else{
                            isFave4=0;
                          }
                          print(isFave3);
                        });
                      },
                      child: Container(
                        width: 120,
                        height: 35,
                        child: Center(child: Text("Services",style: TextStyle (color: isFave4==0? Colors.grey:Colors.black,fontWeight: FontWeight.bold,fontSize:20),)),
                        decoration: BoxDecoration(
                          // color: Colors.redAccent,
                          border: Border.all(
                            color: isFave4==1?Colors.grey.shade300:Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height*.012),
                Container(
                  height: size.height*.099,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: size.width*.025),
                    separatorBuilder: (context, index){
                      return SizedBox(width:size.width*.025);
                    },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    scrollDirection:Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context,index) {
                      print(index);
                      return InkWell(
                        onTap: (){
                          setState(() {
                           selected_index=index;
                          });
                        },
                        child: Container(
                            width: size.width*0.21,
                            height: 100,
                          decoration: BoxDecoration(
                            color:selected_index == index? Colors.blue.shade900:null,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: size.width*.038),
                                child: Image.asset("assets/images/land.png",height: size.height*0.060,color:selected_index == index? Colors.white:Colors.grey.shade600,),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top:size.height*0.06,left: size.height*0.015,),
                                child: Text('''Industrial''',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:selected_index == index? Colors.white:Colors.grey),),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top:size.height*0.076,left: size.height*0.031,),
                                child: Text('''Land''',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:selected_index == index? Colors.white:Colors.grey),),
                              ),
                            ],
                          )
                        ),
                      );
                    }
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: size.height*0.01,top: size.height*0.04),
                      child: Container(
                        width: size.width*0.5,
                        height: size.height*0.05,
                        child: Text("Commercial Office",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      ),
                    ),Padding(
                      padding:  EdgeInsets.only(left:size.width*.8,top: size.height*0.05),
                      child: Container(
                        width: size.width*0.5,
                        height: size.height*0.05,
                        child: Text("see all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey.shade300,),),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*0.09,left: size.height*0.02),
                          child: Container(
                            width: size.width*0.45,
                            height: size.height*0.25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ),SingleChildScrollView(
                          child: Padding(
                            padding:  EdgeInsets.only(top: size.height*0.09,left: size.height*0.01),
                            child: Container(
                              width: size.width*0.45,
                              height: size.height*0.25,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*0.091,left: size.height*0.02),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>ViewLand()));
                            },
                            child: Container(
                              width: size.width*0.45,
                              height: size.height*0.17,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/1.jpg'),
                                    fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            ),
                          ),
                        ),SingleChildScrollView(
                          child: Padding(
                            padding:  EdgeInsets.only(top: size.height*0.091,left: size.height*0.01),
                            child: Container(
                              width: size.width*0.45,
                              height: size.height*0.17,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage('assets/images/1.jpg'),
                                      fit: BoxFit.fill
                                  ),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*0.1,left: size.width*.41),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                if(isFave3==0){
                                  isFave3=1;
                                }else{
                                  isFave3=0;
                                }
                                print(isFave3);
                              });
                            },
                            child: Container(
                              width: size.width*0.06,
                              height: size.height*0.03,
                              decoration: BoxDecoration(
                                  color: isFave3==0? Colors.white:Colors.grey,
                                  borderRadius:BorderRadius.circular(11)
                              ),
                              child: Center(child: isFave3==0?Icon(Icons.favorite,color: Colors.red,size: 13,):Icon(Icons.favorite,color: Colors.white,size: 13,)),
                            ),
                          ),
                        ),SingleChildScrollView(
                          child: Padding(
                            padding:  EdgeInsets.only(top: size.height*0.1,left: size.width*.41),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  if(isFave2==0){
                                    isFave2=1;
                                  }else{
                                    isFave2=0;
                                  }
                                  print(isFave2);
                                });
                              },
                              child: Container(
                                width: size.width*0.06,
                                height: size.height*0.03,
                                decoration: BoxDecoration(
                                    color: isFave2==0? Colors.white:Colors.grey,
                                    borderRadius:BorderRadius.circular(11)
                                ),
                                child: Center(child:isFave2==0?Icon(Icons.favorite,color: Colors.red,size: 13,):Icon(Icons.favorite,color: Colors.white,size: 13,)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*0.27,left: size.height*0.03),
                          child: Text("Woxro office",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),Padding(
                          padding:  EdgeInsets.only(top: size.height*0.27,left: size.width*.269),
                          child: Text("Woxro office",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*.2764,left: size.width*.3310),
                          child: Text("Rs.2500/Hr",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red.shade900,fontSize: 9),),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*.2764,left: size.width*.3564),
                          child: Text("Rs.2500/Hr",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red.shade900,fontSize: 9),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*0.30,left: size.height*0.03),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Location1()));
                            },
                            child: Container(
                              width: size.width*0.30,
                              height: size.height*0.03,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on,color: Colors.green,size: 20,),
                                  Text("Thrissur",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          )
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*0.30,left: size.width*0.17),
                          child: Container(
                            width: size.width*0.30,
                            height: size.height*0.03,
                            child: Row(
                              children: [
                                Icon(Icons.location_on,color: Colors.green,size: 20,),
                                Text("Thrissur",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          )
                        ),
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: size.height*0.01,top:size.height*00.37),
                      child: Container(
                        width: size.width*0.5,
                        height: size.height*0.05,
                        child: Text("Commercial Office",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left:size.width*.8,top:size.height*00.39),
                      child: Container(
                        width: size.width*0.5,
                        height: size.height*0.05,
                        child: Text("see all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey.shade300,),),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*0.42,left: size.height*0.02),
                          child: Container(
                            width: size.width*0.45,
                            height: size.height*0.25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ),Padding(
                          padding:  EdgeInsets.only(top: size.height*0.42,left: size.height*0.01),
                          child: Container(
                            width: size.width*0.45,
                            height: size.height*0.25,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*0.42,left: size.height*0.02),
                          child: Container(
                            width: size.width*0.45,
                            height: size.height*0.17,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/1.jpg'),
                                    fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ), Padding(
                          padding:  EdgeInsets.only(top: size.height*0.42,left: size.height*0.01),
                          child: Container(
                            width: size.width*0.45,
                            height: size.height*0.17,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/1.jpg'),
                                    fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*0.43,left: size.width*.41),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                if(isFave1==0){
                                  isFave1=1;
                                }else{
                                  isFave1=0;
                                }
                                print(isFave1);
                              });
                            },
                            child: Container(
                              width: size.width*0.06,
                              height: size.height*0.03,
                              decoration: BoxDecoration(
                                  color: isFave1==0? Colors.white:Colors.grey,
                                  borderRadius:BorderRadius.circular(11)
                              ),
                              child: Center(child: isFave1==0?Icon(Icons.favorite,color: Colors.red,size: 13,):Icon(Icons.favorite,color: Colors.white,size: 13,)),
                            ),
                          ),
                        ), Padding(
                          padding:  EdgeInsets.only(top: size.height*0.43,left: size.width*.41),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                if(isFave==0){
                                  isFave=1;
                                }else{
                                  isFave=0;
                                }
                                print(isFave);
                              });
                            },
                            child: Container(
                              width: size.width*0.06,
                              height: size.height*0.03,
                             decoration: BoxDecoration(
                               color: isFave==0? Colors.white:Colors.grey,
                               borderRadius:BorderRadius.circular(11)
                             ),
                             child: Center(child: isFave==0?Icon(Icons.favorite,color: Colors.red,size: 13,):Icon(Icons.favorite,color: Colors.white,size: 13,)),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*0.60,left: size.height*0.03),
                          child: Text("Woxro office",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),Padding(
                          padding:  EdgeInsets.only(top: size.height*0.60,left: size.width*.269),
                          child: Text("Woxro office",style: TextStyle(fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*.6055,left: size.width*.34),
                          child: Text("Rs.2500/Hr",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red.shade900,fontSize: 9),),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: size.height*.6055,left: size.width*.3564),
                          child: Text("Rs.2500/Hr",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red.shade900,fontSize: 9),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding:  EdgeInsets.only(top: size.height*0.63,left: size.height*0.03),
                            child: Container(
                              width: size.width*0.30,
                              height: size.height*0.03,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on,color: Colors.green,size: 20,),
                                  Text("Thrissur",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            )
                        ),
                        Padding(
                            padding:  EdgeInsets.only(top: size.height*0.63,left: size.width*0.17),
                            child: Container(
                              width: size.width*0.30,
                              height: size.height*0.03,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on,color: Colors.green,size: 20,),
                                  Text("Thrissur",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            )
                        ),
                      ],
                    ),


                  ],
                )
              ],
            ),
          ),

    ),
    );
  }
}
