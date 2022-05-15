# HardHat Base

To install it, you need to create an npm project by going to an empty folder, running npm init, and following its instructions. Once your project is ready, you should run

´´´
npm install --save-dev hardhat
´´´

To use your local installation of Hardhat, you need to use npx to run it (i.e. npx hardhat).

## Execute tasks

´´´
npx hardhat accounts
´´´

## Compiling your contracts

´´´
npx hardhat compile
´´´

## Testing your contracts

´´´
npx hardhat test
´´´

## Deploying your contracts

´´´
npx hardhat run scripts/sample-script.js
´´´
