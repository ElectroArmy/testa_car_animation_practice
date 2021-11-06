import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';


class Idol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 11,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context, index) {
        return Container(
            padding: EdgeInsets.all(20.0),
            child: ClipPolygon(
              sides: 5,
              borderRadius: 5.0,
              rotate: 10.0,
              boxShadows: [
                PolygonBoxShadow(color: Colors.black, elevation: 7.0),
                PolygonBoxShadow(color: Colors.grey[300], elevation: 9.0)
              ],
              child: GestureDetector(
                // New code change alittle
                child: Image.asset("assets/icons/sp2.jpeg"),
                
                
                // child: Image.network(
                //     "http://autismmyanmar.org/wp-content/uploads/2018/09/img/p3.JPG"),
                onLongPress: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SecondScreen()
                  //     ), //Slider.dart invoke
                  // );
                },
                onTap: () {
                  final snackBar = SnackBar(content: Text("Love wit Code"));

                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
              
            ));
            

        // return Padding(
        //   padding: const EdgeInsets.all(3.0),

        //   child: GestureDetector(

        //     child: Image.network("https://raw.githubusercontent.com/ElectroArmy/poe/master/IMG_5285.JPG"),

        //     onTap: () {
        //       final snackBar = SnackBar(content: Text("Poe so Sex"));

        //       Scaffold.of(context).showSnackBar(snackBar);
        //     },
        //   ),
        // );
      },
    );

    var galaxies = [
      "Messier 87",
      "Andromeda",
      "Sombrero",
      "Whirlpool",
      "Pinwheel",
      "Milky Way",
      "Cartwheel",
      "Black Eye Galaxy",
      "Star Bust",
      "Centaurus",
      "Triangulum",
      "Sunflower",
      "Caldwell",
      "Tadpole",
      "Hoag's Object",
      "Mallin 1",
      "NGC 262",
      "IC 1101"
    ];

    //return createGridView(context, galaxies);
  }
}

//Local Json Class here

// class LocalJson extends StatelessWidget{

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// //        appBar: AppBar(
// //          title: Text("Load local JSON file"),
// //        ),
//         body: Container(
//           child: Center(
//             // Use future builder and DefaultAssetBundle to load the local JSON file
//             child: FutureBuilder(
//                 future: DefaultAssetBundle
//                     .of(context)
//                     .loadString('data_repo/starwars_data.json'),
//                 builder: (context, snapshot) {
//                   // Decode the JSON
//                   var newData = json.decode(snapshot.data.toString());

//                   return ListView.builder(
//                     // Build the ListView
//                     itemBuilder: (BuildContext context, int index) {
//                       return Card(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: <Widget>[
//                             Text("Name: " + newData[index]['name']),
//                             Text("Height: " + newData[index]['height']),
//                             Text("Mass: " + newData[index]['mass']),
//                             Text(
//                                 "Hair Color: " + newData[index]['hair_color']),
//                             Text(
//                                 "Skin Color: " + newData[index]['skin_color']),
//                             Text(
//                                 "Eye Color: " + newData[index]['eye_color']),
//                             Text(
//                                 "Birth Year: " + newData[index]['birth_year']),
//                             Text("Gender: " + newData[index]['gender'])
//                           ],
//                         ),
//                       );
//                     },
//                     itemCount: newData == null ? 0 : newData.length,
//                   );
//                 }),
//           ),
//         ));
//   }
// }