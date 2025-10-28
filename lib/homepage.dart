import 'package:flutter/material.dart';

class LaundryLoadPlanner extends StatefulWidget {
  const LaundryLoadPlanner({super.key});

  @override
  State<LaundryLoadPlanner> createState() => _LaundryLoadPlannerState();
}

class _LaundryLoadPlannerState extends State<LaundryLoadPlanner> {
  //Set the text color (Number of Clothes)
  Color numberOfClothTextColor = Colors.black;
  Color washingMachineCapacityTextColor = Colors.black;
  Color washCycleTypeColor = Colors.black;
  //Variable for the dropdownButton (Wash Cycle Type)
  String washCycleType = "Normal";

  TextEditingController numberOfClothesController = TextEditingController();
  TextEditingController washingMachineCapacityController = TextEditingController();

  //Result
  int resultNumberOfLoad = 0;
  int resultTotalTimeUsed = 0;
  int resultTotalWaterUsed = 0;
  String resultFormula = "";

  //Warning Text
  String warning = "";
  bool resultVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Laundry Load Planner',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueAccent,
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            //Let the container border [topLeft] and [topRight] became radius
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(
              'Fill Information',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  //=== Number of Clothes Container ===
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/cloth_shirt.png', scale: 9),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Number of \nClothes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: numberOfClothTextColor, //Set by variable, used to change color once occur warning
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        //TextField for Number of Clothes
                        child: TextField(
                          controller: numberOfClothesController,//Bing the controller with variable
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Number',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  //=== Washing Machine Capacity Container ===
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/washing_capacity.png',scale: 9),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Washing Machine\nCapacity',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: washingMachineCapacityTextColor,//Set by variable, used to change color once occur warning
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        //TextField for Washing Machine Capacity
                        child: TextField(
                          controller: washingMachineCapacityController,//Bing the controller with variable
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Capacity',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  //=== Wash Cycle Type Container ===
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          'assets/wash_cycle_type.png',
                          scale: 9,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Wash Cycle \nType',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: washCycleTypeColor, //Set by variable, used to change color once occur warning
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        //DropdownButton for Wash Cycle Type
                        child: DropdownButton<String>(
                          isExpanded: true, //To fix the width
                          iconEnabledColor: Colors.blue, //Change the arrow color
                          value: washCycleType,
                          items: <String>['Normal', 'Heavy', 'Quick'].map((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(), //Convert map to list (dropdownbutton must be list)
                          onChanged: (String? newValue) {
                            washCycleType = newValue!; //! to enture the value not null
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll( //The same color will be applied for all button states
                        Colors.blueAccent, //Set the button color
                      ),
                    ),
                    onPressed: calculate,
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,//set the thickness, value more high represent more bold text.
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.blueAccent,
                      ),
                    ),
                    onPressed: resetAll,
                    child: Text(
                      'RESET',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            //Warning Text Area
            SizedBox(
              height: 20,
              child: Text(
                warning,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            //Used visibility to control the result, success set to true, other set to false.
            Visibility(
              visible: resultVisibility,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Result Number of Loads Container
                        Container(
                          width: 150,
                          height: 100,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'Number of Loads',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '$resultNumberOfLoad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Result Total Time Used Container
                        Container(
                          width: 150,
                          height: 100,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'Total Time Used',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '$resultTotalTimeUsed/Min',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Result Total Water Used Container
                        Container(
                          width: 150,
                          height: 100,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'Total Water Used',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '$resultTotalWaterUsed/Liter',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Result Formula Container (Normal,Heavy,Quick)
                        Container(
                          width: 150,
                          height: 100,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'Formula',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                resultFormula,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculate() {
    //Validate all the textfield (user input)
    if (!validate(numberOfClothesController.text, 'Number of Clothes')) {
      resultVisibility = false;
      numberOfClothTextColor = Colors.red; //Change text color when invalid
      setState(() {});
      return;
    } else {
      numberOfClothTextColor = Colors.black;
      setState(() {});
    }

    if (!validate(washingMachineCapacityController.text,'Washing Machine Capacity',)) {
      resultVisibility = false;
      washingMachineCapacityTextColor = Colors.red;
      setState(() {});
      return;
    } else {
      washingMachineCapacityTextColor = Colors.black;
      setState(() {});
    }

    int numberOfCloth = int.parse(numberOfClothesController.text);
    int washingMachineCapacity = int.parse(washingMachineCapacityController.text);

    //Number of Load Calculation and round it became whole number
    double numberOfLoad = (numberOfCloth / washingMachineCapacity);
    int numberOfLoadRounded = numberOfLoad.ceil(); 

    int totalWaterUsed = 0;
    int totalTimeUsed = 0;
    //Normal 50L  45min
    //Heavy	 70L	60min
    //Quick	 30L	25min
    //Calculate based on wash cycle type
    if (washCycleType == 'Normal') {
      totalWaterUsed = numberOfLoadRounded * 50;
      totalTimeUsed = numberOfLoadRounded * 45;
      resultFormula = "50Liter Water\n45Min /Load";
    } else if (washCycleType == 'Heavy') {
      totalWaterUsed = numberOfLoadRounded * 70;
      totalTimeUsed = numberOfLoadRounded * 60;
      resultFormula = "70Liter Water\n60Min /Load";
    } else if (washCycleType == 'Quick') {
      totalWaterUsed = numberOfLoadRounded * 30;
      totalTimeUsed = numberOfLoadRounded * 25;
      resultFormula = "30Liter Water\n25Min /Load";
    }

    //Assign value
    resultNumberOfLoad = numberOfLoadRounded;
    resultTotalWaterUsed = totalWaterUsed;
    resultTotalTimeUsed = totalTimeUsed;
    resultVisibility = true;
    setState(() {});
  }

  bool validate(String input, String widgetName) {
    //Check user input is empty or not
    if (input.trim().isEmpty) {
      warning = "$widgetName cannot be empty!";
      return false;
    }

    //Check user input is in integer format or not (xxx), if not return null because using tryParse
    int? validNumber = int.tryParse(input.trim());

    if (validNumber == null) {
      warning = '$widgetName only in wholes number (1,2,3...)';
      return false;
    }

    //Check user input number is less than or equal to 0 (Cloth and Capacity must be start with 1)
    if (validNumber <= 0) {
      warning = '$widgetName cannot less than or equal to 0';
      return false;
    }

    //If didn't having any invalid occur, set the warning to default state.
    warning = "";
    return true;
  }

  void resetAll() {
    //Reset all to default
    numberOfClothTextColor = Colors.black;
    washingMachineCapacityTextColor = Colors.black;
    washCycleTypeColor = Colors.black;

    washCycleType = "Normal";

    numberOfClothesController.text = "";
    washingMachineCapacityController.text = "";

    resultNumberOfLoad = 0;
    resultTotalTimeUsed = 0;
    resultTotalWaterUsed = 0;
    resultFormula = "";

    warning = "";
    resultVisibility = false;

    setState(() {});
  }
}
