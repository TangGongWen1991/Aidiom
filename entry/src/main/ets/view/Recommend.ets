import { RecommendItem, TopPicItem } from "../entity/beans";

import recommendViewModel from "../viewmodel/RecommendViewModel";

@Component
export struct Recommend {
@State recItems:Array<RecommendItem> = []
  @State topItems:Array<TopPicItem> = []


  aboutToAppear(): void {
  this.recItems = recommendViewModel.getTodayRecommendData()
    this.topItems = recommendViewModel.getRecommendTopicData()
}
  build() {

    Column(){
      Scroll(){
        Column(){

          Text("正在看")
            .fontSize("20fp")
            .fontStyle(FontStyle.Normal)
            .fontWeight(FontWeight.Bold)
            .height("10%")
          Scroll(){
            Row({space:"20vp"}){
              ForEach(this.recItems ,(item : RecommendItem,index :number)=>{
                HistoryItemView({recItem:item})
              })
            }.alignItems(VerticalAlign.Center).height("14%")
          }

          .scrollBar(BarState.Off)
          .scrollable(ScrollDirection.Horizontal)
          Text("推荐故事")
            .fontSize("20fp")
            .fontStyle(FontStyle.Normal)
            .fontWeight(FontWeight.Bold)
            .height("10%")
          Grid(){

            ForEach(this.recItems ,(item : RecommendItem,index :number)=>{
              GridItem() {
                RecItemView({ recItem: item })
              }
            })

          }.maxCount(4).width("100%")
          .height("40%")
          .rowsTemplate("1fr 1fr")
          .columnsTemplate("1fr 1fr")
          .columnsGap(10)
          .rowsGap(8)
          Text("更多专题")
            .fontSize("20fp")
            .fontStyle(FontStyle.Normal)
            .fontWeight(FontWeight.Bold)
            .height("10%")
          TopPicView({topPicItems:this.topItems})

        } .alignItems(HorizontalAlign.Start)

      }.scrollBar(BarState.Off)
    }
    .width('100%')
    .padding("20vp")
  }
}

@Component
export struct RecItemView{
  @Prop recItem:RecommendItem
  build() {
    Column(){
       Image(this.recItem.bg).height("80%").borderRadius(8)
      Text(this.recItem.name)
        .margin({top:"6vp"})
        .fontSize("16fp")
        .height("20%")
      }.alignItems(HorizontalAlign.Center).alignItems(HorizontalAlign.Center)
    .onClick(()=>{

    })
  }
}


@Component
export struct HistoryItemView{
  @Prop recItem:RecommendItem
  build() {
    Column(){
      Image(this.recItem.bg).width("30%").borderRadius(6)
      Text(this.recItem.name)
        .margin({top:"10vp"})
        .fontSize("16fp")
    }.alignItems(HorizontalAlign.Center)
    .onClick(()=>{

    })
  }
}


@Component
export struct TopPicItemView{
  @Prop topItem:TopPicItem
  build() {
    Column(){
      Image(this.topItem.cover).width("100%").height("20%").borderRadius(6)
    }.alignItems(HorizontalAlign.Center)
    .onClick(()=>{

    })
  }
}


@Component
export struct TopPicView{
  @Prop topPicItems:TopPicItem[]
  build() {
    Column({space:"10vp"}){
      ForEach(this.topPicItems ,(item : TopPicItem,index :number)=>{
        TopPicItemView({topItem:item})
      })
    }.alignItems(HorizontalAlign.Center)
  }
}


