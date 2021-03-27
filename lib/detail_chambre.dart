import 'package:flutter/material.dart';
import './data.dart';

class DetailChambre extends StatefulWidget {
  final Property property;
  DetailChambre({@required this.property});

  @override
  _DetailChambreState createState() => _DetailChambreState();
}

class _DetailChambreState extends State<DetailChambre> {
  List<Property> properties = getPropertyList();
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
return Scaffold(
      bottomNavigationBar: Container(
        height:40.0,
        decoration: BoxDecoration(
          color:Colors.yellow[700],
         borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight:Radius.circular(20),
            ),
        ),
       child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left:170),
              child: Icon(Icons.home),
              )
             ],
        ),
       ),
      body: Stack(
         children:[
         Container(
            height: size.height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 48,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: Colors.red,
                        size: 28,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
               
         
              ],
            ),
          ),
                Expanded(
                  child: Container(),
                ),
              ListView(
            children:buildPhotos(widget.property.images),
          ),
         
        ]
  
      ),
    );
  }

  List<Widget> buildPhotos(List<String> images) {
    List<Widget> list = [];
    list.add(SizedBox(
      width: 24,
    ));
    for (var i = 0; i < images.length; i++) {
      list.add(buildPhoto(images[i], i));
    }
    return list;
  }

  Widget buildPhoto(String url, int index) {
    return AspectRatio(
      aspectRatio:2,
      child: Container(
        margin: EdgeInsets.only(
          right:0.1,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            image: DecorationImage(
              image: AssetImage(url),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
