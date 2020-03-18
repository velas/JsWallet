require! {
    \../web3t/providers/eth.ls
    \../web3t/providers/insight.ls
    #\../web3t/providers/xem.ls
    \../web3t/providers/erc20.ls
    \../web3t/providers/omni.ls
    #\../web3t/providers/waves.ls
    #\../web3t/providers/eos.ls
    #\../web3t/providers/stellar.ls
    #\../web3t/providers/tron.ls
    #\../web3t/providers/qiwi.ls
    \../web3t/providers/rst.ls
    \../web3t/providers/velas.ls
    \../web3t/providers/velas2.ls
}
module.exports = { eth, insight , erc20, omni, velas, velas2 /* rst, xem, waves,eos, stellar, tron, qiwi*/ }