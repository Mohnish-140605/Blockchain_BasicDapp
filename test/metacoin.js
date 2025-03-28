const MetaCoin = artifacts.require("MetaCoin");

contract("MetaCoin", accounts => {
    it("should put 10000 MetaCoin in the first account", async () => {
        const MetaCoinInstance = await MetaCoin.deployed();
        const balance = await MetaCoinInstance.getBalance.call(accounts[0]);

        assert.equal(balance.valueOf(), 10000, "10000 wasn't in the first account");
        });
    it("should call a function that depends on a linked library", async () => {
        const MetaCoinInstance = await MetaCoin.deployed();
        const metaCoinBalance = (await MetaCoinInstance.getBalance.call(accounts[0])).toNumber();
        const metaCoinEthBalance = (await MetaCoinInstance.getBalanceInEth.call(accounts[0])).toNumber();

        assert.equal(metaCoinEthBalance, 2 * metaCoinBalance, "Library function returned unexpected function, linkage may be broken");
        }
        );
    it("should send coin correctly", async () => {
        const MetaCoinInstance = await MetaCoin.deployed();
        const account_one = accounts[0];
        const account_two = accounts[1];
        const account_three = accounts[2];
        const initialBalance = (await MetaCoinInstance.getBalance.call(account_two)).toNumber();
        const amount = 10;
        const result = await MetaCoinInstance.sendCoin(account_two, amount, {from: account_on
        });
        const finalBalance = (await MetaCoinInstance.getBalance.call(account_two)).toNumber();
        assert.equal(finalBalance.valueOf(), initialBalance + amount, "Coin wasn't sent correctly");
        });
    }