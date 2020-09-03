import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waxapp/model/report.dart';
import 'package:waxapp/providers/settings_provider.dart';
import 'package:waxapp/screens/settings.dart';
import 'package:waxapp/service/firestore_service.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    var reports = Provider.of<List<Report>>(context)
        .where((element) => settingsProvider.waxLines.contains(element.line))
        .toList();

    FireStoreService _db = FireStoreService();
    return Scaffold(
      appBar: AppBar(
        title: Text('Wax App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Settings()));
              })
        ],
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, int index) {
          Report report = reports[index];
          return ListTile(

            leading: Text(report.temp.toString()),
            title: Text(report.wax),
            subtitle: Text(report.line),
            trailing: Text(
                formatDate(DateTime.parse(report.timeStamp), [HH, ":", nn])),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _db.addReport();
        },
      ),
    );
  }
}
