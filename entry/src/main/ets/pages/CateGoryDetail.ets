@Entry
@Component
struct CateGoryDetail {
  @State texts: string[] = []
  @State page: number = 1
  @State isLoading: boolean = false

  build() {
    Column() {
      // 添加标题
      Text('我的文本列表')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      List({ space: 10 }) {
        ForEach(this.texts, (item: string) => {
          ListItem() {
            Text(item)
          }
        })
      }

    }
  }

  async loadMore() {
    this.isLoading = true
    try {
      const newTexts = await this.fetchData(this.page + 1)
      this.texts = this.texts.concat(newTexts)
      this.page++
    } catch (error) {
      console.error(error)
      // 显示错误提示信息
    } finally {
      this.isLoading = false
    }
  }

  async fetchData(page: number): Promise<string[]> {
    // // 模拟网络请求
    // await new Promise(resolve => setTimeout(resolve, 1000))
    // return Array.from({ length: 10 }, (_, i) => `Text ${page * 10 + i + 1}`)
    return ["1","2"]
  }
}