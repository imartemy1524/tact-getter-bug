import { CompilerConfig } from '@ton/blueprint';

export const compile: CompilerConfig = {
    lang: 'tact',
    target: 'contracts/tact_bug.tact',
    options: {
        debug: true,
    },
};
