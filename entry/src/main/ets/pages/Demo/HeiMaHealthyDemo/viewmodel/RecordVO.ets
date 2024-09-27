import { RecordItem } from './RecordItem'

interface RecordVOIO {
  /**
   * 记录id
   */
  id: number
  /**
   * 饮食记录类型
   */
  typeId: number

  /**
   * 卡路里总数
   */
  calorie: number

  /**
   * 记录中的食物或运动信息
   */
  recordItem: RecordItem

  /**
   * 食物数量或运动时长，如果是运动信息则无
   */
  amount: number
}


/**
 * 饮食记录的页面数据模型
 */
class RecordVO implements RecordVOIO {
  id: number
  typeId: number
  calorie: number
  recordItem: RecordItem
  amount: number = 0

  constructor(model: RecordVOIO) {
    this.id = model.id
    this.typeId = model.typeId
    this.calorie = model.calorie
    this.recordItem = model.recordItem
    this.amount = model.amount
  }
}

export {RecordVO,RecordVOIO}