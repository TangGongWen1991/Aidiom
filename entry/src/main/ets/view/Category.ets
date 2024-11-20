import { CategoryItem } from "../entity/beans"

@Component
export struct Category {
  @State cateGoryItems:Array<CategoryItem> = []


  build() {
    Grid(){

      ForEach(this.cateGoryItems ,(item : CategoryItem,index :number)=>{
        GridItem() {
          CategotyItemView({ cateGoryItem: item })
        }
      })

    }.maxCount(4).width("100%")
    .height("40%")
    .rowsTemplate("1fr 1fr")
    .columnsTemplate("1fr 1fr")
    .columnsGap(10)
    .rowsGap(8)
  }
}

@Component
export  struct CategotyItemView{
  @Prop cateGoryItem:CategoryItem
  build() {
    Column(){
      Image(this.cateGoryItem.cover).height("80%").borderRadius(8)
      Text(this.cateGoryItem.name)
        .margin({top:"6vp"})
        .fontSize("16fp")
        .height("20%")
    }.alignItems(HorizontalAlign.Center).alignItems(HorizontalAlign.Center)
    .onClick(()=>{

    })
  }
}


