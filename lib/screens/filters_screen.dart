import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/filters_provider.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/_filters';

  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitchListTile(String title, String subTitle, bool boolValue,
      void Function(bool) changValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: boolValue,
        onChanged: changValue);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, bool> filters =
        Provider.of<FiltersProvider>(context).filters;
    Function setFilters =
        Provider.of<FiltersProvider>(context).setFilters;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        /*actions: [
          FilledButton.icon(
              onPressed: () {
                Provider.of<FiltersProvider>(context, listen: false)
                    .setFilters();
              },
              icon: const Icon(Icons.save),
              label: const Text('Save'))
        ],*/
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text('Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          _buildSwitchListTile('Gluten-free', 'Only include gluten-free meals',
              filters['gluten']!, (newValue) {
            setState(() {
              filters['gluten'] = newValue;
            });
            setFilters();
          }),
          _buildSwitchListTile('Vegetarian', 'Only include vegetarian meals',
              filters['vegetarian']!, (newValue) {
            setState(() {
              filters['vegetarian'] = newValue;
            });
            setFilters();
              }),
          _buildSwitchListTile(
              'Vegan', 'Only include vegan meals', filters['vegan']!,
              (newValue) {
            setState(() {
              filters['vegan'] = newValue;
            });
            setFilters();
          }),
          _buildSwitchListTile(
              'Lactose-free',
              'Only include lactose-free meals',
              filters['lactose']!, (newValue) {
            setState(() {
              filters['lactose'] = newValue;
            });
            setFilters();
          }),
        ],
      ),
    );
  }
}
