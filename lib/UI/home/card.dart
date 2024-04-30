import 'package:cpssoft/model/Muser.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser( {super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            width: 48.0,
            height: 48.0,
            child: Icon(Icons.person),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Text(user.name??''),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: double.infinity,
                  child: Text('${user.address}, ${user.city}'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: double.infinity,
                  child: Text(user.phoneNumber??''),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: double.infinity,
                  child: Text(user.email??''),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
