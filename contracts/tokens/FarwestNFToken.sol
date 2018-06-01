pragma solidity ^0.4.23;

import "../tokens/NFTokenMetadata.sol";

contract FarwestNFToken is NFTokenMetadata {

  constructor(
    string _name,
    string _symbol
  )
    public
  {
    nftName = _name;
    nftSymbol = _symbol;
  }

  /* Implements a mint function which allows us and only us to
   * issue a new NFToken. NFToken implements only _mint function
   * which does all the heavy work creating the token, but we
   * need to provide a proper wrapper function with desired
   * access permissions.
   * @param _owner NFToken owner address.
   * @param _id Unique NFToken ID.
   */
  function mint(
    address _owner,
    uint256 _id
  )
    onlyOwner
    external
  {
    super._mint(_owner, _id);
  }

  /* Burns a NFToken. NFToken already implements internal _burn
   * function (the same as for _mint). Here we only provide a wrapper
   * function with proper access permissions.
   * @param _owner NFToken owner address.
   * @param _id Unique NFToken ID.
   */
  function burn(
    address _owner,
    uint256 _tokenId
  )
    onlyOwner
    external
  {
    super._burn(_owner, _tokenId);
  }

}