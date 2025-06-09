import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: heigth(),));
}
class heigth extends StatefulWidget {
  const heigth({super.key});

  @override
  State<heigth> createState() => _heigthState();
}
class _heigthState extends State<heigth> {
  String height="";
  String weight="";
  final _formkey=GlobalKey<FormState>();
  bool submit(){
    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
               child: Card(
                color: Colors.cyanAccent,
                child:Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                       
                      Text("This is the table",style: TextStyle(color: Colors.black,fontSize:30,fontWeight:FontWeight.bold),),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Height in cm",
                          labelText: "height",
                          border: OutlineInputBorder()
                        ),
                    keyboardType: TextInputType.number,
                    onSaved: (newValue) {
                      height=newValue!;
                    },
                    validator: (value) {
                      if(value==null||value==""){
                       return "The height cant be empty";
                      }
                      else if(double.parse(value)==0){
                        return "The value can be write other than zero";
                      }
                      else{
                        return null;
                      }
                    },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                      
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "weight in cm",
                                labelText: "weight",
                                border: OutlineInputBorder()
                              ),
                              keyboardType: TextInputType.number,
                              onSaved: (newValue) {
                                weight=newValue!;
                              },
                              validator: (value) {
                      if(value==null||value==""){
                       return "The weight cant be empty";
                      }
                      else if(double.parse(value)==0){
                        return "The value can be write other than zero";
                      }
                      else{
                        return null;
                      }
                    },
                            ),
                        OutlinedButton(onPressed: (){
                        if(submit()){
                          showDialog(context: context, builder: (context){
                           return AlertDialog(title: Text(calculateBmi(weight, height)),
                           content: Text("your weight class is ${calculateweights(calculateBmi(weight, height))}"),);
                            
                          });
                        }
                        }, child: Text("calculate"))
                        
                          ],
                        ),
                      )
                    ],
                  ),
                ),
               ),
             )
          ],
          
        ),
      ),
   );
  }
}
String calculateBmi(String weight,String height){
  var w=double.parse(weight);
  var h=double.parse(height);
  var bmi= w/(h*h);
  return bmi.toStringAsFixed(2);
  
}
String calculateweights(String bmi){
  var b = double.parse(bmi);
  if(b>1 && b<30){
    return "moderateness";
  }
  else if(b==30 && b<45){
    return "thickness";
  }
  else{
    return "fury";
  }
}
