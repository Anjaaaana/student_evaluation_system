import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

  

class SampleDropdown extends StatefulWidget {
  const SampleDropdown({Key? key}) : super(key: key);

  @override
  State<SampleDropdown> createState() => _SampleDropdownState();
}

class _SampleDropdownState extends State<SampleDropdown> {
  List<DropdownMenuItem<int>> _studentsDropDownItems = [
    DropdownMenuItem(child: Text("loading"), value: 0)
  ];
  List<String> names = [];
  double first = 0.0;
  double second = 0.0;
  double assignment = 0.0;
  double eval = 0.0;
  double total=0;
  double marks=0;

  final TextEditingController _textControllerfirst = TextEditingController();
  final TextEditingController _textControllersecond = TextEditingController();
  final TextEditingController _textControllerassignment = TextEditingController();
  final TextEditingController _textControllereval = TextEditingController();

  var _value = 0;

  get children => null;
  @override
  void initState() {
    fetchStudents();
    super.initState();
  }

  var selectedStudentDocumentId = "";
  List<String> _docIdList = [];

  fetchStudents() async {
    QuerySnapshot qs =
        await FirebaseFirestore.instance.collection("students").get();
    List<DropdownMenuItem<int>> _temp = [];
    int i = 0;
    List<String> _tempIdList = [];
    for (var each in qs.docs) {
      _temp.add(DropdownMenuItem(child: Text(each.get("name"),
                  
      ), value: i));
      i += 1;
      print(each.id);
      names.add(each.get("name"));
     
      _tempIdList.add(each.id);
    }
    setState(() {
      _studentsDropDownItems = _temp;
    });
    _docIdList = _tempIdList;
  } 
  double add_marks(String _first , String _second , String _assignment, String _eval)
{
  double total=0;
  total = total+  double.parse(_first)*2/20;

  total = total+  double.parse(_second)*6/40;
  total = total+ double.parse(_assignment);
  total = total+ double.parse(_eval);
  return total;
}



  updatemarks(String marks) async {
    FirebaseFirestore.instance
        .collection("students")
        .doc(selectedStudentDocumentId)
        .update({"marks": marks});
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('internal marks'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.only(left: 16.0,right: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color:Color.fromARGB(0, 29, 27, 27),width: 2.0),

            ), 
            child: ListView(
         
      children: <Widget>[
         Text('select student name',
          style: TextStyle(
                    fontSize: 20.0,
                  ),
         
         ),
        SizedBox(height:20.0,),
       DropdownButton(
         hint: Text('select student name',
         style: TextStyle(
                    fontSize: 10.0,
                  ),),
        value: _value,
        items: _studentsDropDownItems,
        onChanged: (value) {
          onStudentSelected(value);
          setState(() {
             _value = int.parse(value.toString());
          });
         
         
          print(names[int.parse(value.toString())]);
        }
        // ignore: unnecessary_new
        
        
        ), 
         SizedBox(height:30,),
        TextFormField(
          controller: _textControllerfirst,
          keyboardType: TextInputType.number,
            decoration: InputDecoration(
            hintText:('Enter first assesment mark :'),
            

          ),
        ),
         SizedBox(height:30,),
        TextField(
          controller: _textControllersecond,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter second assesment Marks :',
          ),
        ),
         SizedBox(height:30,),
        TextField(
          controller: _textControllerassignment,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter assignment Marks :',
          ),
        
        ),
        SizedBox(height:30,),
        TextField(
          controller: _textControllereval,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter evaluation Marks :',
          ),
        ),
       

        SizedBox(height:15,),
        Row(
          mainAxisSize:MainAxisSize.max ,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: ()
              {
                var _first=_textControllerfirst.text;
                var _second=_textControllersecond.text;
                var _assignment=_textControllerassignment.text;
                var _eval=_textControllereval.text;
              double total =  add_marks(_first, _second, _assignment, _eval);
              updatemarks(total.toString());

              }, 
               child: const Text("summit"))
          ],
        )

        
      ],
    )
        )
          ),
          
        ), 
        
      
    );
  }
  onStudentSelected(value) {
    selectedStudentDocumentId = _docIdList[value];
    updatemarks(DateTime.now().second.toString());
  }
}
