import 'package:flutter/material.dart';

class alert extends StatelessWidget {
  const  alert({super.key});

  @override
  Widget build(BuildContext context) {
    void showAlertDialoge(){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Hey , How are you ?"),
        content: Text('Are you Sure Breakup with Her ?'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Cancel')),
          ElevatedButton(onPressed: (){}, child: Text('Submit'))
        ],
      ));
    }
    void showAlertDialogewithIcon() {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('Installation Block'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.warning, color: Colors.red,size: 40,),
                SizedBox(width: 5,),
                Text('Warning', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
              ],
            ),
            SizedBox(height: 5,),
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged", style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16
            ),)
          ],
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Ok'))
        ],
      ));
    }
    void simpleDialoge() {
      showDialog(context: context, builder: (context) => SimpleDialog(
        title: Text('Choose Option'),
        children: [
          SimpleDialogOption(
            child: Text('Option 1'),
          ),
          SimpleDialogOption(
            child: Text('Option 2'),
          )
        ],
      ));
    }
    void showBottomsheetalert() {
      showModalBottomSheet(context: context, builder: (context) => Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Choose Option', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              ListTile(
                onTap : (){},
                onLongPress: (){},
                  title: Text('Option 1'),
              ),
              ListTile(
                onTap : (){},
                onLongPress: (){},
                  title: Text('Option 2'),
              ),
              ListTile(
                onTap : (){},
                onLongPress: (){},
                  title: Text('Option 3'),
              ),
              ListTile(
                onTap : (){},
                onLongPress: (){},
                  title: Text('Option 4'),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                    ),
                    child: Text('Save', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                        color: Colors.white
                ),
                )),
              ),
            ],
          ),
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('App Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              showAlertDialoge();
            }, child: Text('Alert Dialog', style: TextStyle(fontSize: 20,),)),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              showAlertDialogewithIcon();
            }, child: Text('Alert Dialog with Icon', style: TextStyle(fontSize: 20,),)),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              simpleDialoge();
            } , child: Text('Simple Dialoge', style: TextStyle(fontSize: 20),)),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {
              showBottomsheetalert();
            }, child: Text('Bottom Sheed', style: TextStyle(fontSize: 20),)),
          ],
        ),
      ),
    );
  }
}
