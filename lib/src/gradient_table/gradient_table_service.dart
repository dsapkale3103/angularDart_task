import 'package:angular/core.dart';

@Injectable()
class GradientService {
  List<String> getHeaderTitle(int n) {
    var alphabates = <String>[];

    var header = '';
    for (var i = 0, a = 0; i < n; i++, a++) {
      if (a == 26) {
        a = 0;
        header += String.fromCharCode(a + 65);
      }

      alphabates.add(header + String.fromCharCode(a + 65));
    }
    return alphabates;
  }

  String getColor(int row, int col, int n) {
    if (row == 0 && col == 0) return 'rgb(255,255,255)';
    var r = 255;
    var diff = 255 / (n * n);
    return 'rgb($r,${r - diff * row * col},${r - diff * row * col})';
  }
}
