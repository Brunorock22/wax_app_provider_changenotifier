import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:waxapp/providers/settings_provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Units'),
                DropdownButton<String>(
                  value: settingsProvider.units,
                  onChanged: (String value) {
                    settingsProvider.setUnits(value);
                  },
                  items: <String>['Imperial', 'Metric']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Wax Lines'),
                Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: [
                      FilterChip(
                          label: Text(
                            'Swix',
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          selected: (settingsProvider.waxLines.contains('Swix'))
                              ? true
                              : false,
                          onSelected: (bool value) {
                            if (value == true) {
                              settingsProvider.addWaxLine('Swix');
                            } else {
                              settingsProvider.removeWaxLine('Swix');
                            }
                          }),
                      FilterChip(
                          label: Text(
                            'Toko',
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          selected: settingsProvider.waxLines.contains('Toko'),
                          onSelected: (bool value) {
                            if (value == true) {
                              settingsProvider.addWaxLine('Toko');
                            } else {
                              settingsProvider.removeWaxLine('Toko');
                            }
                          }),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
