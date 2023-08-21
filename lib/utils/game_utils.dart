import '../constants/string_constants.dart';

class GameUtils {
  String checkResult(bool isMe, List<int> tiles) {
    String result = "";
    int r = check(tiles);
    if (r == 1) {
      result = player1win;
    } else if (r == 2) {
      result = player2win;
    } else if (r == 3) {
      result = draw;
    } else if (r == 4) {
      result = isMe ? player1turn : player2turn;
    } else {
      result = draw;
    }
    return result;
  }

  static String initialMsg() {
    return player1turn;
  }

  int check(List<int> tiles) {
    int result = 0;

    if (isWinning(1, tiles)) {
      result = 1;
    } else if (isWinning(2, tiles)) {
      result = 2;
    } else if (isComplete(tiles)) {
      result = 3;
    } else {
      result = 4;
    }
    return result;
  }

  bool isComplete(List<int> tiles) {
    bool res = false;
    int j = 0;
    for (int i = 0; i < 9; i++) {
      if (tiles[i] != 0) {
        j++;
        j == 9 ? res = true : res = false;
      }
    }
    return res;
  }

  bool isWinning(int who, List<int> tiles) {
    return (tiles[0] == who && tiles[1] == who && tiles[2] == who) ||
        (tiles[3] == who && tiles[4] == who && tiles[5] == who) ||
        (tiles[6] == who && tiles[7] == who && tiles[8] == who) ||
        (tiles[0] == who && tiles[4] == who && tiles[8] == who) ||
        (tiles[2] == who && tiles[4] == who && tiles[6] == who) ||
        (tiles[0] == who && tiles[3] == who && tiles[6] == who) ||
        (tiles[1] == who && tiles[4] == who && tiles[7] == who) ||
        (tiles[2] == who && tiles[5] == who && tiles[8] == who);
  }
}
