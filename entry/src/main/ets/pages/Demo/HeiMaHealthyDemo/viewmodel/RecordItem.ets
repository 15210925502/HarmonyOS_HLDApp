/**
 * 饮食记录中的记录项，可以是食物或运动
 */
interface RecordItemIO{
  /**
   * id
   */
  id: number
  /**
   * 名称
   */
  name: ResourceStr
  /**
   * 图片
   */
  image: ResourceStr
  /**
   * 分类id
   */
  categoryId: number
  /**
   * 包含的卡路里
   */
  calorie: number
  /**
   * 单位
   */
  unit: ResourceStr
  /**
   * 碳水含量，单位（克）
   */
  carbon: number
  /**
   * 蛋白质含量，单位（克）
   */
  protein: number
  /**
   * 脂肪含量，单位（克）
   */
  fat: number
}


class RecordItem implements RecordItemIO{
  id: number
  name: ResourceStr
  image: ResourceStr
  categoryId: number
  calorie: number
  unit: ResourceStr
  carbon: number
  protein: number
  fat: number

  constructor(model:RecordItemIO) {
    this.id = model.id
    this.name = model.name
    this.image = model.image
    this.categoryId = model.categoryId
    this.unit = model.unit
    this.calorie = model.calorie
    this.protein = model.protein
    this.fat = model.fat
    this.carbon = model.carbon
  }
}

export {RecordItem,RecordItemIO}