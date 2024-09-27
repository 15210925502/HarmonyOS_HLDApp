interface RecordTypeIO {
  /**
   * 类型id
   */
  id: number
  /**
   * 类型名称
   */
  name: ResourceStr
  /**
   * 类型图标
   */
  icon: ResourceStr
  /**
   * 类型推荐最小卡路里
   */
  min: number
  /**
   * 类型推荐最大卡路里
   */
  max: number
}

class RecordType implements RecordTypeIO {
  id: number
  name: ResourceStr
  icon: ResourceStr
  min: number
  max: number

  constructor(model: RecordTypeIO) {
    this.id = model.id
    this.name = model.name
    this.icon = model.icon
    this.min = model.min ? model.min : 0
    this.max = model.max ? model.max : 0
  }
}

export { RecordType, RecordTypeIO }