interface GroupInfoIO<TYPE, ELEMENT>{
  /**
   * 分组类型
   */
  type: TYPE
  /**
   * 组内数据集合
   */
  items: ELEMENT[]

  /**
   * 组内记录的总热量
   */
  calorie: number
}

export default class GroupInfo<TYPE, ELEMENT> {
  type: TYPE
  items: ELEMENT[]
  calorie: number = 0

  constructor(model: GroupInfoIO<TYPE, ELEMENT>) {
    this.type = model.type
    this.items = model.items
    this.calorie = model.calorie
  }
}