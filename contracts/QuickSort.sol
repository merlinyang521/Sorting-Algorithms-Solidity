pragma solidity >=0.5.7;
contract QuickSort {

  function sort(uint[] memory input) public pure returns(uint[] memory) {
    if (input.length >= 2) {
      sort(input, 0, int(input.length - 1));
    }
 return input;
  }

  function sort(uint[] memory arr, int left, int right) internal pure {
    int i = left;
    int j = right;
    if(i==j) return;
    uint pivot = arr[uint(left + (right - left) / 2)];
    while (i <= j) {
      while (arr[uint(i)] < pivot) i++;
      while (pivot < arr[uint(j)]) j--;
      if (i <= j) {
        (arr[uint(i)], arr[uint(j)]) = (arr[uint(j)], arr[uint(i)]);
        i++;
        j--;
      }
    }

    if (left < j)
      sort(arr, left, j);
    if (i < right)
      sort(arr, i, right);
  }
}
