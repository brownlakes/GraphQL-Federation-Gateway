// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 1858
// Hash 9166
// Hash 4852
// Hash 5171
// Hash 6729
// Hash 3926
// Hash 7900
// Hash 4498
// Hash 2976
// Hash 2042
// Hash 4480
// Hash 5387
// Hash 3707
// Hash 3540
// Hash 7130
// Hash 5963
// Hash 1703
// Hash 7662
// Hash 6156
// Hash 1079
// Hash 7235
// Hash 7408
// Hash 2372
// Hash 7970
// Hash 8205
// Hash 9125
// Hash 1555
// Hash 7110
// Hash 3398
// Hash 3441
// Hash 2518
// Hash 1800
// Hash 6706
// Hash 1850
// Hash 2143
// Hash 4321
// Hash 4197
// Hash 1063
// Hash 4703
// Hash 8292
// Hash 1081
// Hash 3433
// Hash 2290
// Hash 7326
// Hash 8652
// Hash 3983
// Hash 1479
// Hash 3397
// Hash 8318
// Hash 7597
// Hash 1258
// Hash 1633
// Hash 7490
// Hash 7373
// Hash 3857
// Hash 3691
// Hash 1915
// Hash 4655
// Hash 9081
// Hash 3257
// Hash 4176
// Hash 7285
// Hash 9073
// Hash 1476
// Hash 6412
// Hash 2178
// Hash 8738
// Hash 6889
// Hash 3240
// Hash 4107
// Hash 7352
// Hash 3550
// Hash 1316
// Hash 9269
// Hash 2596
// Hash 4871
// Hash 4801
// Hash 6281
// Hash 9141
// Hash 5155
// Hash 1281
// Hash 9057
// Hash 6206
// Hash 7117
// Hash 3645
// Hash 5364
// Hash 3624
// Hash 1748
// Hash 7694
// Hash 2356
// Hash 5107
// Hash 9352
// Hash 7040
// Hash 1422
// Hash 7384
// Hash 8038
// Hash 7900
// Hash 7926
// Hash 7983
// Hash 8031
// Hash 1579
// Hash 6602
// Hash 7222
// Hash 1576
// Hash 6112
// Hash 1699
// Hash 9106
// Hash 3652
// Hash 4763
// Hash 5023
// Hash 5904
// Hash 3318
// Hash 9863
// Hash 2075
// Hash 4797
// Hash 9953
// Hash 3834
// Hash 5635
// Hash 5087