import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bgColor = Colors.amberAccent.withOpacity(0.2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade700,
        title: const Text(
          'WeighWise',
          style: TextStyle(fontSize: 30, fontFamily: 'appH'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 560,
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: Colors.amberAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        //---------------------------------- weight section --------------------------------------
                        const Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '(in KiloGrams)',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(hintText: 'in kg'),
                          controller: weightController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //---------------------------------- height section ---------------------------------
                        const Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              'Height',
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '(in feet & inches)',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(hintText: 'feet'),
                          controller: feetController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(hintText: 'inches'),
                          controller: inchController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //---------------------------------- BMI section ----------------------------------
                        Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            // mainAxisAlignment: MainAxisAlignment.spac,
                            children: [
                              const Text(
                                'BMI',
                                style: TextStyle(fontSize: 30),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "(in Kg/",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                                TextSpan(
                                    text: "m",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                                TextSpan(
                                  text: "²",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      fontFeatures: [
                                        FontFeature.superscripts()
                                      ]),
                                ),
                                TextSpan(
                                    text: ")",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ])),
                              const SizedBox(
                                width: 90,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //--------------------------- elevated button/BMI calculation -------------------------
                                  ElevatedButton(
                                    onPressed: () {
                                      var wt = weightController.text.toString();
                                      var ft = feetController.text.toString();
                                      var inc = inchController.text.toString();

                                      if (wt != "" && ft != "" && inc != "") {
                                        //BMI
                                        int iWt = int.parse(wt);
                                        int iFt = int.parse(ft);
                                        int iInch = int.parse(inc);

                                        var tInch = (iFt * 12) + iInch;
                                        var tCm = tInch * 2.54;
                                        var tM = tCm / 100;
                                        var bmi = iWt / (tM * tM);

                                        var msg = "";

                                        if (bmi < 18.5) {
                                          msg = "You are UnderWeight";
                                          bgColor = Colors.orange.shade400;
                                        } else if (bmi > 25) {
                                          msg = "You are overweight";
                                          bgColor = Colors.red;
                                        } else {
                                          msg = "You are Healthy";
                                          bgColor = Colors.green;
                                        }

                                        setState(() {
                                          result = "$msg \n Your BMI is: $bmi ";
                                        });
                                      } else {
                                        setState(() {
                                          result =
                                              "!!Please Fill all the required Feilds!!!";
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text('Calculate'),
                                  ),
                                ],
                              ),
                            ]),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 100,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            result,
                            style: TextStyle(
                                color: bgColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
