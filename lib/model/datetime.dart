import 'package:mosque_daily/model/times.dart';
import 'package:mosque_daily/model/date.dart';

class Datetime {

  Times times;
  Date date;

	Datetime.fromJsonMap(Map<String, dynamic> map): 
		times = Times.fromJsonMap(map["times"]),
		date = Date.fromJsonMap(map["date"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['times'] = times == null ? null : times.toJson();
		data['date'] = date == null ? null : date.toJson();
		return data;
	}
}
