import 'package:tic_tac_toe_lib/src/game.dart';
import 'package:tic_tac_toe_lib/src/game_api/istrategy.dart';
import 'package:tic_tac_toe_lib/src/listener.dart';
import 'position.dart';

enum EMark {
  X,
  O,
  empty;

  bool get isEmpty => this == empty;
  EMark get opposite {
    if (isEmpty) return EMark.empty;
    return this == EMark.O ? EMark.X : EMark.O;
  }
}

enum ECommand {
  restart,
  exit;
}

enum EGameState {
  strategyNotSet,
  playing,
  paused,
  xWon,
  oWon,
  draw;

  EGameState get gameState => this;
  bool get isGameOver => this != playing;
}

typedef MarkMatrix = List<List<EMark>>;

abstract class IGame {
  factory IGame() => Game();

  EMark get turn;
  EGameState get state;
  bool get isOver;
  EGameState? get result;
  MarkMatrix get board;

  set strategy(EStrategy? val);

  void addListener(IListener listener);
  void removeListener(IListener listener);

  void pauseTimer();
  void resumeTimer();
  void restart();
  void makeMove(Position pos);
}
