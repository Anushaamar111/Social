// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/helper.dart/helper_functions.dart';

// class UserList extends StatelessWidget {
//   const UserList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('F R I E N D S'),
//         ),
//         backgroundColor: Theme.of(context).primaryColor,
//         body: StreamBuilder(
//             stream: FirebaseFirestore.instance.collection('users').snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 messageToUser('Something went wrong', context);
//               }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.data == null) {
//                 return Text('No data');
//               }
//               final users = snapshot.data!.docs;
//               return ListView.builder(
//                   itemCount: users.length,
//                   itemBuilder: (context, index) {
//                     final User = users[index];
//                     return ListTile(
//                       title: Text(User['username']),
//                       subtitle: Text(User['email']),
//                     );
//                   });
//             }));
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/helper.dart/helper_functions.dart';

// class UserList extends StatelessWidget {
//   const UserList({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('users').snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               messageToUser('Something went wrong', context);
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.data == null) {
//               return Text('No data');
//             }
//             final users = snapshot.data!.docs;
//             int userCount = users.length;

//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('F R I E N D S'),
//                 Text('$userCount Users'),
//               ],
//             );
//           },
//         ),
//       ),
//       backgroundColor: Theme.of(context).primaryColor,
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             messageToUser('Something went wrong', context);
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.data == null) {
//             return Text('No data');
//           }
//           final users = snapshot.data!.docs;
//           return ListView.builder(
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               final User = users[index];
//               return ListTile(
//                 title: Text(User['username']),
//                 subtitle: Text(User['email']),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/helper.dart/helper_functions.dart';

// class UserList extends StatelessWidget {
//   const UserList({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('users').snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               messageToUser('Something went wrong', context);
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             int userCount = snapshot.data?.docs.length ?? 0;

//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('F R I E N D S'),
//                 Text('$userCount Users'),
//               ],
//             );
//           },
//         ),
//       ),
//       backgroundColor: Theme.of(context).primaryColor,
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             messageToUser('Something went wrong', context);
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           final users = snapshot.data?.docs ?? [];

//           return ListView.builder(
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               final User = users[index];
//               return ListTile(
//                 title: Text(User['username']),
//                 subtitle: Text(User['email']),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/helper.dart/helper_functions.dart';

// class UserList extends StatelessWidget {
//   const UserList({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('users').snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               messageToUser('Something went wrong', context);
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             int userCount = snapshot.data?.docs.length ?? 0;

//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('F R I E N D S'),
//                 Text('$userCount Users'),
//               ],
//             );
//           },
//         ),
//       ),
//       backgroundColor: Theme.of(context).primaryColor,
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             messageToUser('Something went wrong', context);
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           final users = snapshot.data?.docs ?? [];

//           return ListView.builder(
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               final User = users[index];
//               return ListTile(
//                 title: Text(User['username']),
//                 subtitle: Text(User['email']),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/helper.dart/helper_functions.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('User').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              messageToUser('Something went wrong', context);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            int userCount = snapshot.data?.docs.length ?? 0;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('F R I E N D S'),
                Text('$userCount Users'),
              ],
            );
          },
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('User').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            messageToUser('Something went wrong', context);
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final users = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final User = users[index];
              return ListTile(
                title: Text(User['username']),
                subtitle: Text(User['email']),
              );
            },
          );
        },
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/helper.dart/helper_functions.dart';

// class UserList extends StatelessWidget {
//   const UserList({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('users').snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               messageToUser('Something went wrong', context);
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             int userCount = snapshot.data?.docs.length ?? 0;

//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('F R I E N D S'),
//                 Text('$userCount Users'),
//               ],
//             );
//           },
//         ),
//       ),
//       backgroundColor: Theme.of(context).primaryColor,
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             messageToUser('Something went wrong', context);
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           final users = snapshot.data?.docs ?? [];

//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: users.length,
//                   itemBuilder: (context, index) {
//                     final User = users[index];
//                     return ListTile(
//                       title: Text(User['username']),
//                       subtitle: Text(User['email']),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
