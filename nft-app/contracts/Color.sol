// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Color is ERC721 {
    // store colors in an array of strings #dfdfdf for eg
    string[] public colors;
    // eg color = '#FFFFFF' true it exist
    mapping(string => bool) _colorsExist;
    constructor() ERC721("Color", "COLOR") {
    }

    function mint(string memory _color) public {
        // Require unique Color -- reading the value out of the mapping
        require(!_colorsExist[_color]);
        // Color - add it
        colors.push(_color);
        // Call - track it 
        uint _id = colors.length -1;
        // Call the mint function
        _mint(msg.sender, _id);
        // Confirm with mapping that the color does exist '#FFFFFF' 
        _colorsExist[_color] = true;
        
    }
}
