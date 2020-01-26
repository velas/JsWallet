require! {
    \ethers : { utils } 
}

toHexString = (byteArray) -> (Array.from byteArray, (byte) -> ('0' + (byte .&. 255).toString 16).slice -2).join ''
export string-to-hex = (str)->
    bytes = utils.toUtf8Bytes(str)
    toHexString bytes
export hex-to-string = (hex)->
    utils.toUtf8String(hex)