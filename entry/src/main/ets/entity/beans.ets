export class TabBarItem {
  name: Resource = $r('app.string.tab_home_name')
  icon: Resource = $r('app.media.ic_tabs_icon')
  selectIcon: Resource = $r('app.media.ic_tabs_icon_selected')
}



export class StoryItem{
  name: string ="测试1";
  bg: string = "https://i2.hdslb.com/bfs/archive/3035faa638a2098e9987e6c45cbd88f916966eb9.jpg"
  type:string = ""
  id: string = ""
  categoryId:string = ""
}



export class TopPicItem{
  topPicId:string = ""
  categoryId:string = ""

  topPicName:string = ""
  cover:string = "https://i2.hdslb.com/bfs/archive/3035faa638a2098e9987e6c45cbd88f916966eb9.jpg"
}

export class CategoryItem{
  id:string = ""
  name:string = "分类1"
  cover:string = "https://i2.hdslb.com/bfs/archive/3035faa638a2098e9987e6c45cbd88f916966eb9.jpg"
}