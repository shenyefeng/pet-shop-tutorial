pragma solidity ^0.4.11;
 import "truffle/Assert.sol";
 import "truffle/DeployedAddresses.sol";
 import "../contracts/Adoption.sol";
contract TestAdoption {
 Adoption adoption = Adoption(DeployedAddresses.Adoption());

 function testUserConAdoptPet() public {
  uint returnedId = adoption.adopt(8);
  uint expected = 8;
  Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
 }

 function testGetAdopterAddressByPetId() public {
  address expected = this;
  address adopter = adoption.adopters(8);
  Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
 }

 function testGetAdoperAddressByPetIdInArray() public {
  address expected = this;
  address[16] memory adopers = adoption.getAdopters();
  Assert.equal(adopers[8], expected, "Owner of pet ID 8 should be recorded.");
 }

}
