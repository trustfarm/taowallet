<main class="tab-pane block--container active" ng-if="globalService.currentTab==globalService.tabs.generateWallet.id" ng-controller='walletGenCtrl' role="main" ng-cloak>

  <article class="block__wrap gen__1" ng-show="!wallet && !showGetAddress">

    <section class="block__main gen__1--inner">
      <br />
      <h1 translate="NAV_GenerateWallet" aria-live="polite"> Create New Wallet</h1>
      <h4 translate="GEN_Label_1"> Enter password </h4>
      <div class="input-group">
        <input name="password"
             class="form-control"
             type="{{showPass && 'password' || 'text'}}"
             placeholder="{{'GEN_Placeholder_1' | translate }}"
             ng-model="password"
             ng-class="isStrongPass() ? 'is-valid' : 'is-invalid'"
             aria-label="{{'GEN_Label_1' |translate}}"/>
        <span tabindex="0" aria-label="make password visible" role="button" class="input-group-addon eye" ng-click="showPass=!showPass"></span>
      </div>
      <a tabindex="0" role="button" class="btn btn-primary" func="generateSingleWallet" ng-click="genNewWallet()" translate="NAV_GenerateWallet">Generate Wallet</a>
      <p translate="x_PasswordDesc"> </p>
      <br>
    </section>

    <section class="block__help">
      <h2>계정접속</h2>
      <ul><li>
        <span translate="GEN_Help_1">귀하의</span>
        <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id">지갑</a>을
        <span translate="GEN_Help_2">사용하여 귀하의 계정에 접속하세요.</span><br>
        <span translate="GEN_Help_3">귀하의 기기에 귀하의 지갑이 있습니다.</span>
      </li></ul>

      <!-- <h2>원장</h2>
      <ul><li>
        <span translate="GEN_Help_1">귀하의</span>
        <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id">원장을</a>
        <span translate="GEN_Help_2">사용하여 귀하의 계정에 액세스하십시오.</span>
        <span translate="GEN_Help_3">Your device * is * your wallet.</span>
      </li></ul> -->

      <!-- <h2>Jaxx / Metamask:</h2>
      <ul><li>
        <span translate="GEN_Help_1">Use your</span>
        <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id" translate="x_Mnemonic">Mnemonic Phrase</a>
        <span translate="GEN_Help_2">to access your account.</span>
      </li></ul> -->

      <!-- <h2>Mist / Geth / Parity:</h2>
      <ul><li>
        <span translate="GEN_Help_1">Use your</span>
        <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id" translate="x_Keystore2">Keystore File (UTC / JSON)</a>
        <span translate="GEN_Help_2">to access your account.</span>
      </li></ul> -->

      <!-- <h2 translate="GEN_Help_4">Guides &amp; FAQ</h2>
      <ul>
        <li><strong>
          <a href="https://myetherwallet.groovehq.com/knowledge_base/topics/how-do-i-create-a-new-wallet" target="_blank" rel="noopener" translate="GEN_Help_5">
            How to Create a Wallet
          </a>
        </strong></li>
        <li><strong>
          <a href="https://myetherwallet.groovehq.com/knowledge_base/categories/getting-started-443" target="_blank" rel="noopener" translate="GEN_Help_6">
            Getting Started
          </a></strong></li>
      </ul> -->
    </section>

  </article>


  <article role="main" class="block__wrap gen__2" ng-show="wallet && !showPaperWallet" > <!-- -->

    <section class="block__main gen__2--inner">
      <br />
      <h1 translate="GEN_Label_2">Save your Keystore File (UTC / JSON) </h1>

      <a tabindex="0" role="button"
         class="btn btn-primary"
         href="{{blobEnc}}"
         download="{{encFileName}}"
         aria-label="{{'x_Download'|translate}} {{'x_Keystore'|translate}}"
         aria-describedby="x_KeystoreDesc"
         ng-click="downloaded()"
         target="_blank" rel="noopener">
        <span translate="x_Download"> DOWNLOAD </span> <span translate="x_Keystore2"> Keystore File (UTC / JSON) </span>
      </a>

      <div class="warn">
        <p><strong>잃지 마십시오!</strong> 당신이 그것을 잃어버리면 찾을 수 없습니다.</p>
        <p><strong>공유하지 마십시오!</strong> 이 파일을 악의적인 / 피싱 사이트에서 사용하면 자금이 도난 당할 수 있습니다.</p>
        <p><strong>백업을 만드십시오!</strong> 언젠가는 가치가 있을 수 있는 수백만 달러처럼 확보하십시오.</p>
      </div>

      <p>
        <a tabindex="0" role="button" class="btn btn-danger" ng-class="fileDownloaded ? '' : 'disabled' " ng-click="continueToPaper()" translate="GET_ConfButton">
          I understand. Continue.
        </a>
      </p>

    </section>

    <section class="block__help">
      <h2 translate="GEN_Help_8"> 파일이 다운로드 안됩니까? </h2>
      <ul>
        <li translate="GEN_Help_9">  Chrome을 사용해보세요. </li>
        <li translate="GEN_Help_10"> 파일을 마우스 오른쪽 버튼으로 클릭하여 저장. 파일 이름:</li>
        <input value="{{encFileName}}" class="form-control input-sm" />
      </ul>

      <h2 translate="GEN_Help_11">이 파일을 컴퓨터에서 열지 마십시오.</h2>
      <ul><li translate="GEN_Help_12">TrustCoinWallet 또는 기타 지갑 클라이언트을 통해 지갑을 잠금 해제하는 데 사용하십시오.</li></ul>

      <!-- <h2 translate="GEN_Help_4">Guides &amp; FAQ</h2>
      <ul>
        <li><a href="https://myetherwallet.groovehq.com/knowledge_base/topics/how-do-i-save-slash-backup-my-wallet" target="_blank" rel="noopener"><strong translate="GEN_Help_13">How to Back Up Your Keystore File</strong></a></li>
        <li><a href="https://myetherwallet.groovehq.com/knowledge_base/topics/what-are-the-different-formats-of-a-private-key" target="_blank" rel="noopener"><strong translate="GEN_Help_14">What are these Different Formats?</a></strong></li>
      </ul> -->

    </section>

  </article>


  <article role="main" class="block__wrap gen__3" ng-show="showPaperWallet">

    <section class="block__main gen__3--inner">

      <br />

      <h1 translate="GEN_Label_5"> <code>개인 키</code> 저장</h1>
      <input aria-label="{{'x_PrivKey'|translate}}" aria-describedby="x_PrivKeyDesc"
             value="{{wallet.getPrivateKeyString()}}"
             class="form-control"
             type="text"
             readonly="readonly"
             style="max-width: 50rem;margin: auto;"/>

      <br />

      <a tabindex="0" aria-label="{{'x_Print'|translate}}" aria-describedby="x_PrintDesc" role="button" class="btn btn-primary" ng-click="printQRCode()" translate="x_Print">PRINT</a>

      <div class="warn">
        <p><strong>잃지 마십시오!</strong> 당신이 그것을 잃어버리면 찾을 수 없습니다.</p>
        <p><strong>공유하지 마십시오!</strong> 이 파일을 악의적인 / 피싱 사이트에서 사용하면 자금이 도난 당할 수 있습니다.</p>
        <p><strong>백업을 만드십시오!</strong> 언젠가는 가치가 있을 수 있는 수백만 달러처럼 확보하십시오.</p>
      </div>

      <br />

      <a class="btn btn-default btn-sm" ng-click="getAddress()">
        <span translate="GEN_Label_3"> 주소 저장 </span> →
      </a>

    </section>

    <section class="block__help">
      <h2 translate="GEN_Help_4">Guides &amp; FAQ</h2>
      <ul>
        <li><a href="https://myetherwallet.groovehq.com/knowledge_base/topics/how-do-i-save-slash-backup-my-wallet" target="_blank" rel="noopener">
          <strong translate="HELP_2a_Title">How to Save & Backup Your Wallet.</strong>
        </a></li>
        <!-- <li><a href="https://myetherwallet.groovehq.com/knowledge_base/topics/protecting-yourself-and-your-funds" target="_blank" rel="noopener">
          <strong translate="GEN_Help_15">자금 손실 및 도난 방지.</strong>
        </a></li>
        <li><a href="https://myetherwallet.groovehq.com/knowledge_base/topics/what-are-the-different-formats-of-a-private-key" target="_blank" rel="noopener">
          <strong translate="GEN_Help_16">What are these Different Formats?</strong>
        </a></li> -->
      </ul>

      <!-- <h2 translate="GEN_Help_17"> Why Should I? </h2> -->
      <!-- <ul>
        <li translate="GEN_Help_18"> 보조 백업을 가지고 있습니다. </li>
        <li translate="GEN_Help_19"> 암호를 잊어 버린 경우를 대비하여 </li>
        <li>
          <a href="https://myetherwallet.groovehq.com/knowledge_base/topics/how-do-i-safely-slash-offline-slash-cold-storage-with-myetherwallet" target="_blank" rel="noopener" translate="GEN_Help_20">Cold Storage</a>
        </li>
      </ul> -->

      <h2 translate="x_PrintDesc"></h2>

    </section>

  </article>

  <article class="text-left" ng-show="showGetAddress">
    <div class="clearfix collapse-container">
      <div ng-click="wd = !wd">
        <a class="collapse-button"><span ng-show="wd">+</span><span ng-show="!wd">-</span></a>
        <h1 traslate="GEN_Unlock">지갑의 잠금을 해제하여 주소를 확인하십시오.</h1>
        <p translate="x_AddessDesc"></p>
      </div>
      <div ng-show="!wd">
          @@if (site === 'mew' ) {  <wallet-decrypt-drtv></wallet-decrypt-drtv>         }
          @@if (site === 'cx' )  {  <cx-wallet-decrypt-drtv></cx-wallet-decrypt-drtv>   }
      </div>
    </div>

    <div class="row" ng-show="wallet!=null" ng-controller='viewWalletCtrl'>

      @@if (site === 'cx' ) {  @@include( './viewWalletInfo-content.tpl', { "site": "cx" } )    }
      @@if (site === 'mew') {  @@include( './viewWalletInfo-content.tpl', { "site": "mew" } )   }

    </div>
  </article>

</main>
