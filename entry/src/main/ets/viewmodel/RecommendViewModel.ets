import { MoreRecItem, RecommendItem, TabBarItem } from '../entity/beans';

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


  getToMoreRecommendData(): Array<MoreRecItem> {
    let recItems: Array<MoreRecItem> = [];
    let moreItem: MoreRecItem = new MoreRecItem();
    recItems.push(moreItem)
    recItems.push(moreItem)
    recItems.push(moreItem)
    recItems.push(moreItem)
    recItems.push(moreItem)
    return recItems;
  }
}

let recommendViewModel = new RecommendViewModel();

export default recommendViewModel as RecommendViewModel;