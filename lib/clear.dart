import 'package:age_calculator/age_model.dart';
import 'package:age_calculator/duration_model.dart';
import 'package:flutter/material.dart';

class ClearFields{


  static void clearFields(TextEditingController c1,TextEditingController c2 ,AgeModel agemodel,DurationAge durationAge){

      c1.text = "";
      c2.text ="";
      agemodel.year = 0;
      agemodel.month = 0;
      agemodel.day = 0;
      durationAge.year = 0 ;
      durationAge.month= 0 ;
      durationAge.day= 0;

  }
}
