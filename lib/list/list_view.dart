import 'package:flutter/material.dart';

class ListView extends StatefulWidget {
  const ListView({Key? key}) : super(key: key);

  @override
  _ListViewState createState() => _ListViewState();
  

}

class _ListViewState extends State<ListView> {
  late List<ListData> dataList;

  @override
  void initState() {
    dataList = fillDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Ne Seçilecek Başlık'),
          ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return const Card(
                  child: ListTile(),
                );
              })
        ],
      ),
    );
  }

  List<ListData> fillDataList() {
    List<ListData> tempList = <ListData>[];

    ListData data1 = ListData(id: 1, data: "Fransa");
    ListData data2 = ListData(id: 2, data: "Türkiye");
    ListData data3 = ListData(id: 3, data: "Çin");
    ListData data4 = ListData(id: 4, data: "Japonya");
    ListData data5 = ListData(id: 5, data: "Almanya");
    ListData data6 = ListData(id: 6, data: "Slovakya");

    tempList.add(data1);
    tempList.add(data2);
    tempList.add(data3);
    tempList.add(data4);
    tempList.add(data5);
    tempList.add(data6);
    return tempList;
  }
}

class ListData {
  int? id;
  String? data;

  ListData({this.id, this.data});
}
