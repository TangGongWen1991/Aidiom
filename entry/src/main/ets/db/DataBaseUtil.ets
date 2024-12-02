// import dataRdb from '@ohos.data.rdb' //原模块名
// import dataRdb from '@ohos.data.relationalStore'

import { relationalStore } from '@kit.ArkData';  //用于操作关系型数据库
import promptAction from '@ohos.promptAction';   //用于显示提示信息
import { Rdb } from './Rdb'
import { ArrayList } from '@kit.ArkTS';  //用于存储和管理用户列表
import { Story } from '../entity/beans';

class DataBaseUtils {
  //UserAPI 类初始化时，设置表名、列名、创建表的SQL语句，并创建 Rdb 实例来管理数据库连接。
  private tableName: string = ''
  private columns: Array<string> = []
  private rdb: Rdb | null = null
  private sql_create_table = ''

  constructor( ) {
    this.tableName = 'story'
    this.columns = ['id', 'title', 'cover', 'typeid', 'content']
    this.sql_create_table = 'CREATE TABLE IF NOT EXISTS '
      + this.tableName + '('
      + 'id TEXT PRIMARY KEY  '
      + 'title TEXT NOT NULL, '
      + 'cover TEXT, '
      + 'content TEXT, '
      + 'typeid TEXT)';
    this.rdb = new Rdb(this.sql_create_table)
    this.rdb.getRdbStore()
  }

  // 插入数据
  insertUser(user:Story) {
    const valueBucket:relationalStore.ValuesBucket = JSON.parse(JSON.stringify(user));
    if(this.rdb?.rdbStore!=null)
    {
      this.rdb.rdbStore.insert(this.tableName, valueBucket, (err, ret) => {
        console.log('insert done: ' + ret);
        promptAction.showToast({ message: '添加用户成功！' });
      });
    }
  }

  // 根据用户名查询用户信息
  async queryUserByName(name:string) {
    let resultList:ArrayList<Story> | null = null;
    let predicates = new relationalStore.RdbPredicates(this.tableName);
    predicates.equalTo('name', name);
    let ret = await this.queryFromDB(predicates);
    if( ret!=null )
    {
      resultList = this.getListFromResultSet(ret);
    }
    return resultList;
  }

  // 查询全部用户信息
  async queryUserAll() {
    let resultList:ArrayList<Story> | null = null;
    let predicates = new relationalStore.RdbPredicates(this.tableName);
    let ret:relationalStore.ResultSet | null = await this.queryFromDB(predicates);

    if( ret!=null )
    {
      resultList = this.getListFromResultSet(ret);
    }
    return resultList;
  }

  // 根据条件查询数据库
  async queryFromDB( predicates:relationalStore.RdbPredicates ) {
    let resultList:relationalStore.ResultSet | null = null;
    if( this.rdb?.rdbStore!=null )
    {
      let promiseQuery = this.rdb.rdbStore.query(predicates, this.columns);
      await promiseQuery.then((resultSet) => {
        resultList = resultSet;
      }).catch((err:object) => {
        console.log("query err" + JSON.stringify(err));
      });
    }
    return resultList;
  }

  // 将查询到的结果封装用户列表
  getListFromResultSet( resultSet:relationalStore.ResultSet ) {
    let storyList:ArrayList<Story> = new ArrayList<Story>();
    for (let i = 0; i < resultSet.rowCount; i++) {
      resultSet.goToNextRow();
      let story = new Story()
      story.id =   resultSet.getString(resultSet.getColumnIndex('id')) ;
      story.title = resultSet.getString(resultSet.getColumnIndex('title'))
      story.cover = resultSet.getString(resultSet.getColumnIndex('cover'))
      story.typeid = resultSet.getLong(resultSet.getColumnIndex('typeid'))
     story.content =  resultSet.getString(resultSet.getColumnIndex('content'))
      storyList.add(story);
    }
    return storyList;
  }

  // 删除全部数据
  async deleteAll() {
    let result:number = 0;
    let predicates = new relationalStore.RdbPredicates(this.tableName);
    if(this.rdb?.rdbStore!=null)
    {
      await this.rdb.rdbStore.delete(predicates).then((rows) => {
        result = rows;
        promptAction.showToast({ message: '删除数据，rows:' + rows });
      });
    }
    return result
  }

  updateStory(story:Story) {
   const  valueBucket:relationalStore.ValuesBucket = JSON.parse(JSON.stringify(story));
    let predicates =  new relationalStore.RdbPredicates(this.tableName);
    predicates.equalTo('id', story.id);
    if(this.rdb?.rdbStore != null)
    {
      this.rdb.rdbStore.update(valueBucket, predicates,  (err, ret) => {
        promptAction.showToast({ message: '更新数据，ret:' + ret });
      });
    }
  }

  deleteUserById(id : string) {
    let predicates =  new relationalStore.RdbPredicates(this.tableName);
    predicates.equalTo('id', id);
    if( this.rdb?.rdbStore != null )
    {
      this.rdb.rdbStore.delete(predicates,  (err, rows) => {
        promptAction.showToast({ message: '删除数据，rows::' + rows });
      });
    }
  }
}

export default new DataBaseUtils()