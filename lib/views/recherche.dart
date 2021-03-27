import 'package:flutter/material.dart';
import '../data.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//import '../filter.dart';
import '../detail.dart';
import '../pup_image.dart';

class Recherche extends StatefulWidget {
  @override
  _RechercheState createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  List<Property> properties = getPropertyList();
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30.0,
        backgroundColor: Colors.yellow[700],
        title: Text(
          'Log',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        height: 30.0,
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 170),
              child: Icon(Icons.home),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 24,
              right: 24,
              bottom: 5,
            ),
            child: TextField(
              style: TextStyle(
                fontSize: 18,
                height: 1,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                  hintText: 'Rechercher ',
                  hintStyle: TextStyle(
                    fontSize: 28,
                    color: Colors.grey[400],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(
                      Icons.search,
                      color: Colors.yellow[700],
                      size: 28,
                    ),
                  )),
            ),
          ),
          // gestion du defilement
          Container(
            height: 150,
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only( left: 16,right: 16,),
                  child: Text('Mes Agences de location'),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Swiper(
                          onIndexChanged: (index) {
                            setState(() {
                              _current = index;
                            });
                          },
                          autoplay: true,
                          layout: SwiperLayout.DEFAULT,
                          itemCount: imagedefile.length,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.zero,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        imagedefile[index].image,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: map<Widget>(imagedefile, (index, image) {
                              return Container(
                                alignment: Alignment.bottomLeft,
                                height: 6,
                                width: 6,
                                margin: EdgeInsets.only(right: 8,bottom:15),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? Colors.red[700]
                                      : Colors.yellow[700]
                                ),
                              );
                            }),
                          ),
                          Text(
                            'More...',
                            
                            style: TextStyle(
                              color: Colors.green,
                              
                              ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.only(top: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Expanded(
          //         child: Container(
          //           height:32,
          //           child: Stack(
          //             children: [
          //               ListView(
          //                 physics: BouncingScrollPhysics(),
          //                 scrollDirection: Axis.horizontal,
          //                 children: [
          //                   SizedBox(width: 24),
          //                   buildFilter('House'),
          //                   buildFilter('Pix'),
          //                   buildFilter('Securite'),
          //                   buildFilter('Chambre'),
          //                   buildFilter('cours'),
          //                   buildFilter('Devanture'),
          //                   SizedBox(
          //                     width: 8,
          //                   ),
          //                 ],
          //               ),
          //               Align(
          //                 alignment: Alignment.centerRight,
          //                 child: Container(
          //                   width: 28,
          //                   decoration: BoxDecoration(
          //                     gradient: LinearGradient(
          //                       begin: Alignment.centerRight,
          //                       end: Alignment.centerLeft,
          //                       stops: [0.0, 1.0],
          //                       colors: [
          //                         Theme.of(context).scaffoldBackgroundColor,
          //                         Theme.of(context)
          //                             .scaffoldBackgroundColor
          //                             .withOpacity(0.0),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           _showBottomSheet();
          //         },
          //         child: Padding(
          //           padding: EdgeInsets.only(left: 16, right: 24),
          //           child: Text(
          //             'Filtrer',
          //             style: TextStyle(
          //               fontSize: 18,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.yellow[700],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //     right: 24,
          //     left: 24,
          //     top: 24,
          //     bottom: 12,
          //   ),
          //   child: Row(
          //     children: [
          //       Text(
          //         '53',
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       SizedBox(
          //         width: 8,
          //       ),
          //       Text(
          //         'Resultat trouver',
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: buildProperties(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilter(String filterName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: Colors.grey[300],
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          filterName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  List<Widget> buildProperties() {
    List<Widget> list = [];
    for (var i = 0; i < properties.length; i++) {
      list.add(
        Hero(
          tag: properties[i].frontImage,
          child: buildProperty(properties[i], i),
        ),
      );
    }
    return list;
  }

  Widget buildProperty(Property property, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(property: property)),
        );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 24),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(property.frontImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1.0],
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: 80,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Center(
                    child: Text(
                      property.label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          property.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          property.price + 'gnf',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              property.location,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.zoom_out_map,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              property.sqm + 'sq/m',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 25,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              property.review + 'vues',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//  void _showBottomSheet() {
//     showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         builder: (BuildContext context) {
//           return Wrap(
//             children: [
//               Filter(),
//             ],
//           );
//         });
//   }
}
