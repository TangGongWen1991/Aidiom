import { router } from '@kit.ArkUI'
import { Story } from '../entity/beans'
import categoryViewModel from '../viewmodel/CateGoryViewModel'

@Entry
@Component
struct CategoryDetail {
  @State cateGoryId: number = router.getParams() as number
  @State storyArray: Array<Story> = new Array

  aboutToAppear(): void {
    categoryViewModel.getCategoryStoryListById(this.cateGoryId)
  }

  build() {
    Column() {
      // 添加标题
      Text('成语故事')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      List({ space: 10 }) {
        ForEach(this.storyArray, (item: Story) => {
          ListItem() {
            Text(item.title)
          }
        })
      }

    }
  }


  async fetchData(page: number): Promise<string[]> {
    // // 模拟网络请求
    // await new Promise(resolve => setTimeout(resolve, 1000))
    // return Array.from({ length: 10 }, (_, i) => `Text ${page * 10 + i + 1}`)
    return ["1","2"]
  }
}