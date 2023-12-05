//SPDX-License-Identifier: MIT License
pragma solidity ^0.8.9;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "./interfaces/IFactory.sol";
import "./interfaces/IExchange.sol";

contract Exchange is ERC20 {
    IERC20 token;
    IFactory factory;

    constructor (address _token) ERC20("Gray Uniswap V2", "GUNI-V2"){
        token = IERC20(_token);
        factory = IFactory(msg.sender);
    }
    
    // _maxTokens -> the value included Slippage
    function addLiquidity(uint256 _maxTokens) public payable {
        uint256 totalLiquidity = totalSupply();
        if (totalLiquidity > 0) { // Already Liquidity exists
            uint256 ethReserve = address(this).balance - msg.value;
            uint256 tokenReserve = token.balanceOf(address(this));
            uint256 tokenAmount = msg.value * tokenReserve / ethReserve;
            require(_maxTokens >= tokenAmount, "");
            token.transferFrom(msg.sender, address(this), tokenAmount);
            uint256 liquidityMinted = totalLiquidity * msg.value / ethReserve;
            _mint(msg.sender, liquidityMinted);
        } else {
            uint256 tokenAmount = _maxTokens;
            uint256 initialLiquidity = address(this).balance;
            _mint(msg.sender, initialLiquidity);
            token.transferFrom(msg.sender, address(this), tokenAmount);
        }
    }

    function removeLiquidity(uint256 _lpTokenAmount) public {
        uint256 totalLiquidity = totalSupply();
        uint256 ethAmount = _lpTokenAmount * address(this).balance / totalLiquidity;
        uint256 tokenAmount = _lpTokenAmount * token.balanceOf(address(this)) / totalLiquidity;

        _burn(msg.sender, _lpTokenAmount);

        payable(msg.sender).transfer(ethAmount);
        token.transfer(msg.sender, tokenAmount);

        console.log('ethAmount : %s, tokenAmount : %s', ethAmount, tokenAmount);
    }

    // ETH -> ERC20
    function ethToTokenSwap(uint256 _minTokens) public payable {
        ethToToken(_minTokens, msg.sender);
    }

    function ethToTokenTransfer(uint256 _minTokens, address _recipient) public payable {
        ethToToken(_minTokens, _recipient);
    }

    function ethToToken(uint _minTokens, address _recipient) private {
        // calculate amount out (zero fee)
        uint256 outputAmount = getOutputAmount(
            msg.value, 
            address(this).balance - msg.value, 
            token.balanceOf(address(this)));
        
        unchecked {
            console.log('outputAmount : %s, _mintTokens : %s', outputAmount, _minTokens);
            if (outputAmount >= _minTokens) {
                console.log('true');
            } else {
                console.log('false');
            }
        }

        require(outputAmount >= _minTokens, "Inffucient outputAmount");
        //transfer token out
        IERC20(token).transfer(_recipient, outputAmount);
    }
    // ERC20 -> ETH
    function TokenToEthSwap(uint256 _tokenSold, uint256 _minEth) public payable {
        // calculate amount out (zero fee)
        uint256 outputAmount = getOutputAmountWithFee(
            _tokenSold, 
            token.balanceOf(address(this)), 
            address(this).balance);

        unchecked {
            console.log('%s, %s', outputAmount, _minEth);
            if (outputAmount >= _minEth) {
                console.log('true');
            } else {
                console.log('false');
            }
        }

        require(outputAmount >= _minEth, "Inffucient outputAmount");
        //transfer token out
        IERC20(token).transferFrom(msg.sender, address(this), _tokenSold);
        payable(msg.sender).transfer(outputAmount);
    }

    // ERC20 -> ERC20
    function TokenToTokenSwap(
        uint256 _tokenSold,
        uint256 _minTokenBought,
        uint256 _minEthBought,
        address _tokenAddress) public payable {

        address toTokenExchangeAddress = factory.getExchange(_tokenAddress);
        // calculate amount out (zero fee)
        uint256 ethOutputAmount = getOutputAmount(
            _tokenSold, 
            token.balanceOf(address(this)), 
            address(this).balance);

        unchecked {
            console.log('%s, %s', ethOutputAmount, _minEthBought);
            if (ethOutputAmount >= _minEthBought) {
                console.log('true');
            } else {
                console.log('false');
            }
        }

        require(ethOutputAmount >= _minEthBought, "Inffucient outputAmount");
        //transfer token out
        IERC20(token).transferFrom(msg.sender, address(this), _tokenSold);

        IExchange(toTokenExchangeAddress).ethToTokenTransfer{value: ethOutputAmount}(_minTokenBought, msg.sender);
    }


    function getPrice(uint256 inputReserve, uint256 outputReserve) public pure returns (uint256) {
        uint256 numerator = inputReserve;
        uint256 denominator = outputReserve;
        return numerator / denominator;
    }

    function getOutputAmount(
        uint256 inputAmount,
        uint256 inputReserve,
        uint256 outputReserve
    ) public pure returns (uint256) {
        uint256 numerator = (inputAmount * outputReserve);
        uint256 denominator = (inputReserve + inputAmount);
        return numerator / denominator;
    }

    function getOutputAmountWithFee(
        uint256 inputAmount,
        uint256 inputReserve,
        uint256 outputReserve
    ) public pure returns (uint256) {
        uint256 inputAmountWithFee = inputAmount * 99;
        uint256 numerator = (inputAmount * inputAmountWithFee);
        uint256 denominator = (inputReserve * 100 + inputAmountWithFee);
        return numerator / denominator;
    }
}
