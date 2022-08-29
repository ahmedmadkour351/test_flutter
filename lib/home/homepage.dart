import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes = [
    {'name': 'جاري اعمال سحب كابلات المبنى ', 'image': '1.jpeg'},
    {'name': 'تم الانتهاء من تركيب اسبوتات المدخل', 'image': '2.jpeg'},
    {
      'name': 'جارى اعمال شقف معلق الفرغات على ان يتم الانتهاء يوم 30-8-2022',
      'image': '3.jpeg'
    },
    {
      'name': 'جارى اعمال تجاليد المدخل على ان يتم الانتهاء يوم 25-8-2022',
      'image': '4.jpeg'
    },
    {'name': 'جارى تشطيب الرخام فى المدخل', 'image': '5.jpeg'},
    {
      'name': 'جارى تركيب تجاليد المسرح على ان يتم الانتهاء يوم 30-8-2022',
      'image': '6.jpeg'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("addnotes");
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, i) {
              return Dismissible(
                  key: Key("$i"),
                  child: ListNotes(
                    notes: notes[i],
                  ));
            },
          ),
        ),
      ),
    );
  }
}

class ListNotes extends StatelessWidget {
  final notes;
  ListNotes({this.notes});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset("images/6.jpeg"),
        ),
        Expanded(
          flex: 2,
          child: ListTile(
            title: const Text("Title"),
            subtitle: Text("${notes['name']}"),
            trailing: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("editnotes");
              },
              icon: const Icon(Icons.edit),
            ),
          ),
        ),
      ],
    ));
  }
}
