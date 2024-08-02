import "package:flutter/material.dart";
class Profile extends StatefulWidget{
  final String name;
  const Profile ({super.key,  required this.name });
  @override
  ProfileState createState() => ProfileState();
}



class ProfileState  extends State<Profile>{
  @override
 void initState(){
  super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  closeState (){
    Navigator.of(context).pop();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child: Text(widget.name)
      ) 

    );
   }
  
  

}