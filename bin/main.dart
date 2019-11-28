// Challenge
// Find the best move given the state of Towers of Hanoi board

List<List<int>> willWinInOneMove(List<List<int>> inputState) {
  List<List<List<int>>> allPossibleMoves = possibleMoves(inputState);
  for (int i = 0; i < allPossibleMoves.length - 1; i++) {
      if(checkForFinalState(allPossibleMoves[i])){
        return allPossibleMoves[i];
      }
          
  }
}

bool checkForFinalState(List<List<int>> listToCheck){
  if(listToCheck[0].isEmpty && listToCheck[1].isEmpty){
  return true;
  }
  return false;
}

List<List<int>> willWinInTwoMoves(List<List<int>> inputState){
  List<List<List<int>>> allPossibleMoves = possibleMoves(inputState);
  for(List<List<int>> list in allPossibleMoves){
    if(willWinInOneMove(list) != null){
      return list;
    }
  }
  return null;
}

List<List<List<int>>> possibleMoves(List<List<int>> inputState) {
  List<List<List<int>>> finalState = [];

  for (int i = 0; i < inputState.length; i++) {
    for (int j = 0; j < inputState.length; j++) {
      if (isValidMove(inputState, i, j)) {
        List<List<int>> copyInputState = [];
        for (List<int> list in inputState) {
          List<int> tempList = List.from(list);
          copyInputState.add(tempList);
        }
        copyInputState[j].insert(0, copyInputState[i][0]);

        copyInputState[i].removeAt(0);

        finalState.add(copyInputState);
      }
    }
  }
  return finalState;
}

bool isValidMove(List<List<int>> checkList, int from, int to) {
  if (checkList[from].isEmpty) {
    return false;
  }

  if (checkList[to].isEmpty) {
    return true;
  }

  return (checkList[from].first < checkList[to].first);
}

main() {
  print(possibleMoves([
    [1],
    [],
    [2, 3, 4]
  ]));
   print(willWinInTwoMoves([
    [1],
    [2],
    [3, 4]
  ]));
  print(willWinInOneMove([
    [1],
    [],
    [2, 3, 4]
  ]));
  // print(secondBestMove([[1],[2],[3,4]]));
  // print(willFinishInTwoMoves([[2],[1],[3,4]]));
  //print(possibleMoves([[2,3],[1],[4]]));
  //print(bestMoves([[2,3], [1], [4,]]));
}
