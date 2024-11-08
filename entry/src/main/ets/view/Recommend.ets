@Component
export struct Recommend {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Text("今日推荐")
        .fontSize("20fp")
        .fontStyle(FontStyle.Normal)
        .fontWeight(FontWeight.Bold)
        .height("10%")
      Text("更多")
        .fontSize("20fp")
        .fontStyle(FontStyle.Normal)
        .fontWeight(FontWeight.Bold)
        .height("10%")
    }
    .alignItems(HorizontalAlign.Start)
    .height('100%')
    .width('100%')
    .padding("20vp")
  }
}