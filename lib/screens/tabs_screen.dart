import 'package:flutter/material.dart';
import 'package:multi_telas/components/main_drawer.dart';

import 'package:multi_telas/screens/category_screen.dart';
import 'package:multi_telas/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screen = [
    {'title': 'Lista de Categorias', 'screen': const CategoryScreen()},
    {'title': 'Meus Favoritos', 'screen': const FavoriteScreen()},
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //PRIMEIRA OPÇÃO DENTRO DO APPBAR
    /*
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamos Conzinhar?'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritas',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoryScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );*/

    //SEGUNDA OPÇÃO ABAIXO
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (_screen[_selectedScreenIndex]['title']) as String,
        ),
      ),
      drawer: const MainDrawer(),
      body: (_screen[_selectedScreenIndex]['screen']) as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color.fromARGB(255, 173, 173, 173),
        selectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
