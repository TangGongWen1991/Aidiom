export class TabBarItem {
  name: Resource = $r('app.string.tab_home_name')
  icon: Resource = $r('app.media.ic_tabs_icon')
  selectIcon: Resource = $r('app.media.ic_tabs_icon_selected')
}



export class Story{
  id: string = ""
  title: string ="测试标题";
  typeid: number = 0
  content:string = ""


}

export class UserInfo{
  name?:string = "游客"
  cover?:string = ""
  unionID?:string=""
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