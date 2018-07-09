<article class="col-sm-8 view-wallet-content">

  <section class="block">
    <div class="col-xs-11">
      <div class="account-help-icon">
        <img src="images/icon-help.svg" class="help-icon" />
        <p class="account-help-text" translate="x_AddessDesc">귀하의 주소는 귀하의 계정 번호 또는 귀하의 공개 키로도 알려져 있습니다. 그것은 사람들과 공유하여 그들이 당신에게 이더 나 토큰을 보낼 수 있습니다. 다채로운 주소 아이콘을 찾으십시오. 어딘가에 주소를 입력 할 때마다 종이 지갑과 일치하는지 확인하십시오.</p>
        <h5 translate="x_Address">Your Address:</h5>
      </div>
      <input class="form-control" type="text" ng-value="wallet.getChecksumAddressString()" readonly="readonly">
    </div>

    <div class="col-xs-1 address-identicon-container">
      <div class="addressIdenticon" title="Address Indenticon" blockie-address="{{wallet.getAddressString()}}" watch-var="wallet"></div>
    </div>

    <div class="col-xs-12" ng-show='showEnc'>
      <div class="account-help-icon">
        <img src="images/icon-help.svg" class="help-icon" />
        <p class="account-help-text" translate="x_KeystoreDesc">This Keystore / JSON file matches the format used by Mist & Geth so you can easily import it in the future. It is the recommended file to download and back up.</p>
        <h5 translate="x_Keystore">Keystore/JSON File (Recommended • Encrypted • Mist/Geth Format)</h5>
      </div>
      <a class="btn btn-info btn-block" href="{{blobEnc}}" download="{{encFileName}}" translate="x_Download"> DOWNLOAD </a>
    </div>

    <div class="col-xs-12" ng-show="wallet.type=='default'">
      <div class="account-help-icon">
        <img src="images/icon-help.svg" class="help-icon" />
        <p class="account-help-text" translate="x_PrivKeyDesc">This is the unencrypted text version of your private key, meaning no password is necessary. If someone were to find your unencrypted private key, they could access your wallet without a password. For this reason, encrypted versions are typically recommended.</p>
        <h5>
          <span translate="x_PrivKey">Private Key (unencrypted)</span>
        </h5>
      </div>
      <div class="input-group">
        <input class="form-control no-animate" type="{{pkeyVisible ? 'text' : 'password'}}" ng-value="wallet.getPrivateKeyString()" readonly="readonly">
        <span tabindex="0" aria-label="make private key visible" role="button" class="input-group-addon eye" ng-click="showHidePkey()"></span>
      </div>
    </div>


    <div class="col-xs-12" ng-show="wallet.type=='default'">
      <div class="account-help-icon">
        <img src="images/icon-help.svg" class="help-icon" />
        <p class="account-help-text" translate="x_PrintDesc">ProTip: Click print and save this as a PDF, even if you do not own a printer!</p>
        <h5 translate="x_Print">Print Paper Wallet:</h5>
      </div>
      <a class="btn btn-info btn-block" ng-click="printQRCode()" translate="x_Print">Print Paper Wallet</a>
    </div>
  </section>

  <section class="block">
    <div class="col-xs-6">
      <h5 translate="x_Address">Your Address:</h5>
      <div class="qr-code" qr-code="{{wallet.getChecksumAddressString()}}" watch-var="wallet" width="100%"></div>
    </div>
    <div class="col-xs-6">
      <h5 ng-show="wallet.type=='default'">
        <span translate="x_PrivKey">Private Key (unencrypted)</span>
      </h5>
      <div class="qr-pkey-container" ng-show="wallet.type=='default'">
        <div class="qr-overlay" ng-show="!pkeyVisible"></div>
        <div class="qr-code" qr-code="{{wallet.getPrivateKeyString()}}" watch-var="wallet" width="100%"></div>
        <div class="input-group">
          <input class="form-control no-animate" type="{{pkeyVisible ? 'text' : 'password'}}" ng-value="wallet.getPrivateKeyString()" readonly="readonly" style="display:none;width:0;height:0;padding:0">
          <span tabindex="0" aria-label="make private key visible" role="button" class="input-group-addon eye" ng-click="showHidePkey()"></span>
        </div>
      </div>
    </div>
  </section>

</article>

<article class="col-sm-4">
  <wallet-balance-drtv></wallet-balance-drtv>
</article>
