import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scafoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scafoldKey,
        appBar: AppBar(
          title: const Text('Widgets en Flutter'),
        ),
        body: const _HomeView(),
        drawer: SideMenu(scafolKey: scafoldKey,));
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem =
            appMenuItems[index]; //esta es una instanacia del menuItem
        return _CustomListTile(
            menuItem: menuItem); //mando la instancia para la lista
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTile({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        //Navigator.pushNamed(context, menuItem.link);
        context.push(menuItem.link);
        //context.pushNamed(CardsScreen.name);
      },
    );
  }
}
