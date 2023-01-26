import 'package:flutter/material.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyScrollView(
        title: 'Your info',
        childWidget: SliverToBoxAdapter(
          child: Column(
          children: const [
            CircleAvatar(
              radius: 70.0,
              child: Icon(Icons.account_circle, size: 90,),
            ),
            Text('Mykola Pryhodskyi', style: TextStyle(fontSize: 26.0),),
            Text('pryhodskyimykola@gmail.com', style: TextStyle(color: Colors.grey),),
          ],
          ),
        ),
      ),
    );
  }
}
