// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;
/* the staking algorithm
    1. calculate reward per token
    2. calculate rewards earned
    3. update user reward per token paid
    4. update last update time
    5. update the staked amount and total staked 

*/
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract staking {
    IERC20 public immutable ourToken;
    IERC20 public immutable rtoken;
    address public owner;

    // duration variables
    uint public duration;
    uint public finishTime;
   uint public updateTime;

   //reward variables
   uint public rewardRate;
   uint public rewardpertoken;

   //user assigned rewards
   mapping(address=>uint) public userRewardspertokenPaid;
    mapping(address=>uint) public rewards;
    
    uint public total;
    mapping (address => uint) Balance;
    
    modifier onlyOwner {
        require(msg.sender==owner,"Not Authorized");
        _;
    }
    constructor(address _ourToken) {
        owner= msg.sender;
        ourToken=IERC20(_ourToken);
    }

        function setRduration(uint _duration)  external onlyOwner{
            require(finishTime<block.timestamp,"Too early")
            duration = _duration;
        }
        function notifyRewardAmt(uint _amt) external onlyOwner{
               //2 scenarios, first is where the duration has ended or not started, where reward amount is 0
               if(finishTime<block.timestamp){
                    rewardRate=_amt/duration;
               } else {
                require(rewardRate>0,"No rewards present");
                require(rewardRate*duration<=rToken.Balance(address.this),"Reward amount is more than the balance");

               }


        }
         function stake(uint _amt) external {
            
         }
            function withdraw (uint _amt) external{}
            function earned (address account) external view returns(uint);
            function getRewards()  external {
                
            }
}