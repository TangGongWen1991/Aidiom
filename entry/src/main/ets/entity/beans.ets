export class TabBarItem {
  name: Resource = $r('app.string.tab_home_name')
  icon: Resource = $r('app.media.ic_tabs_icon')
  selectIcon: Resource = $r('app.media.ic_tabs_icon_selected')
}



export class Story{
  id: string = ""
  title: string ="测试1";
  cover: string = "https://i2.hdslb.com/bfs/archive/3035faa638a2098e9987e6c45cbd88f916966eb9.jpg"
  storytype:number = 0
  content:string = ""


}



export class TopPicItem{
  topPicId:string = ""
  categoryId:string = ""

  topPicName:string = ""
  cover:string = "https://book.img.zhangyue01.com/group61/M00/9D/8A/CmQUOFydrJGEQAYlAAAAAB3pQhU181838262.jpg"
}

export class CategoryItem{
  id:number =0
  name:string = "分类1"
  cover:string = "https://book.img.zhangyue01.com/group61/M00/9D/8A/CmQUOFydrJGEQAYlAAAAAB3pQhU181838262.jpg"
}