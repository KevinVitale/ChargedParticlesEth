// chai.sol -- a dai savings token
// Copyright (C) 2017, 2018, 2019 dbrock, rain, mrchico, lucasvo, livnev

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

pragma solidity ^0.5.13;

/**
 * @title ParticleChai (variation on Chai.money) interface
 * @dev see https://github.com/dapphub/chai
 * @dev NOTE Modified variation by @robsecord <robsecord.eth>;
 *      Added functions to read interest by specific amount rather than entire user balance
 *      Refactored to match interface for Charged Particles - INucleus
 */
contract IChai {
    function transfer(address dst, uint wad) external returns (bool);
    // like transferFrom but dai-denominated
    function move(address src, address dst, uint wad) external returns (bool);
    function transferFrom(address src, address dst, uint wad) public returns (bool);
    function approve(address usr, uint wad) external returns (bool);
    function balanceOf(address usr) external returns (uint);

    function dai(address usr) external returns (uint wad);
    function dai(uint chai) external returns (uint wad); // Added
    function chai(uint _dai) external returns (uint pie); // Added

    // wad is denominated in dai
    function join(address dst, uint wad) external;

    // wad is denominated in (1/chi) * dai
    function exit(address src, uint wad) public;

    // wad is denominated in dai
    function draw(address src, uint wad) external returns (uint _chai);
}
