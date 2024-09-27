/**
 * 记录项类型
 */
interface ItemCategoryIO{
  /**
   * 类型id
   */
  id: number
  /**
   * 类型名称
   */
  name: ResourceStr
}

export default class ItemCategory implements ItemCategoryIO{
  id: number
  name: ResourceStr

  constructor(model: ItemCategoryIO) {
    this.id = model.id
    this.name = model.name
  }
}
