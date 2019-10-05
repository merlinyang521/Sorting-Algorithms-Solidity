pragma solidity >=0.5.7;

contract HeapSort {

  function sort(uint[] memory input) public pure returns(uint[] memory) {
    if (input.length >= 2)
      heapSort(input);
    return input;
    }
 function heapSort(uint256[] memory self) public pure {
   uint256 end = self.length - 1;
   uint256 start = (end-1)/2; // Parent of last element
   uint256 root = start;
   uint256 lChild; //lChild = Parent * 2 +1
   uint256 rChild;
   uint256 swap;

   // Creating Max Heap
   while(start >= 0){
     root = start;
     lChild = start * 2 + 1;
     while(lChild <= end){
       rChild = lChild + 1;
       swap = root;
       if(self[swap] < self[lChild])
         swap = lChild;
       if((rChild <= end) && (self[swap]<self[rChild]))
         swap = rChild;
       if(swap == root)
         lChild = end+1;
       else {
         (self[swap], self[root]) = (self[root], self[swap]);
         root = swap;
         lChild = root*2 + 1;
       }
     }
     if(start == 0)
       break;
     start--;
   }
   
   // Sift Down method
   while(end > 0){
     (self[0],self[end]) = (self[end],self[0]);
     end--;
     root = 0;
     lChild = 1;
     while(lChild <= end){
       rChild = lChild + 1;
       swap = root;
       if(self[swap] < self[lChild])
         swap = lChild;
       if((rChild <= end) && (self[swap]<self[rChild]))
         swap = rChild;
       if(swap == root)
         lChild = end + 1;
       else {
         (self[swap], self[root]) = (self[root], self[swap]);
         root = swap;
         lChild = root*2 +1;
       }
     }
   }
 }
}

