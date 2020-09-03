import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waxapp/model/report.dart';

class FireStoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  var rando = Random();

  Stream<List<Report>> getReports() {
    return _db
        .collection('reports')
        .orderBy('timeStamp', descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((document) => Report.fromJson(document.data()))
            .toList());
  }

  Future<void> addReport() {
    var temp = next(-15, 5);
    var line = (temp < -5) ? 'Swix' : 'Toko';
    var wax = (temp.isEven) ? 'Red' : 'Green';

    var dataMap = Map<String, dynamic>();
    dataMap['line'] = line;
    dataMap['wax'] = wax;
    dataMap['temp'] = temp;
    dataMap['timeStamp'] = DateTime.now().toIso8601String();
    return _db.collection('reports').add(dataMap);
  }

  int next(int min, int max) => min + rando.nextInt(max - min);
}
