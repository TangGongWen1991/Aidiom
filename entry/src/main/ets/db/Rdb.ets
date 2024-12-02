// import dataRdb from '@ohos.data.rdb' //原模块名
//import relationalStore from '@ohos.data.relationalStore';
import { relationalStore } from '@kit.ArkData';
//导入relationalStore模块，这个模块提供了操作关系型数据库的API。

export class Rdb {
  rdbStore: relationalStore.RdbStore | null = null
  private sqlCreateTable: string = ''
  //STORE_CONFIG是一个配置对象，定义了数据库的名称（my.db）和安全级别（1）。
  private STORE_CONFIG: relationalStore.StoreConfig = { name: 'story.db',securityLevel:1 }

  constructor(sqlCreateTable: string) {
    this.sqlCreateTable = sqlCreateTable
  }

  // getRdbStore是一个异步方法，用于获取或创建数据库实例
  async getRdbStore() {
    if (this.rdbStore != null) {
      return this.rdbStore.executeSql(this.sqlCreateTable);
    }
    let getPromiseRdb = relationalStore.getRdbStore( getContext(), this.STORE_CONFIG);
    await getPromiseRdb.then(async (rdbStore) => {
      this.rdbStore = rdbStore;
      // 创建表，
      //
      //
      // catch用于处理错误情况，打印错误信息
      rdbStore.executeSql(this.sqlCreateTable);
    }).catch((err:string) => {
      console.log("getRdbStore err." + JSON.stringify(err));
    });
  }
}