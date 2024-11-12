import { TopPicItem, RecommendItem, TabBarItem } from '../entity/beans';

/**
 * Binds data to components and provides interfaces.
 */
export class RecommendViewModel {
  /**
   * Get item information for the tab.
   *
   * @return {Array<TabBarItem>} tabItems
   */
  getTodayRecommendData(): Array<RecommendItem> {
    let recItems: Array<RecommendItem> = [];
    let itemHomeInfo: RecommendItem = new RecommendItem();
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
    items.push(moreItem)
    items.push(moreItem)
    return items;
  }
}

let recommendViewModel = new RecommendViewModel();

export default recommendViewModel as RecommendViewModel;