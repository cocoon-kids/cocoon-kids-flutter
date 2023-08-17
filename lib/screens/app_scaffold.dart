import 'package:cocoon_kids_flutter/navigation/router.dart';
import 'package:cocoon_kids_flutter/screens/homepage/urgent_options_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatefulWidget {
  final Color backgroundColor;
  final String? title;
  final Widget body;

  const AppScaffold({
    super.key,
    this.title,
    this.backgroundColor = Colors.white,
    required this.body
  });

  @override
  State<StatefulWidget> createState() {
    return _AppScaffoldState();
  }
}

class _TextAndIcon {
  final String text;
  final IconData icon;

  _TextAndIcon(this.text, this.icon);
}

class _AppScaffoldState extends State<AppScaffold> {
  final navBarOptions = [
    _TextAndIcon("Home", Icons.home),
    _TextAndIcon("Contact", Icons.contact_page_outlined,),
    _TextAndIcon("Games", Icons.games,),
    _TextAndIcon("About", Icons.info ,),
  ];

  BottomNavigationBarItem _createBottomNavItem(String label, IconData iconData) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    final int selectedIndex;
    if (location == "/") {
      selectedIndex = 0;
    } else if (location == "/contact") {
      selectedIndex = 1;
    } else if (location == "/about") {
      selectedIndex = 3;
    } else if (location == "/games") {
      selectedIndex = 2;
    } else {
      selectedIndex = -1;
    }

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  UrgentOptionsView(),
                  const SizedBox(height: 8),
                  Expanded(child: widget.body),
                ],
              )
          )
      ),
      appBar: widget.title == null ? null : AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title!),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          switch(navBarOptions[i].text) {
            case "Home":
              router.go("/");
              break;
            case "Contact":
              router.go("/contact");
              break;
            case "Videos":
              router.go("/videos");
              break;
            case "Games":
              router.go("/games");
              break;
            case "About":
              router.go("/about");
              break;
          }
        },
        selectedItemColor: selectedIndex < 0 ? Colors.grey : Theme.of(context).colorScheme.primary,
        currentIndex: selectedIndex < 0 ? 0 : selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: navBarOptions.map((e) => _createBottomNavItem(e.text, e.icon))
            .toList()
      ),
    );
  }
}