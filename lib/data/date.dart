class DateData {
  int nowYear   = 0;
  int nowMonth  = 0;
  int nowDay    = -1;
  int nowHour   = 0;
  int nowMinute = 0;
  int nowSecond = 0;

  int goalYear    = 2023;
  int goalMonth   = 11;
  int goalDay     = 16;
  int goalHour    = 24;
  int goalMinute  = 60;
  int goalSecond  = 60;

  getNowDateData(){
    nowYear   = goalYear    - DateTime.now().year;
    nowMonth  = goalMonth   - DateTime.now().month;
    nowDay    = goalDay     - DateTime.now().day;
    nowHour   = goalHour    - DateTime.now().hour;
    nowMinute = goalMinute  - DateTime.now().minute;
    nowSecond = goalSecond  - DateTime.now().second;
  }

}