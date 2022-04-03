import 'package:flutter/material.dart';

import 'Result_Screen.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 150.3;
  int age = 19;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  buildExpanded1(context, "male"),
                  SizedBox(
                    width: 20,
                  ),
                  buildExpanded1(context, "female"),
                ],
              ),
            ),
          ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Height",style: Theme.of(context).textTheme.headline3,),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(heightVal.toStringAsFixed(1)  ,style: Theme.of(context).textTheme.headline2),
                            Text("cm",style: Theme.of(context).textTheme.bodyText1),




                          ],
                        ),
                        SizedBox(height: 10,),

                        Slider(
                          value:heightVal ,
                          min: 90,
                          max: 220,
                         // divisions:130 ,
                          label: "height",
                          activeColor: Colors.blue,
                          inactiveColor: Colors.red,
                          onChanged:(newval){
                            setState(() {
                              heightVal=newval;
                            });



                          } ,
                        )

                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      buildExpanded2(context, "weight"),
                      SizedBox(
                        width: 20,
                      ),
                      buildExpanded2(context, "age"),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/10,
                color: Colors.teal,
                child: TextButton(
                  onPressed:(){
               var result=weight/pow(heightVal/100, 2);




                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                      return Result(result:result ,isMale:isMale ,age: age);

                    }));
                    
                    
                  } ,
                  child: Text("Calculate",style: Theme.of(context).textTheme.headline2,),
                  


                ),
              )
        ]),
      ),
    );
  }

  Expanded buildExpanded1(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            // if(type=="male")
            // isMale=true;
            // else
            //   isMale=false;
            isMale = (type == 'male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  (isMale && type == 'male') || ((!isMale && type == 'female'))
                      ? Colors.teal
                      : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == "male" ? Icons.male : Icons.female),
              const SizedBox(height: 25),
              Text(
                type == "male" ? "Male" : "Female",
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
        ),
      ),
    );
  }
  Expanded buildExpanded2(BuildContext context, String text) {
    return Expanded(
      child: Container(
         decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
             Colors.blueGrey
         ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text == "age" ? "Age" : "Weight",
              style: Theme.of(context).textTheme.headline3,
            ) ,
            const SizedBox(height: 25),
            Text(
              text == "age" ? "$age" : "$weight",
              style: Theme.of(context).textTheme.headline2,
            ) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                FloatingActionButton(
                  onPressed: (){
                    setState(() {
                      text=='age'?age++:weight++;

                    });


                  },
                  child: Icon(Icons.add ,size: 20,),
                  heroTag:text=='age'? "age++":'weight++',
                  mini: true,
                ),
                SizedBox(width: 15,),
                FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        text=='age'?age--:weight--;

                      });
                    },
                    child: Icon(Icons.remove,size: 20,),
                  mini: true,
                  heroTag:text=='age'? "age--":'weight--',

                ),

              ],
            )

          ],
        ),
      ),
    );
  }


}
