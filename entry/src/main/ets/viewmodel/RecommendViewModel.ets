import { CommonConstants } from '../constants/CommonConstants';
import { TopPicItem, Story } from '../entity/beans';
import { StoryTodayRecService } from '../http/HttpUtil';

/**
 * Binds data to components and provides interfaces.
 */
export class RecommendViewModel {
  /**
   * Get item information for the tab.
   *
   * @return {Array<TabBarItem>} tabItems
   */
  getTodayRecommendData(): Array<Story> {
    let recItems: Array<Story> = [];
    let itemHomeInfo: Story = new Story();
    recItems.push(itemHomeInfo)
    recItems.push(itemHomeInfo)
    recItems.push(itemHomeInfo)
    recItems.push(itemHomeInfo)
    recItems.push(itemHomeInfo)
    recItems.push(itemHomeInfo)
    StoryTodayRecService({key:CommonConstants.API_KEY,num:6}).then(result=>{
        
    })
    return recItems;
  }

  getHistoryData(): Array<Story> {
    let recItems: Array<Story> = [];
    let itemHomeInfo: Story = new Story();
    recItems.push(itemHomeInfo)
    recItems.push(itemHomeInfo)
    recItems.push(itemHomeInfo)
    recItems.push(itemHomeInfo)
    recItems.push(itemHomeInfo)
    recItems.push(itemHomeInfo)

    return recItems;
  }


  getRecommendTopicData(): Array<TopPicItem> {
    let items: Array<TopPicItem> = [];
    let moreItem: TopPicItem = new TopPicItem();
    items.push(moreItem)
    items.push(moreItem)
    items.push(moreItem)
    return items;
  }
}

let recommendViewModel = new RecommendViewModel();

export default recommendViewModel as RecommendViewModel;