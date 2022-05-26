import 'package:flutter/material.dart';

// void _navigateToProfileScreen(context) {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final User? user = _auth.currentUser;
//   final uid = user!.uid;
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (context) => ProfileScreen(
//         userID: uid,
//       ),
//     ),
//   );
// }

void navigatefinish({context, required Widget screen}) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      (Route<dynamic> route) => false);
}

void navigateback(context) {
  Navigator.canPop(context) ? Navigator.pop(context) : null;
}

void navigateto({context, required Widget screen}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

  // void _navigateToTaskScreen(context) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => TasksScreen(),
  //     ),
  //   );
  // }
// void _logout(context) {
//   // final FirebaseAuth _auth = FirebaseAuth.instance;
//   showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image.network(
//                   'https://image.flaticon.com/icons/png/128/1252/1252006.png',
//                   height: 20,
//                   width: 20,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('Sign out'),
//               ),
//             ],
//           ),
//           content: Text(
//             'Do you wanna Sign out',
//             style: TextStyle(
//                 color: secondcolor, fontSize: 20, fontStyle: FontStyle.italic),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.canPop(context) ? Navigator.pop(context) : null;
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//                 onPressed: () async {
//                   await _auth.signOut();
//                   Navigator.canPop(context) ? Navigator.pop(context) : null;
//                   // Navigator.of(context).pushReplacement(
//                   //   MaterialPageRoute(
//                   //     builder: (ctx) => UserState(),
//                   //   ),
//                   // );
//                 },
//                 child: Text(
//                   'OK',
//                   style: TextStyle(color: Colors.red),
//                 ))
//           ],
//         );
//       });
// }
