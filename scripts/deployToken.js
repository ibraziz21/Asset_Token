const hre= require("hardhat");
const {bignumber}= require("ethers");


async function main() {
[owner,exampleBuyer]= await hre.ethers.getSigners();    

const tokendeploy =  await hre.ethers.getContractFactory("AssetToken");
const TokenDeploy =await tokendeploy.deploy(10000000);
await TokenDeploy.deployed();
console.log("Successful, Contract Address: "+TokenDeploy.address);


const crowdsale = await hre.ethers.getContractFactory("assetSale");
const crowdDeploy = await crowdsale.deploy(1,owner.address,TokenDeploy.address);
let instance = await crowdDeploy.deployed();
console.log("Successful, Contract Address: "+crowdDeploy.address);

instance.transfer(crowdsale.address,10000000);





}

main().catch((error)=>{
    console.error(error);
    process.exitCode= 1;

});