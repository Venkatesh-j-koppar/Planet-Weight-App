import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final TextEditingController _weightController= new TextEditingController();
  int radiovalue=0;
  double _finalresult=0.0;
  String _formatedstring;


  void valuechanged(int value){

    setState(() {
      radiovalue=value;
      switch(radiovalue){
        case 0:
          _finalresult= calculateWeight(_weightController.text,0.91);
          _formatedstring='Your weight on Venus is ${_finalresult}';
          break;
        case 1:
          _finalresult= calculateWeight(_weightController.text,0.38);
          _formatedstring='Your weight on Mars is ${_finalresult}';

          break;
        case 2:
          _finalresult= calculateWeight(_weightController.text,0.06);
          _formatedstring='Your weight on Pluto is ${_finalresult}';

          break;
      }
    });

}

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[

          Image.asset('images/planet.png',
          //color: Colors.white,
            height: 170.0,
          width: 50.0,),

          new Container(
            child: Column(
              children: <Widget>[
                new TextField(
                  controller: _weightController,


                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(

                    icon: Icon(Icons.accessibility),
                    labelText: "Enter your Weight",
                    hintText: 'In Kgs',

                  ),

                ),
                Padding(padding: EdgeInsets.all(10)),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Radio<int>(
                        activeColor: Colors.teal,
                          value: 0, groupValue: radiovalue, onChanged: valuechanged



                      ),
                      Text("Venus",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900

                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10.0))
                      ,Radio<int>(
                        activeColor: Colors.red,
                          value: 1, groupValue: radiovalue, onChanged: valuechanged),
                      Text("Mars",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900
                      ),),
                      Padding(padding: EdgeInsets.all(10.0)),
                      Radio<int>(
                          activeColor: Colors.black,
                          value: 2, groupValue: radiovalue, onChanged: valuechanged),
                          Text("Pluto",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900

                          ),
                          ),




                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(_weightController.text.isEmpty ? " ": "$_formatedstring  Kgs",
                    style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,

                  ),),
                )



              ],

            ),

          )

        ],


      ),





    );
  }

  double calculateWeight(String weight, double  multipier) {

    if(int.parse(weight).toString().isNotEmpty&& int.parse(weight)>0){

      return int.parse(weight)*multipier;



    }
    else{

      print("Wrong");
    return int.parse("180")*0.38;
    }


  }
}
