module.exports = (params)->
    """
    curl https://mainnet-v2.velas.com/cdn/install-velas.sh -L | bash
    mkdir -p ./data
    curl https://mainnet-v2.velas.com/cdn/spec.json > ./spec.json
    curl https://mainnet-v2.velas.com/cdn/config.toml?signer_acc=#{params.mining.address} > ./config.toml
    echo '#{params.password}' >> ./password
    echo '#{params.mining.keystore}'  >> signer_acc.json
    ./velasblockchain --config ./config.toml account import signer_acc.json
    echo "./velasblockchain --config ./config.toml" >> ./start.sh
    chmod +x ./start.sh
    ./start.sh
    """