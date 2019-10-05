pragma solidity >=0.5.7;
contract QuickSort_pivot {

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
    uint mid = uint(left + (right - left) / 2);
    if( arr[mid] < arr[uint(left)])
      (arr[mid], arr[uint(left)])=(arr[uint(left)], arr[mid]);
    if(arr[uint(right)] < arr[uint(left)])
      (arr[uint(right)], arr[uint(left)])=(arr[uint(left)], arr[uint(right)]);
    if(arr[mid] < arr[uint(right)])
      (arr[mid], arr[uint(right)])=(arr[uint(right)], arr[mid]);
    uint pivot = arr[uint(right)];
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