import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  // Future getData() async {
  //   print("start function");
  //   await Future.delayed(Duration(seconds: 3), () {
  //     print("Ahmed Madkour");
  //   });
  //   print("End Function");
  // }
  // services location وهو يخص خدمة locaion بالموبيل اذن كان Enabled => True واذا كان  Disabled => fales
  //2- لابد من التحقق على خدمة location شغالة ام لا بالموبيل
  late Position cl;
  Future getPostion() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      AwesomeDialog(
          context: context,
          title: "services",
          body: Text("Services Not Enabled"))
        ..show();
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always) {
        getlatAndLong();
      }
    }
    print("=============================");
    print(per);
    print("=============================");
  }

  Future<Position> getlatAndLong() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }
  // permssin

  @override
  void initState() {
    getPostion();
    super.initState();
  }
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notes'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Container(
            child: Column(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                      hintText: "Title", prefixIcon: Icon(Icons.title)),
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      hintText: "Add Note", prefixIcon: Icon(Icons.add)),
                ),
                Row(
                  children: [
                    const Text("Add Photo"),
                    IconButton(
                        onPressed: () {
                          showBottomSheet();
                        },
                        icon: const Icon(Icons.attach_file)),
                  ],
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Add Note"))),
                ElevatedButton(
                    onPressed: () async {
                      var dis = await Geolocator.distanceBetween(
                          30.101623, 31.263207, 25.352403, 32.797938);
                      var disk = dis / 1000;
                      print(disk);
                      cl = await getlatAndLong();
                      print(cl.latitude);
                      print(cl.longitude);
                      // ignore: unused_local_variable
                      // List<Placemark> placemarks =
                      //     await placemarkFromCoordinates(
                      //         cl.latitude, cl.longitude);
                      // print(placemarks[0].country);
                    },
                    child: Text("Postion"))
              ],
            ))
          ],
        )),
      ),
    );
  }

  showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            height: 170.0,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text("Plaease Choose Image"),
                  // ignore: prefer_const_literals_to_create_immutables
                  InkWell(
                    onTap: () {},
                    child: Row(children: const [
                      Icon(Icons.photo),
                      Text("From Gallery")
                    ]),
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  InkWell(
                    onTap: () {},
                    child: Row(children: const [
                      Icon(Icons.camera),
                      Text("From Camera")
                    ]),
                  ),
                ]),
          );
        });
  }
}

//30.101623
//31.263207

//25.352403
//32.797938