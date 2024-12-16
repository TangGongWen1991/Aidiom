import { LoginWithHuaweiIDButton, loginComponentManager } from '@kit.AccountKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct HuaweiLogin {
  @State isAgreed: boolean = false;
  build() {
    Column() {
      // App Logo
      Image($r('app.media.app_icon'))// Replace with your logo resource
        .width(100)
        .height(100)
        .margin({ top: 20, bottom: 20 })
        .alignSelf(ItemAlign.Center)
      Text('Huawei One-Tap Login')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
        .margin({ top: 20 })

      PreviewLoginButtonPage()
      Blank()
        .flexGrow(1)

      // Radio Button and Agreement Text at the bottom
      Row() {
        Toggle({ type: ToggleType.Checkbox, isOn: this.isAgreed })
          .onChange((isOn: boolean) => {
            if (isOn) {
              this.isAgreed = isOn;
            }
          }).width(20).height(20)
        //
        //
        // Text('I agree to the ' + Span(
        //   "测试").onClick(_ => {
        //
        // }) + "").fontSize(14)


      }

      .margin({ bottom: 20 })
      .alignSelf(ItemAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
  }



@Component
struct PreviewLoginButtonPage {
  // 构造LoginWithHuaweiIDButton组件的控制器
  controller: loginComponentManager.LoginWithHuaweiIDButtonController =
    new loginComponentManager.LoginWithHuaweiIDButtonController()
      .onClickLoginWithHuaweiIDButton((error: BusinessError, response: loginComponentManager.HuaweiIDCredential) => {
        if (error) {
          hilog.error(0x0000, 'testTag',
            `Failed to onClickLoginWithHuaweiIDButton. Code: ${error.code}, message: ${error.message}`);
          return;
        }

        if (response) {
          hilog.info(0x0000, 'testTag', 'Succeeded in getting response.');
          const authCode = response.authorizationCode;
          const openID = response.openID;
          const unionID = response.unionID;
          const idToken = response.idToken;
          // 开发者处理authCode、openID、unionI、idToken
        }
      });

  build() {
    Column() {
      Column() {
        Column() {
          LoginWithHuaweiIDButton({
            params: {
              // LoginWithHuaweiIDButton支持的样式
              style: loginComponentManager.Style.BUTTON_RED,
              // 账号登录按钮在登录过程中展示加载态
              extraStyle: {
                buttonStyle: new loginComponentManager.ButtonStyle().loadingStyle({
                  show: true
                })
              },
              // LoginWithHuaweiIDButton的边框圆角半径
              borderRadius: 24,
              // LoginWithHuaweiIDButton支持的登录类型
              loginType: loginComponentManager.LoginType.ID,
              // LoginWithHuaweiIDButton支持按钮的样式跟随系统深浅色模式切换
              supportDarkMode: true,
              // verifyPhoneNumber：如果华为账号用户在过去90天内未进行短信验证，是否拉起Account Kit提供的短信验证码页面
              verifyPhoneNumber: true
            },
            controller: this.controller
          })
        }
        .height(40)
      }.width('100%')
    }
    .justifyContent(FlexAlign.Center)
    .constraintSize({ minHeight: '100%' })
    .margin({
      left: 16,
      right: 16
    })
  }
}