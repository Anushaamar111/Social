// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/Database/Firestore.dart';
// import 'package:todo_app/components.dart/MyDrawer.dart';
// import 'package:todo_app/components.dart/postButton.dart';
// import 'package:todo_app/components.dart/textfield.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   final FirestoreDatabase database = FirestoreDatabase();
//   final TextEditingController newPostController = TextEditingController();
//   void postMessage() {
//     if (newPostController.text.isNotEmpty) {
//       String message = newPostController.text;
//       database.addPost(message);
//     }
//     newPostController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).canvasColor,
//         elevation: 30,
//         title: const Padding(
//           padding: EdgeInsets.only(right: 30.0),
//           child: Center(
//               child: Text(
//             'F E E D',
//             style: TextStyle(
//                 fontWeight: FontWeight.w200,
//                 fontSize: 30,
//                 color: Colors.amberAccent),
//           )),
//         ),
//       ),
//       drawer: const MyDrawer(),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: MyTextField(
//                     hintText: "What's on your mind?",
//                     obscureText: false,
//                     controller: newPostController,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 15.0),
//                 child: PostButton(
//                   onTap: postMessage,
//                 ),
//               ),
//               StreamBuilder(
//                   stream: database.getPostsStream(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {

//                       return Center(child: CircularProgressIndicator());
//                     }
//                     final posts = snapshot.data!.docs;
//                     if (snapshot.data == null || posts.isEmpty) {
//                       return const Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(25.0),
//                           child: Text('Post something....'),
//                         ),
//                       );
//                     }
//                     return Expanded(
//                       child: ListView.builder(
//                           itemCount: posts.length,
//                           itemBuilder: (context, index) {
//                             final post = posts[index];
//                             // get data from each post
//                             String message = post['PostMessage'];
//                             String userEmail = post['UserEmail'];
//                             Timestamp timestamp = post['TimeStamp'];

//                             return ListTile(
//                               title: Text(message),
//                               subtitle: Text(userEmail),
//                             );
//                           }),
//                     );
//                   })
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/Database/Firestore.dart';
// import 'package:todo_app/components.dart/MyDrawer.dart';
// import 'package:todo_app/components.dart/PostButton.dart';
// import 'package:todo_app/components.dart/textfield.dart';

// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);

//   final FirestoreDatabase database = FirestoreDatabase();
//   final TextEditingController newPostController = TextEditingController();

//   void postMessage() {
//     if (newPostController.text.isNotEmpty) {
//       String message = newPostController.text;
//       database.addPost(message);
//       newPostController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).canvasColor,
//         elevation: 30,
//         title: const Padding(
//           padding: EdgeInsets.only(right: 30.0),
//           child: Center(
//             child: Text(
//               'F E E D',
//               style: TextStyle(
//                 fontWeight: FontWeight.w200,
//                 fontSize: 30,
//                 color: Colors.amberAccent,
//               ),
//             ),
//           ),
//         ),
//       ),
//       drawer: const MyDrawer(),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: MyTextField(
//                     hintText: "What's on your mind?",
//                     obscureText: false,
//                     controller: newPostController,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 15.0),
//                 child: PostButton(
//                   onTap: postMessage,
//                 ),
//               ),
//             ],
//           ),
//           // Expanded(
//           //   child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>?>(
//           //     stream: database.getPostsStream(),
//           //     builder: (context, snapshot) {
//           //       if (snapshot.connectionState == ConnectionState.waiting) {
//           //         return const Center(child: CircularProgressIndicator());
//           //       }

//           //       final posts = snapshot.data!.docs;

//           //       if (posts.isEmpty) {
//           //         return Center(child: Text('No posts'));
//           //       }
//           //     }
//           //   )
//           // )
//           Expanded(
//             child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>?>(
//               stream: database.getPostsStream(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }

//                 final posts = snapshot.data?.docs;

//                 if (posts == null || posts.isEmpty) {
//                   return Center(child: Text('No posts'));
//                 }

//                 return ListView.builder(
//                   itemCount: posts.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final post = posts[index];

//                     String message = post['PostMessage'];
//                     String userEmail = post['UserEmail'];
//                     Timestamp timestamp = post['TimeStamp'];

//                     return ListTile(
//                       title: Text(message),
//                       subtitle: Text(userEmail),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/Database/Firestore.dart';
// import 'package:todo_app/components.dart/MyDrawer.dart';
// import 'package:todo_app/components.dart/PostButton.dart';

// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);

//   final FirestoreDatabase database = FirestoreDatabase();
//   final TextEditingController newPostController = TextEditingController();

//   void postMessage() {
//     if (newPostController.text.isNotEmpty) {
//       String message = newPostController.text;
//       database.addPost(message);
//       newPostController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).canvasColor,
//         elevation: 30,
//         title: const Padding(
//           padding: EdgeInsets.only(right: 30.0),
//           child: Center(
//             child: Text(
//               'F E E D',
//               style: TextStyle(
//                 fontWeight: FontWeight.w200,
//                 fontSize: 30,
//                 color: Colors.amberAccent,
//               ),
//             ),
//           ),
//         ),
//       ),
//       drawer: const MyDrawer(),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: MyTextField(
//                     hintText: "What's on your mind?",
//                     obscureText: false,
//                     controller: newPostController,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 15.0),
//                 child: PostButton(
//                   onTap: postMessage,
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>?>(
//               stream: database.getPostsStream(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }

//                 final posts = snapshot.data?.docs;

//                 if (posts == null || posts.isEmpty) {
//                   return const Center(
//                     child: Padding(
//                       padding: EdgeInsets.all(25.0),
//                       child: Text('Post something....'),
//                     ),
//                   );
//                 }

//                 return ListView.builder(
//                   itemCount: posts.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final post = posts[index];

//                     String message = post['PostMessage'];
//                     String userEmail = post['UserEmail'];
//                     Timestamp timestamp = post['TimeStamp'];

//                     return ListTile(
//                       title: Text(message),
//                       subtitle: Text(userEmail),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/Database/Firestore.dart';
// import 'package:todo_app/components.dart/MyDrawer.dart';
// import 'package:todo_app/components.dart/PostButton.dart';
// import 'package:todo_app/components.dart/my_list_tile.dart';

// import '../components.dart/textfield.dart';

// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);

//   final FirestoreDatabase database = FirestoreDatabase();
//   final TextEditingController newPostController = TextEditingController();

//   void postMessage() {
//     if (newPostController.text.isNotEmpty) {
//       String message = newPostController.text;
//       database.addPost(message);
//       newPostController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).canvasColor,
//         elevation: 30,
//         title: const Padding(
//           padding: EdgeInsets.only(right: 30.0),
//           child: Center(
//             child: Text(
//               'F E E D',
//               style: TextStyle(
//                 fontWeight: FontWeight.w200,
//                 fontSize: 30,
//                 color: Colors.amberAccent,
//               ),
//             ),
//           ),
//         ),
//       ),
//       drawer: const MyDrawer(),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: MyTextField(
//                     hintText: "What's on your mind?",
//                     obscureText: false,
//                     controller: newPostController,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 15.0),
//                 child: PostButton(
//                   onTap: postMessage,
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>?>(
//               stream: database.getPostsStream(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }

//                 final posts = snapshot.data?.docs;

//                 if (posts == null || posts.isEmpty) {
//                   print('DEBUG: No posts available');
//                   return const Center(
//                     child: Padding(
//                       padding: EdgeInsets.all(25.0),
//                       child: Text('Post something....'),
//                     ),
//                   );
//                 }

//                 print('DEBUG: Number of posts: ${posts.length}');

//                 return ListView.builder(
//                   itemCount: posts.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final post = posts[index];

//                     String message = post['message'];
//                     String userEmail = post['email'];
//                     Timestamp timestamp = post['Timestamp'];

//                     return MyListTile(title: message, subtitle: userEmail);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/Database/Firestore.dart';
import 'package:todo_app/components.dart/MyDrawer.dart';
import 'package:todo_app/components.dart/PostButton.dart';
import 'package:todo_app/components.dart/my_list_tile.dart';
import 'package:todo_app/components.dart/textfield.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreDatabase database = FirestoreDatabase();
  final TextEditingController newPostController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  void postMessage() {
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message, imageUrl: _image?.path);
      newPostController.clear();
      setState(() {
        _image = null;
      });
    }
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 30,
        title: const Padding(
          padding: EdgeInsets.only(right: 30.0),
          child: Center(
            child: Text(
              'F E E D',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 30,
                color: Colors.amberAccent,
              ),
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: MyTextField(
                    hintText: "What's on your mind?",
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.photo),
                      onPressed: _getImage,
                    ),
                    PostButton(
                      onTap: postMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
          _image != null
              ? Image.file(_image!)
              : Container(), // Display selected image
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>?>(
              stream: database.getPostsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final posts = snapshot.data?.docs;

                if (posts == null || posts.isEmpty) {
                  print('DEBUG: No posts available');
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text('Post something....'),
                    ),
                  );
                }

                print('DEBUG: Number of posts: ${posts.length}');

                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final post = posts[index];

                    String message = post['message'];
                    String userEmail = post['email'];
                    Timestamp timestamp = post['Timestamp'];

                    return MyListTile(title: message, subtitle: userEmail);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:todo_app/Database/Firestore.dart';
// import 'package:todo_app/components.dart/MyDrawer.dart';
// import 'package:todo_app/components.dart/PostButton.dart';
// import 'package:todo_app/components.dart/my_list_tile.dart';
// import 'package:todo_app/components.dart/textfield.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final FirestoreDatabase database = FirestoreDatabase();
//   final TextEditingController newPostController = TextEditingController();
//   File? _image;
//   File? _video;
//   final picker = ImagePicker();
//   late VideoPlayerController _videoController;
//   late ChewieController _chewieController;

//   void postMessage() {
//     if (newPostController.text.isNotEmpty) {
//       String message = newPostController.text;
//       database.addPost(message, imageUrl: _image?.path, videoUrl: _video?.path);
//       newPostController.clear();
//       setState(() {
//         _image = null;
//         _videoController.dispose();
//         _chewieController.dispose();
//       });
//     }
//   }

//   Future<void> _getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future<void> _getVideo() async {
//     final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _video = File(pickedFile.path);
//         _videoController = _video!.path.startsWith('http')
//             ? VideoPlayerController.network(_video!.path)
//             : VideoPlayerController.file(_video!)
//           ..initialize().then((_) {
//             setState(() {
//               _chewieController = ChewieController(
//                 videoPlayerController: _videoController,
//                 autoPlay: true,
//                 looping: true,
//               );
//             });
//           });
//       } else {
//         print('No video selected.');
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _videoController = VideoPlayerController.network(
//         'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4' )
//       ..initialize().then((_) {
//         setState(() {
//           _chewieController = ChewieController(
//             videoPlayerController: _videoController,
//             autoPlay: true,
//             looping: true,
//           );
//         });
//       });
//   }

//   @override
//   void dispose() {
//     _videoController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).canvasColor,
//         elevation: 30,
//         title: const Padding(
//           padding: EdgeInsets.only(right: 30.0),
//           child: Center(
//             child: Text(
//               'F E E D',
//               style: TextStyle(
//                 fontWeight: FontWeight.w200,
//                 fontSize: 30,
//                 color: Colors.amberAccent,
//               ),
//             ),
//           ),
//         ),
//       ),
//       drawer: const MyDrawer(),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: MyTextField(
//                     hintText: "What's on your mind?",
//                     obscureText: false,
//                     controller: newPostController,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 15.0),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.photo),
//                       onPressed: _getImage,
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.videocam),
//                       onPressed: _getVideo,
//                     ),
//                     PostButton(
//                       onTap: postMessage,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           _image != null
//               ? Image.file(_image!)
//               : Container(), // Display selected image
//           _video != null
//               ? Chewie(controller: _chewieController)
//               : Container(), // Display selected video
//           Expanded(
//             child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>?>(
//               stream: database.getPostsStream(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }

//                 final posts = snapshot.data?.docs;

//                 if (posts == null || posts.isEmpty) {
//                   print('DEBUG: No posts available');
//                   return const Center(
//                     child: Padding(
//                       padding: EdgeInsets.all(25.0),
//                       child: Text('Post something....'),
//                     ),
//                   );
//                 }

//                 print('DEBUG: Number of posts: ${posts.length}');

//                 return ListView.builder(
//                   itemCount: posts.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final post = posts[index];

//                     String message = post['message'];
//                     String userEmail = post['email'];
//                     Timestamp timestamp = post['Timestamp'];
//                      String? imageUrl = post['imageUrl'];
//                     String? videoUrl = post['videoUrl'];

//                     return MyListTile(title: message, subtitle: userEmail, imageUrl: imageUrl,
//                       videoUrl: videoUrl,);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:todo_app/Database/Firestore.dart';
// import 'package:todo_app/components.dart/MyDrawer.dart';
// import 'package:todo_app/components.dart/PostButton.dart';
// import 'package:todo_app/components.dart/my_list_tile.dart';
// import 'package:todo_app/components.dart/textfield.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final FirestoreDatabase database = FirestoreDatabase();
//   final TextEditingController newPostController = TextEditingController();
//   File? _image;
//   File? _video;
//   final picker = ImagePicker();
//   late VideoPlayerController _videoController;
//   late ChewieController _chewieController;

//   void postMessage() {
//     if (newPostController.text.isNotEmpty) {
//       String message = newPostController.text;
//       database.addPost(message, imageUrl: _image?.path, videoUrl: _video?.path);
//       newPostController.clear();
//       setState(() {
//         _image = null;
//         _videoController.dispose();
//         _chewieController.dispose();
//       });
//     }
//   }

//   Future<void> _getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         _video = null; // Clear previous video if any
//         _videoController.dispose();
//         _chewieController.dispose();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future<void> _getVideo() async {
//     final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _video = File(pickedFile.path);
//         _image = null; // Clear previous image if any
//         _videoController = VideoPlayerController.file(_video!)
//           ..initialize().then((_) {
//             setState(() {
//               _chewieController = ChewieController(
//                 videoPlayerController: _videoController,
//                 autoPlay: true,
//                 looping: true,
//               );
//             });
//           });
//       } else {
//         print('No video selected.');
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _videoController = VideoPlayerController.network(
//         'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
//       ..initialize().then((_) {
//         setState(() {
//           _chewieController = ChewieController(
//             videoPlayerController: _videoController,
//             autoPlay: true,
//             looping: true,
//           );
//         });
//       });
//   }

//   @override
//   void dispose() {
//     _videoController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).canvasColor,
//         elevation: 30,
//         title: const Padding(
//           padding: EdgeInsets.only(right: 30.0),
//           child: Center(
//             child: Text(
//               'F E E D',
//               style: TextStyle(
//                 fontWeight: FontWeight.w200,
//                 fontSize: 30,
//                 color: Colors.amberAccent,
//               ),
//             ),
//           ),
//         ),
//       ),
//       drawer: const MyDrawer(),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: MyTextField(
//                     hintText: "What's on your mind?",
//                     obscureText: false,
//                     controller: newPostController,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 15.0),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.photo),
//                       onPressed: _getImage,
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.videocam),
//                       onPressed: _getVideo,
//                     ),
//                     PostButton(
//                       onTap: postMessage,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           _image != null
//               ? Image.file(_image!)
//               : Container(), // Display selected image
//           _video != null
//               ? Chewie(controller: _chewieController)
//               : Container(), // Display selected video
//           Expanded(
//             child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>?>(
//               stream: database.getPostsStream(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }

//                 final posts = snapshot.data?.docs;

//                 if (posts == null || posts.isEmpty) {
//                   print('DEBUG: No posts available');
//                   return const Center(
//                     child: Padding(
//                       padding: EdgeInsets.all(25.0),
//                       child: Text('Post something....'),
//                     ),
//                   );
//                 }

//                 print('DEBUG: Number of posts: ${posts.length}');

//                 return ListView.builder(
//                   itemCount: posts.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final post = posts[index];

//                     String message = post['message'];
//                     String userEmail = post['email'];
//                     Timestamp timestamp = post['Timestamp'];
//                     String? imageUrl = post['imageUrl'];
//                     String? videoUrl = post['videoUrl'];

//                     return MyListTile(
//                       title: message,
//                       subtitle: userEmail,
//                       imageUrl: imageUrl,
//                       videoUrl: videoUrl,
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

