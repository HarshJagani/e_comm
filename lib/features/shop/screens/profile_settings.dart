import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/size.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: Stack(
         children: [
           Column(
             children: [
               Container(
                 height: 150,
                 decoration: const BoxDecoration(
                     gradient: LinearGradient(
                       begin: Alignment.topLeft,
                       end: Alignment.topRight,
                       colors: [Color(0xFF000555), Color(0xFF004e92)],
                     ),
                     borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(25),
                         bottomRight: Radius.circular(25))),
               )
             ],
           ),
           Padding(
             padding: const EdgeInsets.only(left: 30, top: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Account',style: Theme.of(context).textTheme.headlineMedium),
                 const SizedBox(height: ECSize.defaultSpace),
                 Row(
                   children: [
                     CircleAvatar(child: Image.asset(ECImageString.faceBookLogo)),
                     Text('Harsh')

                   ],
                 )
               ],
             ),
           )
         ],
       ),
     ),
    );
  }
}