require("dotenv").config();
require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
      url: process.env.RPC_URL,
      accounts: [ process.env.PRIVATE_KEY ] // ensure it begins with 0x
    }
  }
};
