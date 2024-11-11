import { RecommendItem } from "../entity/beans";

import recommendViewModel from "../viewmodel/RecommendViewModel";

@Component
export struct Recommend {
@State recItem:Array<RecommendItem> = []
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right });

  aboutToAppear(): void {
  this.recItem = recommendViewModel.getTodayRecommendData()
}
  build() {
    Column(){
      Text("今日推荐")
        .fontSize("20fp")
        .fontStyle(FontStyle.Normal)
        .fontWeight(FontWeight.Bold)
        .height("10%")
      Scroll(){
        Row({space:"20vp"}){
          ForEach(this.recItem ,(item : RecommendItem,index :number)=>{
            RecItemView({recItem:item})
          })
        }.alignItems(VerticalAlign.Center)
      }
      .height("20%")
      .scrollBar(BarState.Off)
      .scrollable(ScrollDirection.Horizontal)
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

@Component
export struct RecItemView{
  @Prop recItem:RecommendItem
  build() {
    Column(){
       Image(this.recItem.bg).width("30%")
      Text(this.recItem.name)
      }.alignItems(HorizontalAlign.Center).height("100%")
    .onClick(()=>{

    })
  }
}


