import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddFacultyPage extends StatefulWidget {
  const AddFacultyPage({ Key? key }) : super(key: key);

  @override
  _AddFacultyPageState createState() => _AddFacultyPageState();
}

class _AddFacultyPageState extends State<AddFacultyPage> {
  final _formKey=GlobalKey<FormState>();

   var Facultyname="";
   var HODname="";
  

   final FacultynameController = TextEditingController();
   final HODnameController = TextEditingController();
   

  @override
  void dispose(){
     FacultynameController.dispose();
     HODnameController.dispose();
    
     super.dispose();
   }
   clearText()
   {
     FacultynameController.clear();
     HODnameController.clear();
     
   }
   CollectionReference faculty =
      FirebaseFirestore.instance.collection('Faculty');
  Future<void> addFaculty() {
    return faculty
        .add({'Facultyname': Facultyname, 'HODname':HODname})
        .then((value) => print('Faculty Added'))
        .catchError((error) => print('Failed to Add Faculty:$error'));
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar( 
  title:Text("Add New Faculty"),
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
                labelText: 'Faculty name:',
                labelStyle: TextStyle(fontSize: 20.0),
                border: OutlineInputBorder(),
                errorStyle: TextStyle(color: Colors.redAccent,
                fontSize: 15),
              ),
              controller: FacultynameController,
              validator: (value){
                if(value==null||value.isEmpty){
                  return'please Enter Faculty Name';

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
                labelText:'HOD name',
                labelStyle: TextStyle(fontSize: 20.0),
                border: OutlineInputBorder(),
                errorStyle:
                TextStyle(color: Colors.redAccent,
                fontSize: 15),
                 ),
                controller:HODnameController,
                 validator: (value){
                if(value==null||value.isEmpty){
                  return'please Enter HOD Name';

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
                          Facultyname=FacultynameController.text;
                          HODname=HODnameController.text;
                        
                          addFaculty();
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