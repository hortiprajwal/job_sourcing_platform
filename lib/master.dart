import 'package:flutter/material.dart';
import 'package:job_sourcing_platform/applications.dart';
import 'package:job_sourcing_platform/data.dart';
import 'package:job_sourcing_platform/jobs.dart';


class Master extends StatefulWidget {
  const Master({Key? key}) : super(key: key);

  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {

  List<NavigationItem> navigationItems = getNavigationItemList();
  late NavigationItem selectedItem;

  late Widget currentWidgetView;

  Widget buildTile(IconData icon, String type) {
    return Expanded(
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 25.0,
        ),
        title: Text(
          '$type',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
      currentWidgetView = const Jobs();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Sourcing Platform'),
        centerTitle: true,
        elevation: 0.0,
        actions: const [
          Icon(Icons.search),
          Icon(Icons.sort_outlined),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueAccent,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Expanded(
              child: Container(
                height: 230.0,
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
                child: DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/apple.png'),
                      ),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Apple',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            buildTile(Icons.account_box_outlined, 'Profile'),
            buildTile(Icons.home_outlined, 'Address'),
            buildTile(Icons.favorite_outline_rounded, 'Rate Us'),
            buildTile(Icons.email_outlined, 'Contact Us'),
            MaterialButton(
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              hoverElevation: 10.0,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              onPressed: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: currentWidgetView,
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavigationItems(),
        ),
      ),
    );
  }

  List<Widget> buildNavigationItems(){
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item){
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (item.title){
            case "Jobs": currentWidgetView = const Jobs(); break;
            case "Applications": currentWidgetView = const Applications(); break;
          }
          selectedItem = item;
        });
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: selectedItem == item ? 1.0 : 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            selectedItem == item
                ? Column(
              children: <Widget>[

                const SizedBox(
                  height: 4,
                ),

                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),

              ],
            )
                : Container(),

          ],
        ),
      ),
    );
  }

}