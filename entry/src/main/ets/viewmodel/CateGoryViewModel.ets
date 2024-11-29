import { CategoryItem } from "../entity/beans";


export class CateGoryViewModel{
  getCateGoryList(): Array<CategoryItem> {
    let categoryList: Array<CategoryItem> = [];
    let cateGoryItem: CategoryItem = new CategoryItem();
    CategoryItem
    categoryList.push(cateGoryItem)
    categoryList.push(cateGoryItem)
    categoryList.push(cateGoryItem)
    categoryList.push(cateGoryItem)
    categoryList.push(cateGoryItem)
    return categoryList;
  }
}
let categoryViewModel = new CateGoryViewModel();

export default categoryViewModel as CateGoryViewModel;