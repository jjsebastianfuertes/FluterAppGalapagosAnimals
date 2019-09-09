import 'package:flutter/material.dart';
import 'package:galapagos_species/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  //set boolean variables
  var _isEndemic = false;
  var _isMarine = false;
  var _isSummer = false;

  @override
  initState() {
    _isEndemic = widget.currentFilters['endemic'];
    _isMarine = widget.currentFilters['marine'];
    _isSummer = widget.currentFilters['summer'];

    super.initState();
  }

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                'endemic': _isEndemic,
                'marine': _isMarine,
                'summer': _isSummer,
              };
              widget.saveFilters(selectedFilter);
            },
          ),
        ],
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
