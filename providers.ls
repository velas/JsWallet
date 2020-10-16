require! {
    \../web3t/providers/eth.ls
    \../web3t/providers/insight.ls
    \../web3t/providers/bitcore.ls
    \../web3t/providers/blockstream.ls
    \../web3t/providers/insight_segwit.ls
    #\../web3t/providers/xem.ls
    \../web3t/providers/erc20.ls
    \../web3t/providers/vlxerc20.ls
    \../web3t/providers/omni.ls
    #\../web3t/providers/waves.ls
    #\../web3t/providers/eos.ls
    #\../web3t/providers/stellar.ls
    #\../web3t/providers/tron.ls
    #\../web3t/providers/qiwi.ls
    \../web3t/providers/velas2.ls
}
module.exports = { eth, /*insight*/ bitcore, blockstream, insight_segwit , erc20, omni, velas2, vlxerc20 /* rst, xem, waves,eos, stellar, tron, qiwi*/ }