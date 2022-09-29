const {expect} = require("chai");
const { ethers, waffle } = require("hardhat");

describe("AssetToken", function () {
    let myToken;
    let ownerAddress;

    beforeEach(async function(){
        mytoken= await ethers.getContractFactory("AssetToken");
        [ownerAddress,recepient] = await ethers.getSigners();

        myToken= await mytoken.deploy(5000);
        console.log("deployed, ca: "+ myToken.address);
       

    });


    describe("Token Test",function () {
        it("should have all tokens in my account", async function(){
            let instance= await myToken.deployed();
            let TotalTokens = await instance.totalSupply();
            let bal = await instance.balanceOf(ownerAddress.getAddress());
            console.log("Owner balance: "+bal);     
         
            expect(bal).equal(TotalTokens);
        });
        it("should be able to transfer", async function () {
            const sent = 1;
            let instance = await myToken.deployed();
            let TotalTokens = await instance.totalSupply();
            const owner = await ownerAddress.getAddress();
            const rec= await recepient.getAddress();

            expect(instance.transfer(rec,sent)).to.be.eventually.fulfilled;
            
           
                })
    });
});