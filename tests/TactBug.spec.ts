import { Blockchain, SandboxContract, TreasuryContract } from '@ton/sandbox';
import { toNano } from '@ton/core';
import { TactBug } from '../wrappers/TactBug';
import '@ton/test-utils';

describe('TactBug', () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let tactBug: SandboxContract<TactBug>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();

        tactBug = blockchain.openContract(await TactBug.fromInit());

        deployer = await blockchain.treasury('deployer');

        const deployResult = await tactBug.send(
            deployer.getSender(),
            {
                value: toNano('0.05'),
            },
            {
                $$type: 'Deploy',
                queryId: 0n,
            }
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: tactBug.address,
            deploy: true,
            success: true,
        });
    });

    it('should deploy', async () => {
        // the check is done inside beforeEach
        // blockchain and tactBug are ready to use

        const {avatar} = await tactBug.getData();
        expect(avatar).toBeTruthy();
    });

});
