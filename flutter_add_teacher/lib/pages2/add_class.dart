import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddClassPage extends StatefulWidget {
  const AddClassPage({ Key? key }) : super(key: key);

  @override
  _AddClassPageState createState() => _AddClassPageState();
}

class _AddClassPageState extends State<AddClassPage> {
  final _formKey=GlobalKey<FormState>();

   var Classname="";
   var Teachername="";
  

   final ClassnameController = TextEditingController();
   final TeachernameController = TextEditingController();
   

  @override
  void dispose(){
     ClassnameController.dispose();
     TeachernameController.dispose();
    
     super.dispose();
   }
   clearText()
   {
     ClassnameController.clear();
     TeachernameController.clear();
     
   }
   CollectionReference clas =
      FirebaseFirestore.instance.collection('Class');
  Future<void> addClass() {
    return clas
        .add({'Classname': Classname, 'Teachername':Teachername})
        .then((value) => print('class Added'))
        .catchError((error) => print('Failed to Add class:$error'));
  }
   @ override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar( 
  title:Text("Add New Class"),
  ),   
  body: Form(
    key: _formKey,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 30),
      child:ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              autofocus:false,
              decoration: InputDecoration(
                labelText: 'Class name:',
                labelStyle: TextStyle(fontSize: 20.0),
                border: OutlineInputBorder(),
                errorStyle: TextStyle(color: Colors.redAccent,
                fontSize: 15),
              ),
              controller: ClassnameController,
              validator: (value){
                if(value==null||value.isEmpty){
                  return'please Enter Class Name';

                }
                return null;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                labelText:'Teacher name',
                labelStyle: TextStyle(fontSize: 20.0),
                border: OutlineInputBorder(),
                errorStyle:
                TextStyle(color: Colors.redAccent,
                fontSize: 15),
                 ),
                controller:TeachernameController,
                 validator: (value){
                if(value==null||value.isEmpty){
                  return'please Enter Teacher Name';

                }
                return null;
              },
                
          ),
          ),
          
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate())
                      {
                        setState(() {
                          Classname=ClassnameController.text;
                          Teachername=TeachernameController.text;
                        
                          addClass();
                          clearText();
                        });
                      }
                        },
                        child: Text(
                          'Register',
                          style:TextStyle(fontSize: 18.0),
                        ),
                        ),
                        ElevatedButton(onPressed: ()=>{clearText()},
                         child: Text(
                           'Reset',
                        style: TextStyle(fontSize: 18.0),
                         ),
                        style:ElevatedButton.styleFrom(primary:Colors.blueGrey),
                        ),
                ],
              ),
              )
                ],
      ),
    ),
  ),

);      
  }
}