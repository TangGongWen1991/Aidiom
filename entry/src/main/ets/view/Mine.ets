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
          Image($r("app.media.icon_favorite")).width("20vp").height("20vp")
        }
      }.borderRadius("10vp").padding("10vp").width("100%")
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
        Text("猫小米").height("70%").align(Alignment.TopStart).fontColor(Color.Black).fontSize("18fp")
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
