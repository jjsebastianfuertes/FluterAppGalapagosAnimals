import 'package:flutter/material.dart';
import 'package:galapagos_species/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  //set boolean variables
  var _isEndemic = false;
  var _isMarine = false;
  var _isSummer = false;

  Widget _buildSwitchListTitle(
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your searching',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTitle(
                    'Endemic', 'Only included endemic animals.', _isEndemic,
                    (newValue) {
                  setState(() {
                    _isEndemic = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Marine', 'Only included marine animals.', _isMarine,
                    (newValue) {
                  setState(() {
                    _isMarine = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Summer',
                    'Only included animals reached during summer season.',
                    _isSummer, (newValue) {
                  setState(() {
                    _isSummer = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
