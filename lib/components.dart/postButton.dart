import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  void Function()? onTap;
  PostButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              border: Border.all(),
              borderRadius: BorderRadius.circular(20)),
          child: Icon(
            Icons.done_outlined,
            size: 30,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ));
  }
}



// import 'package:flutter/material.dart';

// class PostButton extends StatelessWidget {
//   final VoidCallback? onTap;

//   PostButton({Key? key, required this.onTap}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.onSecondary,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         padding: const EdgeInsets.all(8.0), // Add padding to the container
//         child: Icon(
//           Icons.done,
//           color: Theme.of(context).colorScheme.secondary, // Set the icon color
//         ),
//       ),
//     );
//   }
// }
