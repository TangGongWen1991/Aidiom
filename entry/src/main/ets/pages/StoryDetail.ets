import { pinyin4js } from '@ohos/pinyin4js/src/main/ets/components';
import { Story } from '../entity/beans';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct StoryDetail {
  @State story: Story  = router.getParams() as Story;
  @State showPinyin:boolean = true
  build() {
    Scroll(){
      Column(){
        TitleView({title:this.story.title.split(''),showPinyin:this.showPinyin})
        DetailView({content:this.story.content.split(''),showPinyin:this.showPinyin})
      }.alignItems(HorizontalAlign.Center)
      .padding({top:20,bottom:20})
      .backgroundColor(0xF9CF93)
      .width('100%')
      .padding({left:10,right:10})
    }.scrollBar(BarState.Auto)



  }
}

@Component
struct TitleView {
  @Prop showPinyin:boolean
  @Prop title: String[]
  build() {

      Row(){
        ForEach(this.title, (word: string) => {

            Column(){
              if (this.showPinyin) {
                Text(pinyin4js.convertToPinyinString(word, '', pinyin4js.WITH_TONE_MARK))
                  .fontSize(16)
              }
              Text(word)
                .fontSize(22)
                .padding({top:4})

                .textAlign(TextAlign.Center)
            }.padding({left:5})

        })
      }.width('100%').height(60).justifyContent(FlexAlign.Center)


  }

}



@Component
struct DetailView {
  @Prop showPinyin:boolean
  @Prop content: String[]
  build() {
      Grid() {
        ForEach(this.content, (word: string) => {

            GridItem() {
              Column(){
                if (this.showPinyin) {
                  Text(pinyin4js.convertToPinyinString(word, '', pinyin4js.WITH_TONE_MARK))
                    .fontSize(12)
                }
                Text(word)
                  .fontSize(18)
                  .padding({top:4})

                  .textAlign(TextAlign.Center)
              }.width('100%').height('100%').alignItems(HorizontalAlign.Center)

            }.width('100%').height(40)
        })
      }
      // .columnsTemplate('1fr 1fr 1fr')
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .rowsGap(10)
      .width("100%").padding({top:20})


  }
}


