import 'package:sqflite/sqflite.dart';
import 'package:venus_io/helpers/db_connection.dart';

class SuccessItemList {
  String itemUrl;
  String mainMsg;
  String subMsg;
  String taskNo;
  String dateTime;
  Future<Database> database = DBConnection.getDBConnection();

  SuccessItemList(
      {this.itemUrl, this.mainMsg, this.subMsg, this.taskNo, this.dateTime});

  factory SuccessItemList.fromMap(Map data) => new SuccessItemList(
        mainMsg: data["main_msg"],
        subMsg: data["sub_msg"],
        itemUrl: data["img_url"],
        taskNo: data["task_id"],
        dateTime: data["date"],
      );
}
