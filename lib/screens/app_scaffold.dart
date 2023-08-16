import 'package:cocoon_kids_flutter/navigation/router.dart';
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

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    final int selectedIndex;
    if (location == "/") {
      selectedIndex = 0;
    } else if (location == "/contact") {
      selectedIndex = 1;
    } else if (location == "/about") {
      selectedIndex = 2;
    } else {
      selectedIndex = -1;
    }

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: widget.body
          )
      ),
      appBar: widget.title == null ? null : AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title!),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          switch(i) {
            case 0:
              router.go("/");
              break;
            case 1:
              router.go("/contact");
              break;
            case 2:
              router.go("/about");
          }
        },
        selectedItemColor: selectedIndex < 0 ? Colors.grey : Theme.of(context).colorScheme.primary,
        currentIndex: selectedIndex < 0 ? 0 : selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_outlined),
            label: "Contact",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About",
          )
        ],
      ),
    );
  }
}