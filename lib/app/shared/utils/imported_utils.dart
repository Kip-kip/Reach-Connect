class Utils {
  String getMaxDisplayContent(String? content) {
    if (content == null) {
      return "";
    }

    if (content.length <= 100) {
      return content;
    }
    var sub = content.substring(0, content.length);
    return "{$sub}...";
  }
}


getTimeRemaining(DateTime time){
  var now = DateTime.now();
  var days  = time.difference(now).inDays;
 var hours = time.difference(now).inHours % 24;
 var mins  = time.difference(now).inMinutes%(60);
 var remString = "In ";
 if(mins.isNegative){
   return remString ="Past Due";
 }

 if(days>0){
   remString+="${days}d ";
 }


   remString+="${hours}hr ";

    remString+="${mins}mins ";

  return remString;
}