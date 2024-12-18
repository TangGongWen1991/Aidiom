import { CommonConstants } from "../constants/CommonConstants";
import { CategoryItem, Story } from "../entity/beans";


export class CateGoryViewModel{
  getCategoryStoryListById(id:number):Array<Story>{
    let storyList: Array<Story> = [];
    let story: Story = new Story();
    storyList.push(story)
    storyList.push(story)
    storyList.push(story)
    storyList.push(story)
    storyList.push(story)
    storyList.push(story)
    storyList.push(story)
    storyList.push(story)
    storyList.push(story)
    storyList.push(story)

    return storyList
  }

  getCateGoryList(): Array<CategoryItem> {
    let categoryList: Array<CategoryItem> = [];
    let cateGoryItemCY: CategoryItem = new CategoryItem();
     cateGoryItemCY.id = CommonConstants.STORY_TYPE_CY
     cateGoryItemCY.name = "成语故事"
    cateGoryItemCY.cover = "https://pic.616pic.com/bg_w1180/00/03/33/Ci5x8TRBSA.jpg"
    let cateGoryItemSQ: CategoryItem = new CategoryItem();
    cateGoryItemSQ.id = CommonConstants.STORY_TYPE_SQ
    cateGoryItemSQ.name = "睡前故事"
    cateGoryItemSQ.cover = "https://pic.616pic.com/bg_w1180/00/02/24/hWR3T0N7LA.jpg"
    let cateGoryItemTH: CategoryItem = new CategoryItem();
    cateGoryItemTH.id = CommonConstants.STORY_TYPE_TH
    cateGoryItemTH.name = "童话故事"
    cateGoryItemTH.cover = "https://book.img.zhangyue01.com/group61/M00/9D/8A/CmQUOFydrJGEQAYlAAAAAB3pQhU181838262.jpg"
    let cateGoryItemYY: CategoryItem = new CategoryItem();
    cateGoryItemYY.id = CommonConstants.STORY_TYPE_YY
    cateGoryItemYY.name = "寓言故事"
    cateGoryItemYY.cover = "https://pic.616pic.com/bg_w1180/00/03/32/hprfgAAZSG.jpg"

    categoryList.push(cateGoryItemCY)
    categoryList.push(cateGoryItemSQ)
    categoryList.push(cateGoryItemTH)
    categoryList.push(cateGoryItemYY)
    return categoryList;
  }
}
let categoryViewModel = new CateGoryViewModel();

export default categoryViewModel as CateGoryViewModel;