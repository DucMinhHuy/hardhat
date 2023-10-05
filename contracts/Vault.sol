//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract Vault is Ownable, AccessControlEnumerable {
    IERC20 private token;
    uint256 public maxWithdrawAmount;
    bool public withdrawEnable;
    bytes32 public constant WITHDRAWER_ROLE= keccak256("WITHDRAWER_ROLE");
    
    function setWithdrawEnable(bool _isEnable) public onlyOwner {
        withdrawEnable = _isEnable;
    }
    function setMaxWithdrawAmount(uint256 _maxAmount) public onlyOwner {
        maxWithdrawAmount = _maxAmount;
    }
    function setToken(IERC20 _token) public onlyOwner {
        token = _token;
    }
    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }
    function withdraw(uint256 _amount, address _to) external onlyWithdrawer{
        require(withdrawEnable, "withdraw is not available");
        require(_amount <= maxWithdrawAmount, "Exceed maximun amuont");
        token.transfer(_to, _amount);
    }
    function deposit(uint256 _amount) external{
        require(token.balanceOf(msg.sender) >= _amount, "Insufficient account balance");
        SafeERC20.safeTransferFrom(token, msg.sender, address(this), _amount);
    }
    modifier onlyWithdrawer() {
        require(owner() == _msgSender() || hasRole(WITHDRAWER_ROLE, _msgSender()), "Caller is not a wwithdaawer");
        _;
    }
}