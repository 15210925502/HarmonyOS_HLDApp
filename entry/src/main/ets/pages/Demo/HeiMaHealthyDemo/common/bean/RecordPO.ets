export default class RecordPO{
  /**
   * 记录id
   */
  id?: number
  /**
   * 饮食记录类型
   */
  typeId: number = 0
  /**
   * 记录中的食物或运动信息
   */
  itemId: number = 0

  /**
   * 食物数量或运动时长，如果是运动信息则无
   */
  amount: number = 0
  /**
   * 记录的日期
   */
  createTime: number = 0
}