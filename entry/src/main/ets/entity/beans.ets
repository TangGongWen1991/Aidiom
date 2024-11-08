export class TabBarItem {
  name: Resource = $r('app.string.tab_home_name');
  icon: Resource = $r('app.media.ic_tabs_icon');
  selectIcon: Resource = $r('app.media.ic_tabs_icon_selected');
}

export class RecommendItem{
  name: Resource = $r('app.string.tab_home_name');
  bg: string = "";
  type:string = ""
  id: string = "";
}


export class MoreRecItem{
  categoryId:string = ""
  categoryName:string = ""
  items:RecommendItem[] = []
}