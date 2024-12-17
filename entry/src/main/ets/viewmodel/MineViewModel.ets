import { CommonConstants } from "../constants/CommonConstants";
import { CategoryItem, UserInfo } from "../entity/beans";
import commonEventManager from "@ohos.commonEventManager";
import { BusinessError } from "@ohos.base";
import PreferenceModel from "../model/PreferenceModel";
import { hilog } from "@kit.PerformanceAnalysisKit";
import { authentication } from "@kit.AccountKit";
import util from "@ohos.util";
import router from "@ohos.router";


export class MineViewModel{


  registerAccountState(listener:()=>void){
    //订阅者信息。
    const subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: [commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN,commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT]
    };
    let subscriber: commonEventManager.CommonEventSubscriber;

    //创建订阅者。
    commonEventManager.createSubscriber(subscribeInfo)
      .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        subscriber = commonEventSubscriber;
        //订阅公共事件。
        commonEventManager.subscribe(subscriber,
          (error: BusinessError, data: commonEventManager.CommonEventData) => {
            if (error) {
              hilog.error(0x0000, 'testTag',
                `Failed to subscribe , code is ${error.code}, message is ${error.message}`);
            } else {
              if (data.event === commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN) {
                // 订阅到华为账号登录事件

              }
              if (data.event === commonEventManager.Support.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT) {
                listener()
              }
            }
          });
      })
      .catch((err: BusinessError) => {
        hilog.error(0x0000, 'testTag', `Failed to createSubscriber. Code: ${err.code}, message: ${err.message}`);
      });

  }




  requestUserInfo(success: (info: UserInfo) => void){
    // 创建授权请求，并设置参数
    const authRequest = new authentication.HuaweiIDProvider().createAuthorizationWithHuaweiIDRequest();
    // 获取头像昵称需要传如下scope
    authRequest.scopes = ['profile'];

    // 用户是否需要登录授权，该值为true且用户未登录或未授权时，会拉起用户登录或授权页面
    authRequest.forceAuthorization = true;
    // 用于防跨站点请求伪造
    authRequest.state = util.generateRandomUUID();
    // 执行授权请求
    try {
      const controller = new authentication.AuthenticationController(getContext(this));
      controller.executeRequest(authRequest).then((data) => {
        const authorizationWithHuaweiIDResponse = data as authentication.AuthorizationWithHuaweiIDResponse;
        const state = authorizationWithHuaweiIDResponse.state;
        if (state != undefined && authRequest.state != state) {
          hilog.error(0x0000, 'testTag', `Failed to authorize. The state is different, response state: ${state}`);
          return;
        }
        hilog.info(0x0000, 'testTag', 'Succeeded in authentication.');
        const authorizationWithHuaweiIDCredential = authorizationWithHuaweiIDResponse.data!;

        let cover = authorizationWithHuaweiIDCredential.avatarUri;
        let name = authorizationWithHuaweiIDCredential.nickName;
        let  unionID = authorizationWithHuaweiIDCredential.unionID;
        if (unionID!=null) {
          PreferenceModel.putPreference("unionID",unionID)
          let userInfo = new UserInfo()
          userInfo.name = name
          userInfo.cover = cover
          userInfo.unionID = unionID
          success(userInfo)
        }

      }).catch((err: BusinessError) => {
        this.dealAllError(err);
      });
    } catch (error) {
      this.dealAllError(error);
    }


  }

  // 错误处理
  dealAllError(error: BusinessError): void {

    hilog.error(0x0000, 'testTag', `Failed to auth. Code: ${error.code}, message: ${error.message}`);
  }

}
let mineViewModel = new MineViewModel();

export default mineViewModel as MineViewModel;