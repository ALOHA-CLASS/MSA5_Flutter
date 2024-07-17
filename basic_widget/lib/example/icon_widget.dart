import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text("아이콘 위젯", style: TextStyle(fontSize: 30),),
              Divider(),
              Text("기본 아이콘", style: TextStyle(fontSize: 30),),
              Icon(
                Icons.face,
                size: 48,
                color: Colors.black,
              ),
              // 추가 아이콘
              SizedBox(height: 10,),
              Icon(
                Icons.person,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.login,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.logout,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.shopping_cart,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.shopping_bag,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.menu,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                // Icons.favorite,
                Icons.favorite_border,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                // Icons.thumb_up,
                Icons.thumb_up_outlined,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                // Icons.bookmark,
                Icons.bookmark_outline,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.payment,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),

              Divider(),

              // CRUD
              Text("CRUD", style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Icon(
                Icons.create,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.edit,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.read_more,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                // Icons.delete,
                Icons.delete_forever,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),

              Divider(),

              // FORM
              Text("FORM", style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),  
              Icon(
                Icons.person,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.lock,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.calendar_month,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.schedule,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Icon(
                Icons.place,
                size: 48,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
            ],
          ),),
      ),
    )
    
    ;
  }
}