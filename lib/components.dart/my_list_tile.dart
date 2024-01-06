// import 'package:flutter/material.dart';

// class MyListTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String? imageUrl;
//   final String? videoUrl;
//   const MyListTile({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     this.imageUrl,
//     this.videoUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
//       child: ListTile(
//         shape: const Border(
//             bottom: BorderSide(color: Colors.black54),
//             top: BorderSide(color: Colors.black54),
//             left: BorderSide(color: Colors.black54),
//             right: BorderSide(color: Colors.black54)),
//         title: Text(
//           title,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(subtitle),
//         leading: Container(
//           child: imageUrl != null
//               ? Image.network(imageUrl!, fit: BoxFit.cover)
//               : videoUrl != null
//                   ? Image.asset('assets/video_thumbnail.png', fit: BoxFit.cover)
//                   : Icon(Icons.error),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class MyListTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String? imageUrl;
//   final String? videoUrl;

//   const MyListTile({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     this.imageUrl,
//     this.videoUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
//       child: ListTile(
//         shape: const Border(
//           bottom: BorderSide(color: Colors.black54),
//           top: BorderSide(color: Colors.black54),
//           left: BorderSide(color: Colors.black54),
//           right: BorderSide(color: Colors.black54),
//         ),
//         title: Text(
//           title,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(subtitle),
//                imageUrl != null
//               ? Image.network(imageUrl!, fit: BoxFit.cover)
//               : videoUrl != null
//                   ? Image.asset('assets/video_thumbnail.png', fit: BoxFit.cover)
//                   : Icon(Icons.error),

//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class MyListTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String? imageUrl;
//   final String? videoUrl;

//   const MyListTile({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     this.imageUrl,
//     this.videoUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
//       child: ListTile(
//         shape: const Border(
//           bottom: BorderSide(color: Colors.black54),
//           top: BorderSide(color: Colors.black54),
//           left: BorderSide(color: Colors.black54),
//           right: BorderSide(color: Colors.black54),
//         ),
//         title: Text(
//           title,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(subtitle),
//         // Use a Row to display the text and image or video
//         // based on the conditions
//         trailing: Row(
//           children: [
//             if (imageUrl != null)
//               Image.network(
//                 imageUrl!,
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               ),
//             if (videoUrl != null)
//               Image.asset(
//                 'assets/video_thumbnail.png',
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class MyListTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String? imageUrl;
//   final String? videoUrl;

//   const MyListTile({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     this.imageUrl,
//     this.videoUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
//       child: ListTile(
//         shape: const Border(
//           bottom: BorderSide(color: Colors.black54),
//           top: BorderSide(color: Colors.black54),
//           left: BorderSide(color: Colors.black54),
//           right: BorderSide(color: Colors.black54),
//         ),
//         title: Text(
//           title,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(subtitle),
//         // Wrap the Row with a Container to specify a width
//         trailing: Container(
//           width: 100, // Adjust the width as needed
//           child: Row(
//             children: [
//               if (imageUrl != null)
//                 Image.network(
//                   imageUrl!,
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//               if (videoUrl != null)
//                 Image.asset(
//                   'assets/video_thumbnail.png',
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class MyListTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final DocumentSnapshot<Map<String, dynamic>> postSnapshot;

//   const MyListTile({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     required this.postSnapshot, String? videoUrl, String? imageUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final imageUrl = postSnapshot['imageUrl'] as String?;
//     final videoUrl = postSnapshot['videoUrl'] as String?;

//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
//       child: ListTile(
//         shape: const Border(
//           bottom: BorderSide(color: Colors.black54),
//           top: BorderSide(color: Colors.black54),
//           left: BorderSide(color: Colors.black54),
//           right: BorderSide(color: Colors.black54),
//         ),
//         title: Text(
//           title,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(subtitle),
//         // Wrap the Row with a Container to specify a width
//         trailing: Container(
//           width: 100, // Adjust the width as needed
//           child: Row(
//             children: [
//               if (imageUrl != null)
//                 Image.network(
//                   imageUrl,
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//               if (videoUrl != null)
//                 Image.asset(
//                   'assets/video_thumbnail.png',
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final String? videoUrl;

  const MyListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
    this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: ListTile(
        shape: const Border(
          bottom: BorderSide(color: Colors.black54),
          top: BorderSide(color: Colors.black54),
          left: BorderSide(color: Colors.black54),
          right: BorderSide(color: Colors.black54),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
