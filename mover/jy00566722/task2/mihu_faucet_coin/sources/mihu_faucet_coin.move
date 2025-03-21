/*
/// Module: mihu_coin
module mihu_coin::mihu_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module mihu_faucet_coin::mihu_faucet_coin{
    use sui::coin::{ Self, Coin, TreasuryCap };

    public struct MIHU_FAUCET_COIN has drop {}

    fun init(witness: MIHU_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MIHU_FAUCET_COIN>(
            witness,
            9,
            b"MIHU_FAUCET_COIN",
            b"MIHU",
            b"mihu's coin,this is good",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap) 
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MIHU_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(
        treasury_cap: &mut TreasuryCap<MIHU_FAUCET_COIN>,
        coin: Coin<MIHU_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}