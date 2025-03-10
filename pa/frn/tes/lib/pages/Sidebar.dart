import 'package:flutter/material.dart';
import 'package:tes/pages/bimbingan.dart';
import 'package:tes/pages/dokumen.dart';
import 'package:tes/pages/login_page.dart';


class Sidebar extends StatelessWidget {
  const Sidebar({Key?key}): super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: const Text('VokasiTera'),
      backgroundColor: const Color.fromARGB(255, 232, 234, 237),
    ),
    drawer: const NavigationDrawer(),
    body: Column(
      children: [
        const Padding(
          padding: const EdgeInsets.all(30),
        child: Divider(color: Colors.black),
       
        ),
      ]
    ),
  );
}
 class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          Expanded(child: buildMenuItems(context)),
        ]
      ),
    );
}

Widget buildHeader(BuildContext context) => Container(
  color: const Color.fromARGB(255, 15, 82, 206),
  padding: EdgeInsets.only(
    top: MediaQuery.of(context).padding.top,
  ),
  child: Column(
    children: const [
      CircleAvatar(
        radius: 50,
        backgroundImage:AssetImage('assets/images/profile.jpg'),
      ),
      SizedBox(height: 5),
      Text('Kelompok 5')
    ],
  ),

);
Widget buildMenuItems(BuildContext context) => Column(
  children: [
    ListTile(
      leading: const Icon(Icons.home_filled),
      title: const Text('Home'),
      onTap: () {},
    ),
    ListTile(
      leading: const Icon(Icons.home_filled),
      title: const Text('Request Bimbingan'),
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => const Bimbingan() ));
      },
    ),
    ListTile(
      leading: const Icon(Icons.home_filled),
      title: const Text('Dokumen'),
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) =>  UploadDocumentApp() ));
      },
    ),
      ListTile(
      leading: const Icon(Icons.notifications),
      title: const Text('Notifikasi'),
      onTap: () {
      },
    ),
    
    const Spacer(),
    const Divider(),
    ListTile(
      leading: const Icon(Icons.logout,color: Colors.black),
      title: const Text('Log Out'),
      onTap: () {
         Navigator.push(context,
         MaterialPageRoute(builder: (context) => const LoginPage() ));
      },
    )
  ],
);

