import {  Story, TopPicItem } from "../entity/beans";

import recommendViewModel from "../viewmodel/RecommendViewModel";
import router from "@ohos.router";
import { promptAction } from "@kit.ArkUI";
import { LoginService } from "../http/HttpUtil";
import { LoginDTO } from "../model/HttpModel";
import { CommonConstants } from "../constants/CommonConstants";

@Component
export struct Recommend {
@State recItems:Array<Story> = []

  @State historyItems:Array<Story> = []

  @State topItems:Array<TopPicItem> = []


  aboutToAppear(): void {
  this.historyItems = recommendViewModel.getHistoryData()
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
              ForEach(this.historyItems ,(item : Story,index :number)=>{
                HistoryItemView({historyItem:item})
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

            ForEach(this.recItems ,(item : Story,index :number)=>{
              GridItem() {
                RecItemView({ recItem: item })
              }
            })

          }.width("100%")
          .rowsTemplate("1fr 1fr 1fr")
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
  @Prop recItem:Story
  build() {
    Stack(){
       Image(CommonConstants.STORY_BG[Math.floor(Math.random() * 8)]).height("200vp").width("160vp").borderRadius(8)
      Text(this.recItem.title)
        .fontSize("18fp")
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Lighter)
        .align(Alignment.Center)
      }.onClick(()=>{
      router.pushUrl({url:"pages/StoryDetail"})

    })

  }
}


@Component
export struct HistoryItemView{
  @Prop historyItem:Story
  build() {
    Column(){
      Image(CommonConstants.STORY_BG[Math.floor(Math.random() * 8)]).width("30%").borderRadius(6)
      Text(this.historyItem.title)
        .margin({top:"10vp"})
        .fontSize("16fp")
    }.alignItems(HorizontalAlign.Center).onClick(()=>{
      router.pushUrl({url:"pages/StoryDetail"})
    })
  }
}


@Component
export struct TopPicItemView{
  @Prop topItem:TopPicItem
  build() {
    Column(){
      Image(this.topItem.cover).width("100%").height("20%").borderRadius(6)
    }.alignItems(HorizontalAlign.Center).onClick(()=>{
        promptAction.showToast({message:"点击了推荐主题"})
    })
  }
}


@Component
export struct TopPicView{
  @Prop topPicItems:TopPicItem[]
  build() {
    Column({space:"16vp"}){
      ForEach(this.topPicItems ,(item : TopPicItem,index :number)=>{
        TopPicItemView({topItem:item})
      })
    }.alignItems(HorizontalAlign.Center)
  }
}


