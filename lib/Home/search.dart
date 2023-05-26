// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

// class MyApp extends StatefulWidget {
//   final String? name;
//   const MyApp({super.key, this.name});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String name = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder<QuerySnapshot>(
//       stream:
//           FirebaseFirestore.instance.collection('Organic Fruits').snapshots(),
//       builder: (context, snapshots) {
//         return (snapshots.connectionState == ConnectionState.waiting)
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : ListView.builder(
//                 itemCount: snapshots.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   var data = snapshots.data!.docs[index].data()
//                       as Map<String, dynamic>;

//                   if (name.isEmpty) {
//                     return ListTile(
//                       title: Text(
//                         data['title'],
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             color: Colors.black54,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         data['price'],
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             color: Colors.black54,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(data['image']),
//                       ),
//                     );
//                   }
//                   if (data['title']
//                       .toString()
//                       .toLowerCase()
//                       .startsWith(name.toLowerCase())) {
//                     return ListTile(
//                       title: Text(
//                         data['title'],
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             color: Colors.black54,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         data['price'],
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             color: Colors.black54,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(data['image']),
//                       ),
//                     );
//                   }
//                   return Container();
//                 });
//       },
//     ));
//   }
// }
