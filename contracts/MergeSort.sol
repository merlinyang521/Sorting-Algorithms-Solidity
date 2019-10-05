pragma solidity >=0.5.7;

contract MergeSort {

  function sort(uint[] memory input) public pure returns(uint[] memory) {
    if (input.length >= 2) {
        sort(input, 0, uint(input.length-1));
    }
      return input;
    }

  function sort(uint[] memory arr, uint l, uint r) internal pure {
    if (l == r) return;

    // Create indexes of arrays
   

    // Same as (l+r)/2, but avoids overflow for
    // large l and h
    uint m = l+(r-l)/2;

    // Sort first and second halves
    sort(arr, l, m);
    sort(arr, m+1, r);

    /* Merge code below */
    uint i;
    uint j;
    uint k;

    // length of left(n1) and right(n2) array
    uint n1 = m - l + 1;
    uint n2 =  r - m;

    /* create temp arrays in memory (locally) */
    uint[] memory left = new uint[](n1);
    uint[] memory right = new uint[](n2);

    /* Copy data to temp arrays left[] and right[] */
    for (i = 0; i < n1; i++)
        left[i] = arr[l + i];
    for (j = 0; j < n2; j++)
        right[j] = arr[m + 1+ j];

    /* Merge the temp arrays back into arr[l..r]*/
    i = 0; // Initial index of first subarray
    j = 0; // Initial index of second subarray
    k = l; // Initial index of merged subarray
    while (i < n1 && j < n2)
    {
        if (left[i] <= right[j])
        {
            arr[k] = left[i];
            i++;
        }
        else
        {
            arr[k] = right[j];
            j++;
        }
        k++;
    }

    /* Copy the remaining elements of left[], if there
       are any */
    while (i < n1)
    {
        arr[k] = left[i];
        i++;
        k++;
    }

    /* Copy the remaining elements of right[], if there
       are any */
    while (j < n2)
    {
        arr[k] = right[j];
        j++;
        k++;
    }
  }
}
