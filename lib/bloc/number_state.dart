abstract class NumberState{
}

class InitialNumberState extends NumberState{}


class ChangeNumberState extends NumberState{
  int currentNumber;
  ChangeNumberState(this.currentNumber);
}

