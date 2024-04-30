import 'package:cpssoft/model/muser.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser( {super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1,color: Colors.black)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                const Icon(Icons.person),
                Text(" :${user.name!.toUpperCase()}"),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
          ),
          Row(
            children: [
              const Icon(Icons.home),
              Text(' :${user.address}, ${user.city}'),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                const Icon(Icons.call),
                Text(" :${user.phoneNumber}  "),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                const Icon(Icons.email),
                Text(" :${user.email}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
