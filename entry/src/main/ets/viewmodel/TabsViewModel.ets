import { TabBarItem } from './TabBarItem';

/**
 * Binds data to components and provides interfaces.
 */
export class TabsViewModel {
  /**
   * Get item information for the tab.
   *
   * @return {Array<TabBarItem>} tabItems
   */
  getTabData(): Array<TabBarItem> {
    let tabItems: Array<TabBarItem> = [];
    let itemHomeInfo: TabBarItem = new TabBarItem();
    let itemCategoryInfo: TabBarItem = new TabBarItem();
    let itemMineInfo: TabBarItem = new TabBarItem();

    itemHomeInfo.name = $r('app.string.tab_home_name');
    itemHomeInfo.icon = $r('app.media.ic_tabs_icon');
    itemHomeInfo.selectIcon = $r('app.media.ic_tabs_icon_selected');
    itemCategoryInfo.name = $r('app.string.tab_category_name');
    itemCategoryInfo.icon = $r('app.media.ic_tabs_icon');
    itemCategoryInfo.selectIcon = $r('app.media.ic_tabs_icon_selected');
    itemMineInfo.name = $r('app.string.tab_mine_name');
    itemMineInfo.icon = $r('app.media.ic_tabs_icon');
    itemMineInfo.selectIcon = $r('app.media.ic_tabs_icon_selected');
    tabItems.push(itemHomeInfo);
    tabItems.push(itemCategoryInfo);
    tabItems.push(itemMineInfo);

    return tabItems;
  }
}

let tabsViewModel = new TabsViewModel();

export default tabsViewModel as TabsViewModel;