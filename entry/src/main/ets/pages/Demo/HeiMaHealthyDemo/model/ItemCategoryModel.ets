import ItemCategory from '../viewmodel/ItemCategory'

/**
 * 食物类型的枚举
 */
enum FoodCategoryEnum{
  /**
   * 主食
   */
  STAPLE,
  /**
   * 蔬果
   */
  FRUIT,
  /**
   * 肉蛋奶
   */
  MEAT,
  /**
   * 坚果
   */
  NUT,
  /**
   * 其它
   */
  OTHER,
}

/**
 * 食物类型数组
 */
let FoodCategories = [
  new ItemCategory({id: 0, name:$r('app.string.staple')}),
  new ItemCategory({id: 1, name:$r('app.string.fruit')}),
  new ItemCategory({id: 2, name:$r('app.string.meat')}),
  new ItemCategory({id: 3, name:$r('app.string.nut')}),
  new ItemCategory({id: 4, name:$r('app.string.other_type')})
]

/**
 * 运动类型枚举
 */
enum WorkoutCategoryEnum {
  /**
   * 走路
   */
  WALKING,
  /**
   * 跑步
   */
  RUNNING,
  /**
   * 骑行
   */
  RIDING,
  /**
   * 跳操
   */
  AEROBICS,
  /**
   * 游泳
   */
  SWIMMING,
  /**
   * 打球
   */
  BALLGAME,
  /**
   * 力量训练
   */
  STRENGTH
}

/**
 * 运动类型数组
 */
let WorkoutCategories = [
  new ItemCategory({id: 0, name:$r('app.string.walking_type')}),
  new ItemCategory({id: 1, name:$r('app.string.running')}),
  new ItemCategory({id: 2, name:$r('app.string.riding')}),
  new ItemCategory({id: 3, name:$r('app.string.aerobics')}),
  new ItemCategory({id: 4, name:$r('app.string.swimming')}),
  new ItemCategory({id: 5, name:$r('app.string.ballgame')}),
  new ItemCategory({id: 6, name:$r('app.string.strength')})
]

export {FoodCategories , WorkoutCategories , FoodCategoryEnum, WorkoutCategoryEnum}