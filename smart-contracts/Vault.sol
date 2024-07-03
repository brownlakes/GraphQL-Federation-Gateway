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