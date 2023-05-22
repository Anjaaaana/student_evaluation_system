import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateFacultyPage extends StatefulWidget {
  final String id;
const UpdateFacultyPage({Key? key, required this.id}) : super(key: key);


  @override
  _UpdateFacultyPageState createState() => _UpdateFacultyPageState();
}

class _UpdateFacultyPageState extends State<UpdateFacultyPage> {
  final _formKey=GlobalKey<FormState>();
   CollectionReference faculty = FirebaseFirestore.instance.collection('Faculty');

  Future<void> updateFaculty(id,name){
    return faculty  
        .doc(id)
        .update({'Facultyname':name,'HOD':name })
        .then((value) => print("Faculty updated"))
        .catchError((error) => print('Failed to Update Faculty:$error'));
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Update Faculty"),
      ),
      body: Form(
          key: _formKey,
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('Faculty')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var name = data!['name'];
              
    return Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal:30),
      child: ListView(children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0), 
          child:TextFormField(
            initialValue: name,
            autofocus: false,
            onChanged: (value)=> name = value,
            decoration: InputDecoration(
            labelText:'Faculty Name',
            labelStyle:TextStyle(fontSize: 20.0),
            border:OutlineInputBorder(),
            errorStyle:
            TextStyle(color: Colors.redAccent,
            fontSize: 15),
          ),
          validator:(value){
            if (value==null|| value.isEmpty)
            {
              return 'please Enter Faculty Name';
            }
            return null;
          },
       ),
      ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: TextFormField(
            initialValue: name,
            autofocus: false,
            onChanged: (value)=>name = value,
            decoration: InputDecoration(
              labelText: 'HOD Name',
              labelStyle: TextStyle(fontSize: 20.0),
              border: OutlineInputBorder(),
              errorStyle: 
              TextStyle(color: Colors.redAccent,
              fontSize: 15),
            ),
            validator:(value){
            if (value==null|| value.isEmpty)
            {
              return 'please Enter Faculty Name';
            }
            return null;
          },
           
        ),
      ),
      
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed:(){
                if (_formKey.currentState!.validate()){
                  updateFaculty(widget.id, name);
                  Navigator.pop(context);
                }
              },
              child: Text('Update',
              style: TextStyle(fontSize: 18.0),
              ),
            ),
            ElevatedButton(
            onPressed:()=>{},
            child: Text('Reset',
            style:TextStyle(fontSize: 18.0),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
            ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}

