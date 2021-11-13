import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Contacts",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.video_call,
                color: Colors.grey[600],
              ),
              SizedBox(
                width: 10.0,
              ),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              SizedBox(
                width: 10.0,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final User user = users[index];
                return UserCard(user: user);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget UserCard({@required User user}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(
            msg:"${user.name} Card",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0,
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfileAvatar(imageUrl: user.imageUrl),
            SizedBox(
              width: 6.0,
            ),
            Flexible(
                child: Text(
              "${user.name}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
      ),
    );
  }
}
