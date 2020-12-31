class RelativeDateFormat {
  static final num ONE_MINUTE = 60000;
  static final num ONE_HOUR = 3600000;
  static final num ONE_DAY = 86400000;
  static final num ONE_WEEK = 604800000;

  static final String ONE_SECOND_AGO = '秒前';
  static final String ONE_MINUTE_AGO = '分钟前';
  static final String ONE_HOUR_AGO = '小时前';
  static final String ONE_DAY_AGO = '天前';
  static final String ONE_MONTH_AGO = '月前';
  static final String ONE_YEAR_AGO = '年前';

  //时间转换
  static String format(int t) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(t);

    String hourParse = '0${dateTime.hour}';
    var minuteParse = "0${dateTime.minute}";

    var hour = dateTime.hour.toString().length == 1
        ? hourParse
        : dateTime.hour.toString();
    var minute = dateTime.minute.toString().length == 1
        ? minuteParse
        : dateTime.minute.toString();

    return '$hour:$minute';
  }

  static num toSeconds(num date) {
    return date / 1000;
  }

  static num toMinutes(num date) {
    return toSeconds(date) / 60;
  }

  static num toHours(num date) {
    return toMinutes(date) / 60;
  }

  static num toDays(num date) {
    return toHours(date) / 24;
  }

  static num toMonths(num date) {
    return toDays(date) / 30;
  }

  static num toYears(num date) {
    return toMonths(date) / 365;
  }
}
