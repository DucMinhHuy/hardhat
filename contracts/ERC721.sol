//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract ERC721 {
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    // event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);
    // function balanceOf(address _owner) external view returns (uint256);
    // function ownerOf(uint256 _tokenId) external view returns (address);
    // function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable;
    // function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;
    // function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
    // function approve(address _approved, uint256 _tokenId) external payable;
    // function setApprovalForAll(address _operator, bool _approved) external;
    // function getApproved(uint256 _tokenId) external view returns (address);
    // function isApprovedForAll(address _owner, address _operator) external view returns (bool);

    mapping (address => uint256) internal _balances;
    mapping (uint256 => address) internal owner;
    mapping (address => mapping ( address => bool)) private _operatorApprivals;



    // trả về số lượng NFT của user 
    function balanceOf( address _owner) external view returns (uint256) {
        require(_owner != address(0), "error address");
        return _balances[_owner];
    }
    // tìm ownerOf cho NFT
    function ownerOf(uint256 _tokenId) external view returns (address){
        address _owner = owner[_tokenId];
        require(_owner != address(0), "error owner");
        return _owner;
    }
    // enable or disable an operator
    function setApprovalForAll(address _operator, bool _approved) external{
        _operatorApprivals[msg.sender][_operator] = _approved;
        emit ApprovalForAll(msg.sender, _operator, _approved);
    }
    // check xem có phải là một operator( nhà điều hành chắc giống owner ) của 1 address thứ 2 hay khonng
    function isApprovedForAll(address _owner, address _operator) external view returns (bool){
        return _operatorApprivals[_owner][_operator];
    }
    

}