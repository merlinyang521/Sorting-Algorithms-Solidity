# Gas Costs for Sorting Algorithms in Solidity

This implementation doesn't write to Blockchain or read data from it. No member fields are altered. No dynamic arrays in “storage” are accessed. This is meant for methods executing math solely, only operating on the input and not the contract stored values.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You need to install:

```
Truffle Framework
Node.js
```
### Installing the Development Environment

First, you have to install NodeJs.  Go to its homepage and install the recommended version:
* [NodeJS](https://nodejs.org/en/)

Then you need to install Truffle from the terminal:
```
npm install -g truffle
```
MacOSX or Linux users may need to append sudo in front of the command to get the permission to install truffle. Finally, download our project and follow our instructions.


## What about tests

In solidity, gas is a crucial factor for a contract. We test our code to 6 different uint arrays and we estimate the gas for each one. You can see the arrays in data/Sort.json file and alter them.

### Running the tests

From the terminal, change the working directory to your project's folder and run the commands:
```
truffle compile
```
Then, you choose testing Algorithm with its command.

* Quicksort with mid pivot:
```
truffle test test/Quicksort.js
```
*  Quicksort with median Pivot:
```
truffle test test/QuicksortMedianPivot.js
```
* Mergesort:
```
truffle test test/Mergesort.js
```
* Heapsort:
```
truffle test test/Heapsort.js
```
Finally, you'll see the test results.


### Failed Tests?
If there's a failed test that exceeds the block gas limit, the truffle test won't show the results of successful results.

Solution: replace the data file(json) with another one which does not contain the failed data

### How do we calculate the Gas through the test?

Web3 library is used by Truffle. Web3 has many utilities and one of them is the function:
```
myContract.methods.myMethod([param1[, param2[, ...]]]).estimateGas(options[, callback])
```
which we use it in the JS testing file

### Datasets
The datasets are included in Sort_all.json file. In their structure, we define the max Gas for each successful test. The value must be smaller than the max Block Gas limit (8 millions nowadays).

### Important Files Locations
Sorting Algorithms Contracts code:
```
contracts/
```

JS tests code:
```
test/
```

Arrays Dataset:
```
data/Sort_all.json
```

## Library of Sorting Algorithms

After the Gas test, we created a library for using them.

The Solidity code is in contract:
```
librarySorting.sol
```

### How to use it

In using contract, you have to import our library contract  and define the command "using SortingMethods for uint[]".
It isn't suggested to use the "Helper" functions because they are only for helping the other functions.

Below is an example of a contract using our library:

```
pragma solidity >=0.5.7;
import "./librarySorting.sol";

contract Example {
    using SortingMethods for uint[];

    uint[] storageArray;
    function addElements (uint[] memory _ArrayToAdd) public {
        for (uint i=0; i< _ArrayToAdd.length; i++){
            storageArray.push(_ArrayToAdd[i]);
        }
    }

    function sortArray() public returns(uint[] memory){
        storageArray = storageArray.heapSort();
        return storageArray;
    }
}
```

The other Sorting Algorithms can be called like:
•	storageArray = storageArray.quickSort();
•	storageArray = storageArray.mergeSort();
•	storageArray = storageArray.bubbleSort();
