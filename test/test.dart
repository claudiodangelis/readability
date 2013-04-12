import 'package:unittest/unittest.dart';
import 'package:readability/readability.dart' as readability;

main(){
  test('Shortener', () {
    readability.shortener("http://www.dartlang.org/articles/style-guide/")
    .then(expectAsync1((String resp){
      expect("http://rdd.me/sadyfufx",resp);
    }));
  });
}