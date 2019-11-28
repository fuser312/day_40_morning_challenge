import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case 1', () {
    expect(willWinInOneMove([[1],[],[2,3,4]]), [[],[],[1,2,3,4]]);
    expect(willWinInTwoMoves([[1,3],[],[4,2]]), null);
    expect(willWinInTwoMoves([[1],[2],[3,4]]), [[1],[],[2,3,4]]);
  });
}
