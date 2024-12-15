import 'package:http/http.dart' as http;
import 'package:quiz_app_firebase/Widgets_Tools/questions.dart';
import 'dart:convert';
class FirebaseData{
final url=Uri.parse("https://quizapp-bdf53-default-rtdb.firebaseio.com/questions.json");
 
  Future<List<Question>>fetchQuestions()async{
   return http.get(url).then((response){
      var   data=json.decode(response.body)as Map<String,dynamic>;
      List<Question> newQuestions=[];
      data.forEach((key, value) {
        var newQuestion=Question(id: key,
         title: value["title"], 
          options: Map.castFrom(value["options"]));
          newQuestions.add(newQuestion);
      });
     return newQuestions;
    });
  }
}