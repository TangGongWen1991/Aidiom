import { UserInfo } from '../entity/beans';
import PreferenceModel from '../model/PreferenceModel';
import mineViewModel from "../viewmodel/MineViewModel";
import { LoginPanel, loginComponentManager } from '@kit.AccountKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';


@Component
export struct Mine {
  @State userInfo :UserInfo=new UserInfo()
  @State showLoginDialog:boolean = false
  @State loginState? :boolean = false

  build() {
    Column(){

      UserInfoView({userInfo:this.userInfo,show:this.showLoginDialog})
      PayInfoView()
      Text("其他设置").margin({top:"20vp"}).fontSize("12fp")
      Column(){
        Row(){
          Image($r("app.media.icon_favorite")).width("30vp").height("30vp")
          Text("我的收藏").fontSize("16fp").fontColor(Color.Black).margin({left:"10vp"})
        }
        .height("50vp")
        .width("100%")
        Row(){
          Image($r("app.media.icon_support_agent")).width("30vp").height("30vp")
          Text("帮助与反馈").fontSize("16fp").fontColor(Color.Black).margin({left:"10vp"})
        }
        .height("50vp")
        .width("100%")
        Row(){
          Image($r("app.media.icon_thumb_up")).width("30vp").height("30vp")
          Text("好评鼓励").fontSize("16fp").fontColor(Color.Black).margin({left:"10vp"})
        }
        .height("50vp")
        .width("100%")
        Row(){
          Image($r("app.media.icon_security")).width("30vp").height("30vp")
          Text("安全隐私管理").fontSize("16fp").fontColor(Color.Black).margin({left:"10vp"})
        }
        .height("50vp")
        .width("100%")
        Row(){
          Image($r("app.media.icon_forum")).width("30vp").height("30vp")
          Text("加入小窝").fontSize("16fp").fontColor(Color.Black).margin({left:"10vp"})
        }
        .height("50vp")
        .width("100%")
        Row(){
          Image($r("app.media.icon_share")).width("30vp").height("30vp")
          Text("分析好友").fontSize("16fp").fontColor(Color.Black).margin({left:"10vp"})
        }
        .height("50vp")
        .width("100%")
      }
      .borderRadius("10vp")
      .width("100%")
      .alignItems(HorizontalAlign.Start)
      .backgroundColor(Color.Gray)
      .margin({top:"20vp"})
      PreviewLoginPanelPage({show:this.showLoginDialog})

    }
    .padding("20vp")
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)

  }


  aboutToAppear(): void {
    this.userInfo = PreferenceModel.getPreference("userInfo",new UserInfo()) as UserInfo
    mineViewModel.registerAccountState(()=>{
      PreferenceModel.putPreference("userInfo", new UserInfo())
    })


  }



}


@Component
struct UserInfoView{
  @Link userInfo:UserInfo
  @Link show:boolean
  build() {
    Row(){
      if (this.userInfo.cover==""){
        Image($r("app.media.icon_storycat")).width("60vp").height("60vp").borderRadius("30vp")
      }else {
        Image(this.userInfo.cover).width("60vp").height("60vp").borderRadius("30vp")
      }
      Column(){
        Text(this.userInfo.name).height("70%").align(Alignment.TopStart).fontColor(Color.Black).fontSize("16fp")
        if (this.userInfo.unionID!=""){
          Text("订阅我们开启AI故事").height("30%").align(Alignment.BottomStart).fontColor(Color.Gray).fontSize("14fp")
        }else {
          Text("登录可体验完整的功能").height("30%").align(Alignment.BottomStart).fontColor(Color.Gray).fontSize("14fp")
            .onClick(_=>{
              // mineViewModel.requestUserInfo(info=>{
              //   PreferenceModel.putPreference("userInfo", info)
              //   this.userInfo = info
              // })
              this.show = true
            })

        }

      }.margin({left:"10vp"}).alignItems(HorizontalAlign.Start).height("100%").width("100%").onClick(_=>{
      })

    }.alignItems(VerticalAlign.Center).height("60vp").width("100%").margin({top:"10vp"})
  }


}

@Component
struct PreviewLoginPanelPage {
  // 是否展示LoginPanel组件
  @Link show: boolean ;
  // 定义LoginPanel展示的隐私文本，展示用户服务协议、隐私协议和华为账号用户认证协议
  privacyText: loginComponentManager.PrivacyText[] = [{
    text: '已阅读并同意',
    type: loginComponentManager.TextType.PLAIN_TEXT
  }, {
    text: '《用户服务协议》',
    tag: '用户服务协议',
    type: loginComponentManager.TextType.RICH_TEXT
  }, {
    text: '《隐私协议》',
    tag: '隐私协议',
    type: loginComponentManager.TextType.RICH_TEXT
  }, {
    text: '和',
    type: loginComponentManager.TextType.PLAIN_TEXT
  }, {
    text: '《华为账号用户认证协议》',
    tag: '华为账号用户认证协议',
    type: loginComponentManager.TextType.RICH_TEXT
  }];
  // 定义LoginPanel展示的其他方式登录Icon
  iconArray: loginComponentManager.LoginIcon[] = [{
    icon: $r('app.media.icon_logo'),
    tag: '其他方式登录'
  }];
  // 构造LoginPanel组件的控制器
  controller: loginComponentManager.LoginPanelController = new loginComponentManager.LoginPanelController()
    // 当登录类型不是QUICK_LOGIN且未设置协议时，如果需要展示自定义协议弹框，需要设置协议状态为NOT_ACCEPTED
    .setAgreementStatus(loginComponentManager.AgreementStatus.NOT_ACCEPTED)
      // 用户点击其他方式登录展示隐私协议弹框
    .setShowAgreementForOptionalLogin()
    .onClickLoginWithHuaweiIDButton((error: BusinessError, response: loginComponentManager.HuaweiIDCredential) => {
      hilog.info(0x0000, 'testTag', 'onClickLoginWithHuaweiIDButton');
      if (error) {
        this.dealAllError(error);
        return;
      }
      if (response) {
        // 获取到Authorization Code后，传给应用服务器
        const authorizationCode = response.authorizationCode;
        PreferenceModel.putPreference("authCode",authorizationCode)
        hilog.info(0x0000, 'testTag', 'response');
        this.show = false;
        return;
      }
    })
    .onClickOptionalLoginButton(() => {
      hilog.info(0x0000, 'testTag', 'onClickOptionalLoginButton');
      this.show = false;
    })
    .onClickOptionalLoginIcon((error: BusinessError, tag: string) => {
      if (error) {
        this.dealAllError(error);
        return;
      }
      hilog.info(0x0000, 'testTag', `onClickOptionalLoginIcon tag: ${tag}`);
      this.show = false;
    })
    .onClickPrivacyText((error: BusinessError, tag: string) => {
      if (error) {
        this.dealAllError(error);
        return;
      }
      // 应用需要根据tag实现协议页面的跳转逻辑
      hilog.info(0x0000, 'testTag', `onClickPrivacyText tag: ${tag}`);
    })
    .onClickCloseButton(() => {
      hilog.info(0x0000, 'testTag', 'onClickCloseButton');
      this.show = false;
    })
    .onChangeAgreementStatus((error: BusinessError, agreementStatus: loginComponentManager.AgreementStatus) => {
      if (error) {
        this.dealAllError(error);
        return;
      }
      hilog.info(0x0000, 'testTag', `onChangeAgreementStatus agreementStatus: ${agreementStatus}`);
    })
    .onClickEvent((error: BusinessError, clickEvent: loginComponentManager.ClickEvent) => {
      if (error) {
        this.dealAllError(error);
        return;
      }
      hilog.info(0x0000, 'testTag', `onClickEvent clickEvent: ${clickEvent}`);
    });

  // 错误处理
  dealAllError(error: BusinessError): void {
    hilog.error(0x0000, 'testTag', `Failed to login, errorCode=${error.code}, errorMsg=${error.message}`);
  }

  build() {
    if (this.show) {
      Stack() {
        LoginPanel({
          show: this.show,
          params: {
            appInfo: {
              appIcon: $r('app.media.icon_logo'),
              appName: '丸子故事',
            },
            privacyText: this.privacyText,
            // 参考华为账号开发指南获取匿名手机号
            anonymousPhoneNumber: '***********',
            // verifyPhoneNumber：如果华为账号用户在过去90天内未进行短信验证，是否拉起Account Kit提供的短信验证码页面
            verifyPhoneNumber: true,
            loginType: loginComponentManager.LoginType.QUICK_LOGIN,
            // optionalLoginAreaAttr和optionalLoginButtonAttr同时存在时优先展示optionalLoginAreaAttr
            optionalLoginAreaAttr: { iconArray: this.iconArray },
            optionalLoginButtonAttr: { text: '其他方式登录' }
          },
          controller: this.controller
        })
      }
      .height('100%')
      .width('100%')
    }
  }
}


@Component
struct PayInfoView{
  build() {
    Row(){

    }.borderRadius("10vp").height("120vp").width("100%").backgroundColor(Color.Yellow).margin({top:"10vp"})
  }
}
