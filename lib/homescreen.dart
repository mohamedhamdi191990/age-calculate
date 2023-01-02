import 'package:age_calculator/age_calculator_business.dart';
import 'package:age_calculator/age_model.dart';
import 'package:age_calculator/clear.dart';
import 'package:age_calculator/dateformat.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator/duration_model.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BuildContext context;

  var dateOfBirth;

  var futureDate;

  AgeModel ageModel = AgeModel();

  DurationAge duration = DurationAge();

  final TextEditingController dbController =
      TextEditingController(text: "01-01-2000");

  final TextEditingController tdController =
      TextEditingController(text: "01-01-2023");

  @override
  Widget build(BuildContext context) {
    this.context = context;
    Widget buildHeading = _buildTitleOfTextField("Date Of Birth");
    Widget buildTextField = _buildTextField();
    Widget dateNow = _buildTitleOfTextField("Today Date");
    Widget buildTodayDate = _buildTodayDateTextField();
    Widget buttonsRow = _buildButonsRow();
    Widget AgeTitle = _buildTitleOfTextField("Age Is");
    Widget ageRow = _buildOutPutRawForAge();
    Widget nextBirthDateTitle = _buildTitleOfTextField("Next Birth Date In");
    Widget nextBirthDateRow = _buildOutPutRawForNextBirthDate();
    SizedBox sizedBox = SizedBox(
      height: 20,
    );

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            sizedBox,
            buildHeading,
            sizedBox,
            buildTextField,
            sizedBox,
            dateNow,
            sizedBox,
            buildTodayDate,
            sizedBox,
            buttonsRow,
            sizedBox,
            AgeTitle,
            sizedBox,
            ageRow,
            sizedBox,
            nextBirthDateTitle,
            sizedBox,
            nextBirthDateRow
          ],
        ),
      ),
    );
  }

  Widget _buildTitleOfTextField(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _buildTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          showCursor: false,
          readOnly: true,
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1940),
                    lastDate: DateTime.now())
                .then((date) {
              if (date == null) {
                setState(() {
                  dbController.text = "";
                });
              } else {
                setState(() {
                  dbController.text = FormatDate.getFormattingDate(date);
                });
              }

              dateOfBirth = date;
            });
          },
          controller: dbController,
          decoration: _getTextFieldWithCalendarIconDecoration(),
        )
      ],
    );
  }

  InputDecoration _getTextFieldWithCalendarIconDecoration() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).primaryColor,
        ),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor)),
      suffixIcon: Icon(
        Icons.date_range,
        color: Theme.of(context).primaryColor,
      ),
      hintText: "01-01-2020",
    );
  }

  Widget _buildTodayDateTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          showCursor: true,
          readOnly: true,
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1940),
                    lastDate: DateTime.now())
                .then((date) {
              if (date == null) {
                setState(() {
                  tdController.text = "";
                });
              } else {
                setState(() {
                  tdController.text = FormatDate.getFormattingDate(date);
                });
              }

              futureDate = date;
            });
          },
          controller: tdController,
          decoration: _getTextFieldWithCalendarIconDecoration(),
        )
      ],
    );
  }

  Widget _buildButonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                ClearFields.clearFields(dbController, tdController, ageModel, duration);
              });
            },
            child: Text(
              "Clear",
            )),
        ElevatedButton(
            onPressed: () {
              setState(() {
                ageModel = AgeCalculate().calculateAge(dateOfBirth, futureDate);
                duration = AgeCalculate()
                    .calculateNextBirthDay(dateOfBirth, futureDate);
              });
            },
            child: Text(
              "Calculate",
            ))
      ],
    );
  }

  Widget _buildOutPutRawForAge() {
    return SingleChildScrollView(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildOutputColumn("Years", ageModel.year.toString()),
          _buildOutputColumn("Months", ageModel.month.toString()),
          _buildOutputColumn("Days", ageModel.day.toString())
        ],
    ),
      );
  }

  Widget _buildOutPutRawForNextBirthDate() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildOutputColumn("Years", duration.year.toString()),
          _buildOutputColumn("Months", duration.month.toString()),
          _buildOutputColumn("Days", duration.day.toString())
        ],
      ),
    );
  }

  Widget _buildOutputColumn(String outputTitle, String outPutData) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 40,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Text(
              outputTitle,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 40,
          color: Colors.white,
          child: Center(
            child: Text(
              outPutData,
            ),
          ),
        )
      ],
    );
  }
}
