// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CharitableDonation {
    struct Donation {
        uint256 amount;
        address donor;
        uint256 timestamp;
    }

    address public owner;
    mapping(address => bool) public admins;
    Donation[] public donations;
    uint256 public totalDonations;

    constructor() {
        owner = msg.sender;
        admins[owner] = true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
    }

    modifier onlyAdmin() {
        require(admins[msg.sender] == true, "Only admins can call this function.");
        _;
    }

    function addAdmin(address _admin) public onlyOwner {
        admins[_admin] = true;
    }

    function removeAdmin(address _admin) public onlyOwner {
        admins[_admin] = false;
    }

    function donate() public payable {
        require(msg.value > 0, "Donation amount must be greater than 0.");
        donations.push(Donation(msg.value, msg.sender, block.timestamp));
        totalDonations += msg.value;
    }

    function withdrawDonations(address payable _recipient, uint256 _amount) public onlyAdmin {
        require(_amount > 0, "Withdrawal amount must be greater than 0.");
        require(_amount <= address(this).balance, "Insufficient balance.");
        _recipient.transfer(_amount);
    }

    function getDonations() public view returns (Donation[] memory) {
        return donations;
    }
}
