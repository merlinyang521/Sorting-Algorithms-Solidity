pragma solidity >=0.5.7;

contract BubbleSort {

  function sort(uint[] memory input) public pure returns(uint[] memory) {
    if (input.length >= 2) {
        bubble(input, uint(input.length));
    }
      return input;
  }

  function bubble(uint[] memory arr, uint n) public pure{
    bool  swapped ;
    uint i;
    uint j;
    for (i = 0; i < n-1; i++){
       swapped = false;
       for (j = 0; j < n-i-1; j++){
         if (arr[j] > arr[j+1]){
           (arr[j], arr[j+1]) = (arr[j+1], arr[j]);
           swapped = true;
          }
        }
        if(swapped==false) break;
    }
  }
}
