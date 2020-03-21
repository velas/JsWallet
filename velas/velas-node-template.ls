module.exports = (params)->
    """
    curl https://get.parity.io -L | bash
    mkdir -p ./data
    curl https://gist.githubusercontent.com/askucher/e5c4b232fde16bfcc53b48b1a559f6f4/raw/fd4a6259eef0ba5a6834cfad45b48a9af6568ac6/spec.json > ./spec.json
    curl https://gist.githubusercontent.com/askucher/e5c4b232fde16bfcc53b48b1a559f6f4/raw/536310205ded78e85677a450767aad8cada24429/config.example.toml > ./config.toml
    echo '#{params.password}' >> ./password
    echo '#{params.mining.keystore}'  >> signer_acc.json
    parity --config ./config.toml account import signer_acc.json
    parity --config ./config.toml account list >> addresses
    sed -i 's/${signer_acc}/'$(cat addresses | tail -n 1)'/g' ./config.toml
    echo "parity --config ./config.toml" >> ./start.sh
    chmod +x ./start.sh
    ./start.sh
    """