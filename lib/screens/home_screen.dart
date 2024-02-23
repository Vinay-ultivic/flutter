import 'package:flutter/material.dart';
import 'package:food_order/providers/ad_provider.dart';
import 'package:food_order/screens/otp_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController phoneController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AdProvider>(context,listen: false).initializeHomePageBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AdProvider>(context,listen: false);
    var size= MediaQuery.of(context).size;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Consumer<AdProvider>(builder: (context,child,value) {
        if(provider.isHomeLoader)
        {
          return SizedBox(
            height: provider.homePageBanner.size.height.toDouble(),
            child: AdWidget(ad: provider.homePageBanner,),
          );
        }
        else{
          return Container(height: 0,);
        }
      }),
      body: Container(
     decoration:  BoxDecoration(
       gradient: LinearGradient(
         begin: Alignment.topLeft,
         end: Alignment.topRight,
         colors: [
          Colors.red.shade400,
         Colors.pink.shade300

         ],
       ),
     ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
            Column(
              children: [
                    TextField(
                      controller:phoneController ,
                      keyboardType: TextInputType.phone,
                      decoration:  InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Mobile Number",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                    ),
                const SizedBox(height: 30,),
                SizedBox(
                  height: size.height/16,
                  width: size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),

                      ),
                      backgroundColor:Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal),
                    ),
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtpScreen()));

                    }, child: const Text('Send OTP',style:
                    TextStyle(fontSize: 15,fontFamily: 'MarkPro',letterSpacing: 1,fontWeight: FontWeight.w700,color: Colors.white),),
                  ),
                ),
                const SizedBox(height: 30,),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Flexible(
                    child: Divider(
                      endIndent: 20,
                      height: 5,
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  Text("or",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  Flexible(
                    child: Divider(
                      indent: 20,
                      thickness: 1,
                      height: 5,
                      color: Colors.white,
                    ),
                  ),
                ],),
          const SizedBox(height: 30,),
                SizedBox(
                  height: size.height/16,
                  width: size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),

                      ),
                      backgroundColor:Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal),
                    ),
                    onPressed: () {


                    }, child: const Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                      Icon(Icons.email_rounded,size: 25,color: Colors.black,),
                    Text('Continue with Email',style:
                    TextStyle(fontSize: 15,fontFamily:'MarkPro',letterSpacing: 1,fontWeight: FontWeight.w700,color: Colors.black),),
                    SizedBox(),
                  ],)
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  SizedBox(
                    height: size.height/16,
                    width: size.width/2.3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),

                        ),
                        backgroundColor:Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                      ),
                      onPressed: () {


                      }, child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Image.asset("assets/images/facebook 1.png"),
                      const Text('Facebook',style:
                      TextStyle(fontSize: 15,fontFamily: 'MarkPro',letterSpacing: 1,fontWeight: FontWeight.w700,color: Colors.black),),
                      SizedBox(),
                    ],)
                    ),
                  ),

                  SizedBox(
                    height: size.height/16,
                    width: size.width/2.3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),

                        ),
                        backgroundColor:Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                      ),
                      onPressed: () {


                      }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      Image.asset("assets/images/search 1.png",height: 20,width: 30,),
                      const Text('Google',style:
                      TextStyle(fontSize: 15,fontFamily: 'MarkPro',letterSpacing: 1,fontWeight: FontWeight.w700,color: Colors.black),),
                      const SizedBox(),
                    ],)
                    ),
                  )
                ],),
                const SizedBox(height: 20,),
                const Text("By continuing, you agree to our",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 15),),
                const Text("Terms of Service  Privacy Policy  Content Policy",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 15),)
              ],
            ),


              
          ],),
        ),
      ),

    );
  }
}
