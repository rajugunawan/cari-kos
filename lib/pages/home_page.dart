import 'package:flutter/material.dart';
import 'package:kosan/models/city.dart';
import 'package:kosan/models/space.dart';
import 'package:kosan/models/tips.dart';
import 'package:kosan/providers/space_provider.dart';
import 'package:kosan/theme.dart';
import 'package:kosan/widgets/bottom_navbar.dart';
import 'package:kosan/widgets/city_card.dart';
import 'package:kosan/widgets/space_card.dart';
import 'package:kosan/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text('Explore Now',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Mencari kosan yang cozy',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Popular Cities',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                        id: 1,
                        name: 'jakarta',
                        imageUrl:  'assets/images/city1.png',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 2,
                        name: 'Surabaya',
                        imageUrl:  'assets/images/city2.png',
                        isPopular: true,
                      ),
                      ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 3,
                        name: 'Bandung',
                        imageUrl:  'assets/images/city3.png',
                        isPopular: true,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),

              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Recomended Spaces',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: 
                
                FutureBuilder(
                  future:  spaceProvider.getRecomendedSpaces(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){


                      List<Space> data = snapshot.data;

                      int index = 0;



                      return

                      Column(

                  children: data.map((item) {

                    index++;
                    return Container(
                      
                      margin: EdgeInsets.only(
                        top: index == 1 ? 0 : 30,
                      ),
                      child: SpaceCard(item),
                    );

                  }).toList(),


                );
               }

               return
              
              Center(
                child: CircularProgressIndicator(),
                
                );


                  }
                )
                
                
              ),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Tips & Guidance',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),

              SizedBox(
                height: 16,
              ),

             Padding(
               padding: EdgeInsets.symmetric(
                 horizontal: edge,
               ),
               child: Column(
                 children: [
                   TipsCard(
                     Tips(
                        id: 1,
                       title: 'City Guidelines',
                       imageUrl: 'assets/images/icon1.png',
                       updateAt: '20 April',
                     )
                   ),
                   SizedBox(
                     height: 20,
                   ),

                   TipsCard(
                     Tips(
                        id: 1,
                       title: 'Jakarta Fairship',
                       imageUrl: 'assets/images/icon2.png',
                       updateAt: '11 December',
                     )
                   ),

                   SizedBox(
                     height: 50,
                   ),

                  
                  
                 ],
               ),
             ),
              
            ],
          ),
        ),

      floatingActionButton: 
       Container(
                       height: 65,
                       width: MediaQuery.of(context).size.width - (2 * edge),
                       margin: EdgeInsets.symmetric(
                         horizontal: edge,
                       ),
                       decoration: BoxDecoration(
                         color: Color(0xffF6F7F8),
                         borderRadius: BorderRadius.circular(23),
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           BottomNavbar(
                             imageUrl: 'assets/images/Icon_home_solid.png',
                             isActive: true,
                           ),
                            BottomNavbar(
                             imageUrl: 'assets/images/Icon_love_solid.png',
                             isActive: false,
                           ),
                            BottomNavbar(
                             imageUrl: 'assets/images/Icon_card_solid.png',
                             isActive: false,
                           ),
                            BottomNavbar(
                             imageUrl: 'assets/images/Icon_mail_solid.png',
                             isActive: false,
                           ),
                         ],
                       ),
                     ),

                     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}