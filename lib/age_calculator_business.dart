import 'package:age_calculator/age_model.dart';
import 'package:age/age.dart';

import 'duration_model.dart';


class AgeCalculate{

 AgeModel calculateAge(DateTime birthdate , DateTime futureDate){
  AgeDuration age;
  AgeModel ageModel = AgeModel();
  // Find out your age
 age = Age.dateDifference(
      fromDate: birthdate, toDate: futureDate, includeToDate: false);

  ageModel.year = age.years;
  ageModel.month = age.months;
  ageModel.day = age.days;
  return ageModel;


  }

 DurationAge calculateNextBirthDay(DateTime birthdate , DateTime futureDate){
  DurationAge nextBirhDay = DurationAge();

   DateTime tempDate = DateTime(futureDate.year, birthdate.month, birthdate.day);
   DateTime nextBirthdayDate = tempDate.isBefore(futureDate)
       ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
       : tempDate;
   AgeDuration nextBirthdayDuration =
   Age.dateDifference(fromDate: futureDate, toDate: nextBirthdayDate);
   nextBirhDay.year = nextBirthdayDuration.years;
   nextBirhDay.month = nextBirthdayDuration.months;
   nextBirhDay.day = nextBirthdayDuration.days;
   return nextBirhDay;


  }
}