import { relationalStore, ValuesBucket } from '@kit.ArkData'
import { BusinessError } from '@kit.BasicServicesKit'
import { common } from '@kit.AbilityKit'
import { TaskInfo, TaskInfoModel } from './TaskInfoModel'

const RDB_NAME: string = 'MyApplication.db'
const TABLE_NAME: string = 'user'

export class DBManager {
  static share: DBManager = new DBManager()
  rdbStore : relationalStore.RdbStore | undefined

  public getRdbStoreAction():relationalStore.RdbStore{
    if (!this.rdbStore) {
      this.linkDB()
    }
    return this.rdbStore as relationalStore.RdbStore
  }

  linkDB(){
    // rdb配置
    const config: relationalStore.StoreConfig = {
      name: RDB_NAME,
      securityLevel: relationalStore.SecurityLevel.S1
    }

    relationalStore.getRdbStore(getContext(this) as common.UIAbilityContext, config,
      (err: BusinessError, rdbStore: relationalStore.RdbStore) => {
        if (err) {
          console.log('testTag', '获取rdbStore失败！')
          return
        }
        this.rdbStore = rdbStore
      })
  }

  /**
   * 创建表
   */
  initTaskDB() {
    // 初始化SQL语句
    const sql =
      `CREATE TABLE IF NOT EXISTS ${TABLE_NAME}(myId INTEGER PRIMARY KEY AUTOINCEMENT,name TEXT NOT NULL,finished BIT )`
    DBManager.share.getRdbStoreAction().executeSql(sql, (err: BusinessError) => {
        if (err) {
          console.log('testTag', err.name, err.message)
          return
        }
        console.log('testTag', '创建表成功！')
      })
  }

  /**
   * 查询任务
   * @returns
   */
  selectTaskList(name?: string) {
    let tasks: TaskInfoModel[] = []
    // 构建查询条件
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    if (name != undefined && name?.length > 0) {
      predicates.equalTo('NAME', name)
    }
    // 查询
    DBManager.share.getRdbStoreAction().query(predicates, ['myId', 'NAME', 'FINISHED'])
      .then((result) => {
        // 解析查询数据
        while (!result?.isAtLastRow) {
          result?.goToNextRow()
          let myId = result?.getLong(result.getColumnIndex('myId'))
          let name = result?.getString(result.getColumnIndex('NAME'))
          let finished = result?.getLong(result.getColumnIndex('FINISHED'))
          let taskInfo: TaskInfo = {
            myId: myId,
            name: name,
            finished: !!finished
          }
          let taskInfoModel: TaskInfoModel = new TaskInfoModel(taskInfo)
          tasks.push(taskInfoModel)
        }
        console.log('TestTag', '查询数据成功！')
      })
      .catch((err: Error) => {
        console.log('TestTag', err.name, err.message)
      })
  }

  /**
   * 增加数据
   * @param name
   * @returns
   */
  addTask(name: string): Promise<number> {
    return this.rdbStore?.insert(TABLE_NAME, {
      name: '张三',
      finished: false,
    }) as Promise<number>
  }

  /**
   * 更新数据
   * @param id
   * @param finished
   * @returns
   */
  updateTaskStatus(id: number, finished: boolean): Promise<number> {
    let data: ValuesBucket = {
      finished
    }
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    predicates.equalTo('myId', id)
    return this.rdbStore?.update(data, predicates) as Promise<number>
  }

  /**
   * 删除数据
   * @param id
   * @returns
   */
  deleteTaskById(id: number): Promise<number> {
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    predicates.equalTo('myId', id)
    return this.rdbStore?.delete(predicates) as Promise<number>
  }
}