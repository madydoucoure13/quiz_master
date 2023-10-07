import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget{
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: listView(),
    );
  }
  PreferredSizeWidget appBar(){
    return AppBar(
      title : const Text('Page notification')
    );
  }
  Widget listView(){
    return ListView.separated(
        itemBuilder: (context, index){
      return listViewItem(index);
    }, 
        separatorBuilder: (context, index){
      return const Divider(height: 0);
    }, 
        itemCount: 15);
  }
  Widget prefixIcon(){
    return Container (
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: Icon(
        Icons.notifications,
        size: 25,
        color: Colors.grey.shade700,
      ),
    );
  }
  Widget listViewItem(int index){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  timeAndDate(index)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Widget message(index){
  double textSize = 14;
  return Container(
    child: RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: 'Message',
        style: TextStyle(
          fontSize: textSize,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
        children: const [
          TextSpan(
            text: 'Message Descriptipn',
            style: TextStyle(
                fontWeight: FontWeight.w400,
            )
          )
        ]
      ),
    ),
  );
}
Widget timeAndDate(int index){
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '12-12-2022',
          style: TextStyle(
            fontSize: 10
          ),
        ),
        Text(
          '14-12-2022',
          style: TextStyle(
              fontSize: 10
          ),
        )
      ],
    ),
  );
}