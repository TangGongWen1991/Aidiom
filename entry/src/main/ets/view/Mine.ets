@Component
export struct Mine {
  @State message: string = 'Hello World';

  build() {
    Column(){
      UserInfoView()
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
    }
    .padding("20vp")
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}


@Component
struct UserInfoView{
  build() {
    Row(){
      Image($r("app.media.icon_storycat")).width("60vp").height("60vp").borderRadius("30vp")
      Column(){
        Text("猫小米").height("70%").align(Alignment.TopStart).fontColor(Color.Black).fontSize("16fp")
        Text("登录可体验完整的功能").height("30%").align(Alignment.BottomStart).fontColor(Color.Gray).fontSize("14fp")
      }.margin({left:"10vp"}).alignItems(HorizontalAlign.Start).height("100%").width("100%")

    }.alignItems(VerticalAlign.Center).height("60vp").width("100%").margin({top:"10vp"})
  }
}

@Component
struct PayInfoView{
  build() {
    Row(){

    }.borderRadius("10vp").height("120vp").width("100%").backgroundColor(Color.Yellow).margin({top:"10vp"})
  }
}
