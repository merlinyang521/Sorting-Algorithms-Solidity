var MergeSort = artifacts.require("../contracts/MergeSort.sol");
var testdata = require("../data/Sort_all.json");

contract("MergeSort", function(accounts) {
  var instanceFuture = MergeSort.new();
  testdata.vectors.forEach(function(v, i) {
    it("Passes test vector " + i, async function() {
      var instance = await instanceFuture;
      var result = await instance.sort(v.input[0], { gas: v.gas });
      assert.deepEqual(result.map(x => x.toNumber()), v.output[0]);
    });
  });

  after(async function() {
    var gas = [];
    i = 0;
    var totalGas = 0;
    var instance = await instanceFuture;
    for (var v of testdata.vectors) {
      gas[i] =
        (await instance.sort.estimateGas(v.input[0], { gas: v.gas  }));
      totalGas += gas[i];
      console.log("Gas for Test " + i + ": " + gas[i]);
      i++;
    }
    console.log("Total gas for this method: " + totalGas);
  });
});
