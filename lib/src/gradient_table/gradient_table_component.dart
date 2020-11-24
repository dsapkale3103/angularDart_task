import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

import './gradient_table_service.dart';

@Component(
  selector: 'gradient-table',
  styleUrls: ['gradient_table_component.css'],
  templateUrl: 'gradient_table_component.html',
  directives: [
    MaterialButtonComponent,
    materialInputDirectives,
    MaterialNumberValueAccessor,
    MaterialButtonComponent,
    formDirectives,
    coreDirectives
  ],
  providers: [ClassProvider(GradientService)],
)
class GradientTableComponent implements OnInit {
  final GradientService gradientService;
  int n;
  String msg;
  List rows;
  List<String> columnHeaders;
  GradientTableComponent(this.gradientService);
  @override
  void ngOnInit() {
    msg = '';
  }

  // Create table
  void makeTable() {
    if (n < 2 || n > 100) {
      msg = 'N should be between 2 and 100';
      return;
    } else {
      msg = '';
    }
    columnHeaders = [
      '',
      ...gradientService.getHeaderTitle(n)
    ]; //getting column headers
    rows = ['', ...getRow()]; // getting number of row 
  }

  // Create array of size n
  List getRow() => []..length = n;
  // fill colour in table
   Map<String, String> getColor(int row, int col) =>
      {'background': gradientService.getColor(row, col, n)};
}
