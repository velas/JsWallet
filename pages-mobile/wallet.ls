require! {
    \react
    \native-base : { ListItem, Left, Body, Right, Thumbnail, Text, Button, View, Title, Icon, Header, Badge }
    \../Styles.js : styles
    \react-native : { ScrollView, TouchableOpacity, Dimensions, Clipboard, Alert, Vibration, Image }
    \../components/StandardLinearGradient.js
    \react-native-modal-component : ModalComponent
    \moment
    \axios
    \@rimiti/react-native-toastify : Toast
    \../components/RefreshControl.js : RefreshControl
    \../components/LoadMoreDate.js : LoadMoreDate
}


{ width, height } = Dimensions.get("window")

showToast = (message)->
  this.toastify.show(message, 3000)

openInfoModal = (store, transaction)->
  store.infoTransaction = transaction
  this.modal.show!

walletUserHistoryDetail = (store) ->
    index = (type)->
        if type is "DEPOSIT"
            Text.pug(style=styles.detailInfoAmount) +
        else if type is "WITHDRAWAL"
            Text.pug(style=styles.detailInfoAmount) -

    currency_to_spend_amount = (store)->
        return null if store.infoTransaction.order_type isnt "EXCHANGE"
        View.pug(style=styles.lineMonoRow)
            Text.pug(style=styles.detail) Spend:
            Text.pug(style=styles.viewPt)





/*
  const currency_to_get_amount = store => {
    if (store.infoTransaction.order_type === "EXCHANGE")
      return (
        <View style={styles.lineMonoRow}>
          <Text style={styles.detail}>Get:</Text>
          <Text style={styles.viewPt}>
            {" "}
            {store.infoTransaction.details.currency_to_get_amount.toFixed(
              8
            )}{" "}
            {store.infoTransaction.currency.slice(
              0,
              store.infoTransaction.currency.lastIndexOf("_")
            )}
          </Text>
        </View>
      );
  };
  const price = store => {
    if (store.infoTransaction.order_type === "EXCHANGE")
      return (
        <View style={styles.lineMonoRow}>
          <Text style={styles.detail}>Price:</Text>
          <Text style={styles.viewPt}>
            {store.infoTransaction.details.price.toFixed(8)}
          </Text>
        </View>
      );
  };

  const hash = store => {
    if (store.infoTransaction.order_type === "DEPOSIT")
      return (
        <View style={styles.lineMonoRow}>
          <Text style={styles.detail}>Hash:</Text>
          <Text style={styles.viewPt} onPress={writeToClipboardHash}>
            {store.infoTransaction.tr_hash}
            {"  "}
            <Icon
              name="ios-copy"
              onPress={writeToClipboardHash}
              style={styles.iconCopy}
            ></Icon>
          </Text>
        </View>
      );
  };
  const source_account = store => {
    if (store.infoTransaction.order_type === "INTERNAL_MOVEMENT")
      return (
        <View style={styles.lineMonoRow}>
          <Text style={styles.detail}>Sender:</Text>
          <Text style={styles.viewPt} onPress={writeToClipboardSourceAcc}>
            {store.infoTransaction.details.source_account}
            {"  "}
            <Icon
              name="ios-copy"
              onPress={writeToClipboardSourceAcc}
              style={styles.iconCopy}
            ></Icon>
          </Text>
        </View>
      );
  };
  const destination_account = store => {
    if (store.infoTransaction.order_type === "INTERNAL_MOVEMENT")
      return (
        <View style={styles.lineMonoRow}>
          <Text style={styles.detail}>Recipient:</Text>
          <Text style={styles.viewPt} onPress={writeToClipboardDestAcc}>
            {store.infoTransaction.details.destination_account}
            {"  "}
            <Icon
              name="ios-copy"
              onPress={writeToClipboardDestAcc}
              style={styles.iconCopy}
            ></Icon>
          </Text>
        </View>
      );
  };

  const DURATION = 10000;
  const writeToClipboardHash = async () => {
    await Clipboard.setString(store.infoTransaction.tr_hash);
    Vibration.vibrate(DURATION);
    Alert.alert("Copied to clipboard", "", [
      { text: "OK", onPress: () => console.log("OK Pressed") }
    ]);
  };
  const writeToClipboardId = async () => {
    await Clipboard.setString(store.infoTransaction.external_id);
    Vibration.vibrate(DURATION);
    Alert.alert("Copied to clipboard", "", [
      { text: "OK", onPress: () => console.log("OK Pressed") }
    ]);
  };
  const writeToClipboardDestAcc = async () => {
    await Clipboard.setString(
      store.infoTransaction.details.destination_account
    );
    Vibration.vibrate(DURATION);
    Alert.alert("Copied to clipboard", "", [
      { text: "OK", onPress: () => console.log("OK Pressed") }
    ]);
  };
  const writeToClipboardSourceAcc = async () => {
    await Clipboard.setString(store.infoTransaction.details.source_account);
    Vibration.vibrate(DURATION);
    Alert.alert("Copied to clipboard", "", [
      { text: "OK", onPress: () => console.log("OK Pressed") }
    ]);
  };

  if (store && store.infoTransaction)
    return (
      <View>
        <View style={styles.detailsHistory}>
          <View>
            <Badge style={styles.badgeMono}>
              Text.pug(style=styles.colorTxtBadge) {{store.infoTransaction.order_type}}
            </Badge>
          </View>
          <View style={styles.lineMono} />

          <Text style={styles.detailInfoAmount}>
            {index(store.infoTransaction.order_type)}
            {store.infoTransaction.amount} {store.infoTransaction.currency}
          </Text>
          <Text>
            {moment(store.infoTransaction.dt).format("MMM D YYYY h:mm A")}
          </Text>
        </View>
        <View style={styles.viewPt} />
        {source_account(store)}
        {destination_account(store)}
        {hash(store)}
        {price(store)}
        {currency_to_spend_amount(store)}
        {currency_to_get_amount(store)}

        <View style={styles.lineMonoRow}>
          <Text style={styles.detail}>External Id:</Text>
          <Text style={styles.viewPt} onPress={writeToClipboardId}>
            {store.infoTransaction.external_id}
            {"  "}
            <Icon
              name="ios-copy"
              onPress={writeToClipboardId}
              style={styles.iconCopy}
            ></Icon>
          </Text>
        </View>

        <View style={styles.lineMonoRowLast}>
          <Text style={styles.detail}>Status transaction:</Text>
          <Text style={styles.viewPt}>{store.infoTransaction.status}</Text>
        </View>
        <View style={styles.mbXScroll}/>
      </View>
    );
  return <View> </View>;
};
onClick = () => {
  return this.modal.dismiss();
};

export default ({ store }) => {
  const changePage = (tab, visible) => () => {
    store.tab = tab;
    store.footerVisible = visible;
  };
  // const result = store.userHistory.filter(obj => {
  //   if (obj.currency === "BTC" || obj.currency === "BTC_UAH") return obj;
  // });
  const content = (
    <View style={styles.viewMonoHistory}>
      <View style={{ paddingTop: 50 }}>
        <Button
          onPress={() => {
            this.onClick();
          }}
          transparent
        >
          <Text>Done</Text>
        </Button>
        <ScrollView style={{ paddingHorizontal: 20 }}>
          {walletUserHistoryDetail(store)}
        </ScrollView>
      </View>
    </View>
  );
  const refreshToken = async bool => {
    if (bool === true) {
      const params = {
        email: store.settingsInputMailField,
        password: store.settingsInputPasswordField
      };

      let loginResult = await axios
        .post("https://coinpay.org.ua/api/v1/user/obtain_token", params, {})
        .catch(e => showToast(e.response.data.detail));

      if (loginResult.status === 200) {
        store.userToken = loginResult.data.token;
        // console.log("in method!");
      } else {
        showToast("balances not available");
      }

      console.log("userToken 😀", store.userToken);

      let balancesRefresh = await axios
        .get("https://coinpay.org.ua/api/v1/user/balance", {
          headers: {
            Authorization: `Bearer ${store.userToken}`
          }
        })
        .catch(e => showToast(e.response.data.detail));

      if (balancesRefresh.status === 200) {
        store.userWallet = balancesRefresh.data.balance;
        console.log("balancesRefresh 😀", store.userWallet);
      } else {
        showToast("error");
      }
    }
  };

  return (
    <ModalComponent
      ref={modal => {
        this.modal = modal;
      }}
      content={content}
      showCloseButton={false}
    >
      <View style={styles.viewFlex}>
        <StandardLinearGradient>
          <Toast
            ref={c => (this.toastify = c)}
            position={"top"}
            style={styles.toastStyle}
          />

          <Header style={styles.mtAndroid}>
            <Left style={styles.viewFlex}>
              <Button
                transparent
                style={styles.arrowHeaderLeft}
                onPress={changePage("Wallets", true)}
              >
                <Icon
                  name="ios-arrow-back"
                  style={styles.arrowHeaderIconBlack}
                />
              </Button>
            </Left>
            <Body style={styles.viewFlex}>
              <Title style={styles.titleBlack}>
                {store.userWallet.BTC.currency}
              </Title>
            </Body>
            <Right style={styles.viewFlex}>
              <Thumbnail small source={require("../assets/btc-ethnamed.png")} />
            </Right>
          </Header>

          <RefreshControl swipeRefresh={refreshToken}>
            <View style={styles.bodyBlockWallet}>
              <View style={styles.bodyBlock3}>
                <Text style={styles.nameTokenSwiper1}>Total Balance</Text>
              </View>
              <View style={styles.bodyBlock3}>
                <Text style={styles.totalBalance}>
                  {store.userWallet.BTC.BTC.total.toFixed(8)}{" "}
                  <Text style={styles.nameToken}>
                    {store.userWallet.BTC.currency}
                  </Text>
                </Text>
              </View>

              <View style={styles.viewTouchablesWallet}>
                

                <View style={{ alignItems: "center" }}>
                  <TouchableOpacity
                    onPress={changePage("WithdrawBtc", false)}
                    style={styles.touchables}
                  >
                    <Image
                      source={require("../assets/WITHDRAWAL-btn.png")}
                      style={styles.sizeIconBtn}
                    />
                  </TouchableOpacity>
                  <Text style={styles.textTouchable}>Withdraw</Text>
                </View>

                <View style={{ alignItems: "center" }}>
                  <TouchableOpacity
                    onPress={changePage("SendBtc", false)}
                    style={styles.touchables}
                  >
                    <Image
                      source={require("../assets/SEND-btn.png")}
                      style={styles.sizeIconBtn}
                    />
                  </TouchableOpacity>
                  <Text style={styles.textTouchable}>Send</Text>
                </View>

                <View style={{ alignItems: "center" }}>
                  <TouchableOpacity
                    // onPress={changePage('WalletInvoice', false)}
                    onPress={changePage("BuyBtc", false)}
                    style={styles.touchables}
                  >
                    <Image
                      source={require("../assets/RECEIVE-btn.png")}
                      style={styles.sizeIconBtn}
                    />
                  </TouchableOpacity>
                  <Text style={styles.textTouchable}>Receive</Text>
                </View>
              </View>
            </View>
          </RefreshControl>
        </StandardLinearGradient>
        <View style={styles.viewMono}>
          <View style={styles.bodyBlockTitle}>
            <Text style={styles.titleHistory}>Last Transactions</Text>
          </View>
          <ScrollView>
            <View style={styles.viewPt} />
            <LoadMoreDate store={store} modalRef={this.modal} currency="BTC" />
            <View style={{ paddingBottom: 150 }} />
          </ScrollView>
        </View>
      </View>
    </ModalComponent>
  );
};
*/