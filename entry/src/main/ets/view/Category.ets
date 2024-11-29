import { CategoryItem } from "../entity/beans"
import categoryViewModel from "../viewmodel/CateGoryViewModel"

@Component
export struct Category {
  @State cateGoryItems:Array<CategoryItem> = []
  aboutToAppear(): void {
    this.cateGoryItems = categoryViewModel.getCateGoryList()
  }

  build() {

        Grid(){

          ForEach(this.cateGoryItems ,(item : CategoryItem,index :number)=>{
            GridItem() {
              CategotyItemView({ cateGoryItem: item })
            }
          })

        }
        .scrollBar(BarState.Off)
        .padding("20vp")
        .columnsTemplate("1fr 1fr")
        .columnsGap(10)
        .rowsGap(8)
        .maxCount(this.cateGoryItems.length)

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
    }
    .height("45%")
    .alignItems(HorizontalAlign.Center)
    .onClick(()=>{

    })
  }
}


