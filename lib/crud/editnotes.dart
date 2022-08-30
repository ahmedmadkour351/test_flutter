// ignore: unused_import
// import 'dart:js_util';
import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditNotes extends StatefulWidget {
  const EditNotes({super.key});

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  DateTime dateone = DateTime.now();
  DateTime datetwo = DateTime.now().add(Duration(days: 10));
  DateTime datethree = DateTime.now().subtract(Duration(days: 10));
  List posts = [];
  Future getPost() async {
    Uri url = Uri(
        scheme: 'https',
        host: 'jsonplaceholder.typicode.com',
        path: 'posts',
        query: 'id=14');

    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    print(response.statusCode);
    setState(() {
      posts.addAll(responsebody);
    });
  }

  Future addposts() async {
    Uri url = Uri(
        scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'posts');
    var response1 = await http
        .post(url, body: {"title": 'foo', "body": 'bar', "userId": "1"});
    var resonsebody = JsonDecoder(response1.body);
    print(resonsebody);
    return resonsebody;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getPost();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Note'),
        ),
        body: ListView(
          children: [
            Container(
              child:
                  // ignore: unnecessary_null_comparison
                  posts == null || posts.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: posts.length,
                          itemBuilder: (context, i) {
                            return Text("${posts[i]['title']}");
                          }),
            ),
            ElevatedButton(
                onPressed: () {
                  addposts();
                },
                child: Text("ADD Post"))
          ],
        ));
  }
}






























// class EditNotes extends StatefulWidget {
//   const EditNotes({super.key});

//   @override
//   State<EditNotes> createState() => _EditNotesState();
// }

// class _EditNotesState extends State<EditNotes> {
//   late Position cl;
//   Future getPostion() async {
//     bool services;
//     LocationPermission per;
//     services = await Geolocator.isLocationServiceEnabled();
//     if (services == false) {
//       AwesomeDialog(
//           context: context,
//           title: "services",
//           body: Text("Services Not Enabled"))
//         ..show();
//     }
//     per = await Geolocator.checkPermission();
//     if (per == LocationPermission.denied) {
//       per = await Geolocator.requestPermission();
//       if (per == LocationPermission.always) {
//         getlatAndLong();
//       }
//     }
//     print("=============================");
//     print(per);
//     print("=============================");
//   }

//   Future<Position> getlatAndLong() async {
//     return await Geolocator.getCurrentPosition().then((value) => value);
//   }

//   Completer<GoogleMapController> _controller = Completer();
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   @override
//   void initState() {
//     getPostion();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Notes'),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 child: GoogleMap(
//                   mapType: MapType.hybrid,
//                   initialCameraPosition: _kGooglePlex,
//                   onMapCreated: (GoogleMapController controller) {
//                     _controller.complete(controller);
//                   },
//                 ),
//                 width: 500,
//                 height: 400,
//               ),
//               ElevatedButton(onPressed: () async {}, child: Text("Google Map")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// //AIzaSyC0lq_ZAhe7nkSiQkjuoz8xSqqR5lrQsJ0