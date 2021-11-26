import 'package:easy_localization/src/public_ext.dart';
import 'package:individual_project/translations/locale_keys.g.dart';

import 'alarmObject.dart';

class Mission{
  late int mission;
  late int? numberOfProblems;
  late int? difficulty;

  Mission({required this.mission,this.numberOfProblems,this.difficulty});


}

class MissionHelper{
  static  Mission a = Mission(mission: 1);

  static void addToMissionFull(int mission, int number, int diff){
    a = Mission(mission: mission,numberOfProblems: number,difficulty: diff);

  }
  static void addToMissionOnlyMission(int mission){
    a = Mission(mission: mission);

  }
  static Alarm addMissionToAlarm(Alarm b){
    b.mission=a.mission;
    b.difficulty=a.difficulty;
    b.numberOfProblems=a.numberOfProblems;
    return b;
  }


  static String getMission(){
    String b = LocaleKeys.off_text.tr();
    if(a==null){
      return b;
    }if(a!=null){
      if(a.mission==1){
        b= LocaleKeys.off_text.tr();
        return b;
      }if(a.mission==2){
        b=LocaleKeys.math_text.tr();
        return b;
      }if(a.mission==3){
        b=LocaleKeys.writing_text.tr();
        return b;
      }
    }
    return b;
  }

  static int getMissionInt(){
    int c = 1;
    if(a==null){
      return c;
    }if(a!=null){
      if(a.mission==1){
        c= 1;
        return c;
      }if(a.mission==2){
        c=2;
        return c;
      }if(a.mission==3){
        c=3;
        return c;
      }
    }
    return c;
  }
}