import 'package:test/test.dart';
import 'package:tic_tac_toe_lib/src/game.dart';
import 'package:tic_tac_toe_lib/src/game_api/game_exception.dart';
import 'package:tic_tac_toe_lib/src/game_api/position.dart';

void main() {
  group('Function isInputValid tests', () {
    final game = Game(boardConfig: [
      ['-', '-', '-'],
      ['-', 'O', '-'],
      ['-', 'O', '-']
    ]);

    setUp(() {});

    test('Out of Bound Input', () {
      expect(() => game.validateInput(Position(-1, 4)),
          throwsA(isA<OutOfBoundInputException>()));
    });

    test('Occupied Position Input', () {
      expect(() => game.validateInput(Position(1, 1)),
          throwsA(isA<OccupiedPositionException>()));
    });

    test('ValidInput #1', () {
      expect(() => game.validateInput(Position(1, 0)), isNot(throwsException));
    });

    test('ValidInput #2', () {
      expect(() => game.validateInput(Position(0, 0)), isNot(throwsException));
    });
  });

  group('Function makeMove tests', () {
    //   final game = Game(boardConfig: [
    //     ['-', '-', '-'],
    //     ['-', 'O', '-'],
    //     ['-', 'O', '-']
    //   ]);

    //   test('', () {

    //   });

    //   test('', () {

    //   });

    //   test('', () {

    //   });
  });
}
