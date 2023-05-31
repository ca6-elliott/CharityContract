## Charitable Donation Contract

The Charitable Donation contract allows users to make donations and manages the administration and withdrawal of those donations.

### Contract Structure

The contract is defined as `CharitableDonation` in Solidity version 0.8.0 or higher.

### Donation Structure

The contract includes a `Donation` struct with the following properties:

- `amount`: A `uint256` value representing the donation amount.
- `donor`: The `address` of the donor.
- `timestamp`: A `uint256` value indicating the timestamp when the donation was made.

### State Variables

- `owner`: An `address` variable representing the owner of the contract.
- `admins`: A mapping that associates addresses with a boolean value indicating whether they have admin privileges.
- `donations`: An array of `Donation` structs to store the details of all donations made.
- `totalDonations`: A `uint256` variable tracking the total amount of donations received.

### Functions

The contract provides the following functions:

1. `addAdmin(address _admin)`: Allows the owner to add an address as an admin. Only the contract owner can call this function.
2. `removeAdmin(address _admin)`: Allows the owner to remove an admin by setting their value in the `admins` mapping to `false`. Only the contract owner can call this function.
3. `donate()`: Allows users to make a donation by sending Ether to the contract. The donation amount must be greater than 0.
4. `withdrawDonations(address payable _recipient, uint256 _amount)`: Allows admins to withdraw donations from the contract balance and transfer the specified amount to a designated recipient. The withdrawal amount must be greater than 0 and cannot exceed the contract balance.
5. `getDonations()`: Returns an array of `Donation` structs containing the details of all donations made.

### Modifiers

The contract includes the following modifiers:

1. `onlyOwner`: Restricts the execution of a function to the contract owner. It throws an error message if called by an address other than the owner.
2. `onlyAdmin`: Restricts the execution of a function to addresses with admin privileges. It throws an error message if called by an address that is not an admin.

### License

The contract is licensed under the MIT License. Refer to the SPDX-License-Identifier at the top of the code for more details.
