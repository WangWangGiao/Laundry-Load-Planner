# SPINPRO (Laundry Load Planner)

SPINPRO is an application that is developed by flutter, and this application allows users to quickly and efficiently calculate the number of loads, total water used, and total time required by inputting the number of clothes, washing machine capacity, and selecting the wash cycle type. Users can access this application anytime and anywhere when they want to do laundry.

Input
•	TextField (Number of Clothes) – User needs to input the number into the text field.

•	TextField (Washing Machine Capacity) – User needs to input the number into the text field.

•	DropdownButton (Wash Cycle Type) – User needs to select the type based on their demands.

Process
•	Number of Loads = Number of Clothes / Washing Machine Capacity

•	Wash Cycle Type (Normal)

-	Total Water Used = Number of Loads * 50

-	Total Time Used = Number of Loads * 45

•	Wash Cycle Type (Heavy)

-	Total Water Used = Number of Loads * 70

-	Total Time Used = Number of Loads * 60

•	Wash Cycle Type (Normal)

-	Total Water Used = Number of Loads * 30

-	Total Time Used = Number of Loads * 25

Output

•	Number of Loads

•	Total Water Used

•	Total Time Used
 
Widget List Used

•	MaterialApp

•	ThemeData

•	ColorScheme

•	Scaffold

•	Container

•	BoxDecoration

•	LinearGradient

•	Column

•	Row

•	Image.asset

•	SizedBox

•	Text

•	TextStyle

•	Spacer

•	LinearProgressIndicator

•	AppBar

•	TextField

•	DropdownButton

•	ElevatedButton

•	ButtonStyle

•	WidgetStatePropertyAll

•	Visibility

Basic Validation Approach

•	Check for empty value – If the user does not input anything in the TextField and presses the Calculate button, a warning will be displayed by changing the text color to red and show the warning in warning area. (e.g. Number of Clothes cannot be empty!)

•	Check for integer datatype – If the user inputs a value that is not an integer, a warning will display by change the text color to red and showing the warning in warning area. (e.g. Number of Clothes only in wholes number (1,2,3…)).

•	Check for value less than or equal to 0 – If the user inputs a value less than or equal to 0, a warning will display by change the text color to red and showing the warning in warning area. (e.g. Number of Clothes cannot less than or equal to 0)


<table>
  <tr>
    <td align="center">
      <img src="https://github.com/WangWangGiao/my-project-assets/blob/main/Spinpro_SS.png?raw=true" alt="SplashScreen" width="250"/>
      <br>
      <b>SplashScreen</b>
    </td>
    <td align="center">
      <img src="https://github.com/WangWangGiao/my-project-assets/blob/main/Spinpro_HomeBefore.png?raw=true" alt="HomeBefore" width="250"/>
      <br>
      <b>Home Before</b>
    </td>
    <td align="center">
      <img src="https://github.com/WangWangGiao/my-project-assets/blob/main/Spinpro_HomeAfterCalculation.png?raw=true" alt="HomeAfterCalculation" width="250"/>
      <br>
      <b>Home After Calculation</b>
    </td>
  </tr>
</table>