import 'package:flutter/material.dart';
import 'package:kosan/models/space.dart';
import 'package:kosan/pages/detail_page.dart';
import '../theme.dart';




class SpaceCard extends StatelessWidget {

  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => DetailPage(space),
            ));
          },
          child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
               child: Container(
                width: 130,
                height: 110,
                child: Stack(
                  children: [
                    Image.network(
                      space.imageUrl,
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    Align(
                          alignment: Alignment.topRight,
                           child: Container(
                           width: 70,
                           height: 30,
                           decoration: BoxDecoration(
                             color: purpleColor,
                             borderRadius: BorderRadius.only(
                               bottomLeft: Radius.circular(36),
                             )
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                             Image.asset(
                               'assets/images/badge.png',
                               height: 22,
                               width: 22,
                            ),
                            Text(
                              '${space.rating}/5',
                              style: whiteTextStyle.copyWith(
                                fontSize: 13,
                              ),
                            )
                           ],
                           ),
                       ),
                     )
                  ],
                ),
          ),
            ),

            SizedBox(
              width: 20,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kuretakeso Hott',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text.rich(
                  TextSpan(
                    text: '\$52',
                    style: purpleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: ' ${space.price} / mounth',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                Text(
                  '${space.city}, ${space.country}',
                  style: greyTextStyle,
                )

              ],
            ),
        ],
      ),
    );
  }
}