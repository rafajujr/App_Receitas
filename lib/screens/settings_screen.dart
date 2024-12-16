import 'package:flutter/material.dart';
import 'package:multi_telas/components/main_drawer.dart';
import 'package:multi_telas/models/setting.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingChanged;
  const SettingsScreen(this.onSettingChanged, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                  'Sem Glútem',
                  'Só exibe refeições sem glúten',
                  settings.isGlutenFree,
                  (value) => setState(() {
                    settings.isGlutenFree = value;
                  }),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem Lactose',
                  settings.isLactoseFree,
                  (value) => setState(() {
                    settings.isLactoseFree = value;
                  }),
                ),
                _createSwitch(
                  'veganas',
                  'Só exibe refeições veganas',
                  settings.isVegan,
                  (value) => setState(() {
                    settings.isVegan = value;
                  }),
                ),
                _createSwitch(
                  'Vegetarianas',
                  'Só exibe refeições sem vegatarianas',
                  settings.isVegetarian,
                  (value) => setState(() {
                    settings.isVegetarian = value;
                  }),
                )
              ],
            ))
          ],
        ));
  }
}
