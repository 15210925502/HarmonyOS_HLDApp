/**
 * 数据库建表语句
 */
import relationalStore from '@ohos.data.relationalStore'
import { ColumnInfo, ColumnType } from '../common/bean/ColumnInfo'
import RecordPO from '../common/bean/RecordPO'
import DbUtil from '../common/utils/DbUtil'

const TABLE_NAME = 'record'
const ID_COLUMN = 'id'
const DATE_COLUMN = 'create_time'

const CREATE_TABLE_SQL: string = `
 CREATE TABLE IF NOT EXISTS ${TABLE_NAME} (
   ${ID_COLUMN} INTEGER PRIMARY KEY AUTOINCREMENT,
   type_id INTEGER NOT NULL,
   item_id INTEGER NOT NULL,
   amount DOUBLE NOT NULL,
   ${DATE_COLUMN} INTEGER NOT NULL
 )
 `

const COLUMNS: ColumnInfo[] = [
  {name: 'id', columnName: 'id', type: ColumnType.LONG},
  {name: 'typeId', columnName: 'type_id', type: ColumnType.LONG},
  {name: 'itemId', columnName: 'item_id', type: ColumnType.LONG},
  {name: 'amount', columnName: 'amount', type: ColumnType.DOUBLE},
  {name: 'createTime', columnName: 'create_time', type: ColumnType.LONG}
]

class RecordModel {

  // 获取创建表的sql语句
  getCreateTableSql(): string {
    return CREATE_TABLE_SQL
  }

  // 插入数据
  insert(record: RecordPO): Promise<number>{
    return DbUtil.insert(TABLE_NAME, record, COLUMNS)
  }

  // 删除数据
  deleteById(id: number): Promise<number>{
    // 1.删除条件
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    predicates.equalTo(ID_COLUMN, id)
    // 2.删除
    return DbUtil.delete(predicates)
  }

  // 查询数据
  listByDate(date: number): Promise<RecordPO[]>{
    // 1.查询条件
    let predicates = new relationalStore.RdbPredicates(TABLE_NAME)
    predicates.equalTo(DATE_COLUMN, date)
    // 2.查询
    return DbUtil.queryForList(predicates, COLUMNS)
  }
}

let recordModel = new RecordModel()

export default recordModel as RecordModel