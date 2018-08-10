int[] randomOrder(int upperBound) {
  IntList randomArray = new IntList();
  for(int i = 0; i < upperBound; i++) {
    int rand = int(random(upperBound));
    while (randomArray.hasValue(rand)) {
      rand = int(random(upperBound));
    }
    randomArray.append(rand);
  }
  int[] randomOutput = randomArray.array();
  for(int i = 0; i < randomOutput.length; i++) {
    randomOutput[i] -= 1;
  }
  return randomOutput;
}
