import { FoodCategories, FoodCategoryEnum, WorkoutCategories, WorkoutCategoryEnum } from './ItemCategoryModel'
import GroupInfo from '../viewmodel/GroupInfo'
import ItemCategory from '../viewmodel/ItemCategory'
import { RecordItem, RecordItemIO } from '../viewmodel/RecordItem'

const foods: RecordItem[] = [
  new RecordItem({
    id: 0,
    name: '米饭',
    image: $r('app.media.rice'),
    categoryId: FoodCategoryEnum.STAPLE,
    unit: '碗',
    calorie: 209,
    carbon: 46.6,
    protein: 4.7,
    fat: 0.5
  } as RecordItemIO),
  new RecordItem({
    id: 1,
    name: '馒头',
    image: $r('app.media.steamed_bun'),
    categoryId: FoodCategoryEnum.STAPLE,
    unit: '个',
    calorie: 114,
    carbon: 24.0,
    protein: 3.6,
    fat: 0.6
  } as RecordItemIO),
  new RecordItem({
    id: 2,
    name: '面包',
    image: $r('app.media.bun'),
    categoryId: FoodCategoryEnum.STAPLE,
    unit: '个',
    calorie: 188,
    carbon: 35.2,
    protein: 5.0,
    fat: 3.1
  } as RecordItemIO),
  new RecordItem({
    id: 3,
    name: '全麦吐司',
    image: $r('app.media.toast'),
    categoryId: FoodCategoryEnum.STAPLE,
    unit: '片',
    calorie: 91,
    carbon: 15.5,
    protein: 4.4,
    fat: 1.3
  } as RecordItemIO),
  new RecordItem({
    id: 4,
    name: '紫薯',
    image: $r('app.media.purple_potato'),
    categoryId: FoodCategoryEnum.STAPLE,
    unit: '个',
    calorie: 163,
    carbon: 42.0,
    protein: 1.6,
    fat: 0.4
  } as RecordItemIO),
  new RecordItem({
    id: 5,
    name: '煮玉米',
    image: $r('app.media.corn'),
    categoryId: FoodCategoryEnum.STAPLE,
    unit: '根',
    calorie: 111,
    carbon: 22.6,
    protein: 4.0,
    fat: 1.2
  } as RecordItemIO),
  new RecordItem({
    id: 6,
    name: '黄瓜',
    image: $r('app.media.cucumber'),
    categoryId: FoodCategoryEnum.FRUIT,
    unit: '根',
    calorie: 29,
    carbon: 5.3,
    protein: 1.5,
    fat: 0.4
  } as RecordItemIO),
  new RecordItem({
    id: 7,
    name: '蓝莓',
    image: $r('app.media.blueberry'),
    categoryId: FoodCategoryEnum.FRUIT,
    unit: '盒',
    calorie: 71,
    carbon: 18.1,
    protein: 0.9,
    fat: 0.4
  } as RecordItemIO),
  new RecordItem({
    id: 8,
    name: '草莓',
    image: $r('app.media.strawberry'),
    categoryId: FoodCategoryEnum.FRUIT,
    unit: '颗',
    calorie: 14,
    carbon: 3.1,
    protein: 0.4,
    fat: 0.1
  } as RecordItemIO),
  new RecordItem({
    id: 9,
    name: '火龙果',
    image: $r('app.media.pitaya'),
    categoryId: FoodCategoryEnum.FRUIT,
    unit: '个',
    calorie: 100,
    carbon: 24.6,
    protein: 2.2,
    fat: 0.5
  } as RecordItemIO),
  new RecordItem({
    id: 10,
    name: '奇异果',
    image: $r('app.media.kiwi'),
    categoryId: FoodCategoryEnum.FRUIT,
    unit: '个',
    calorie: 25,
    carbon: 8.4,
    protein: 0.5,
    fat: 0.3
  } as RecordItemIO),
  new RecordItem({
    id: 11,
    name: '煮鸡蛋',
    image: $r('app.media.egg'),
    categoryId: FoodCategoryEnum.MEAT,
    unit: '个',
    calorie: 74,
    carbon: 0.1,
    protein: 6.2,
    fat: 5.4
  } as RecordItemIO),
  new RecordItem({
    id: 12,
    name: '煮鸡胸肉',
    image: $r('app.media.chicken_breast'),
    categoryId: FoodCategoryEnum.MEAT,
    unit: '克',
    calorie: 1.15,
    carbon: 0.011,
    protein: 0.236,
    fat: 0.018
  } as RecordItemIO),
  new RecordItem({
    id: 13,
    name: '煮鸡腿肉',
    image: $r('app.media.chicken_leg'),
    categoryId: FoodCategoryEnum.MEAT,
    unit: '克',
    calorie: 1.87,
    carbon: 0.0,
    protein: 0.243,
    fat: 0.092
  } as RecordItemIO),
  new RecordItem({
    id: 14,
    name: '牛肉',
    image: $r('app.media.beef'),
    categoryId: FoodCategoryEnum.MEAT,
    unit: '克',
    calorie: 1.22,
    carbon: 0.0,
    protein: 0.23,
    fat: 0.033
  } as RecordItemIO),
  new RecordItem({
    id: 15,
    name: '鱼肉',
    image: $r("app.media.fish"),
    categoryId: FoodCategoryEnum.MEAT,
    unit: '克',
    calorie: 1.04,
    carbon: 0.0,
    protein: 0.206,
    fat: 0.024
  } as RecordItemIO),
  new RecordItem({
    id: 16,
    name: '牛奶',
    image: $r("app.media.milk"),
    categoryId: FoodCategoryEnum.MEAT,
    unit: '毫升',
    calorie: 0.66,
    carbon: 0.05,
    protein: 0.03,
    fat: 0.038
  } as RecordItemIO),
  new RecordItem({
    id: 17,
    name: '酸奶',
    image: $r("app.media.yogurt"),
    categoryId: FoodCategoryEnum.MEAT,
    unit: '毫升',
    calorie: 0.7,
    carbon: 0.10,
    protein: 0.032,
    fat: 0.019
  } as RecordItemIO),
  new RecordItem({
    id: 18,
    name: '核桃',
    image: $r("app.media.walnut"),
    categoryId: FoodCategoryEnum.NUT,
    unit: '颗',
    calorie: 42,
    carbon: 1.2,
    protein: 1.0,
    fat: 3.8
  } as RecordItemIO),
  new RecordItem({
    id: 19,
    name: '花生',
    image: $r("app.media.peanut"),
    categoryId: FoodCategoryEnum.NUT,
    unit: '克',
    calorie: 3.13,
    carbon: 0.13,
    protein: 0.12,
    fat: 0.254
  } as RecordItemIO),
  new RecordItem({
    id: 20,
    name: '腰果',
    image: $r("app.media.cashew"),
    categoryId: FoodCategoryEnum.NUT,
    unit: '克',
    calorie: 5.59,
    carbon: 0.416,
    protein: 0.173,
    fat: 0.367
  } as RecordItemIO),
  new RecordItem({
    id: 21,
    name: '无糖拿铁',
    image: $r("app.media.coffee"),
    categoryId: FoodCategoryEnum.OTHER,
    unit: '毫升',
    calorie: 0.43,
    carbon: 0.044,
    protein: 0.028,
    fat: 0.016
  } as RecordItemIO),
  new RecordItem({
    id: 22,
    name: '豆浆',
    image: $r("app.media.soybean_milk"),
    categoryId: FoodCategoryEnum.OTHER,
    unit: '毫升',
    calorie: 0.31,
    carbon: 0.012,
    protein: 0.030,
    fat: 0.016
  } as RecordItemIO)
]

const workouts: RecordItem[] = [
  new RecordItem({
    id: 10000,
    name: '散步',
    image: $r('app.media.ic_walk'),
    categoryId: WorkoutCategoryEnum.WALKING,
    unit: '小时',
    calorie: 111
  } as RecordItemIO),
  new RecordItem({
    id: 10001,
    name: '快走',
    image: $r('app.media.ic_walk'),
    categoryId: WorkoutCategoryEnum.WALKING,
    unit: '小时',
    calorie: 343
  } as RecordItemIO),
  new RecordItem({
    id: 10002,
    name: '慢跑',
    image: $r('app.media.ic_running'),
    categoryId: WorkoutCategoryEnum.RUNNING,
    unit: '小时',
    calorie: 472
  } as RecordItemIO),
  new RecordItem({
    id: 10003,
    name: '快跑',
    image: $r('app.media.ic_running'),
    categoryId: WorkoutCategoryEnum.RUNNING,
    unit: '小时',
    calorie: 652
  } as RecordItemIO),
  new RecordItem({
    id: 10004,
    name: '自行车',
    image: $r('app.media.ic_ridding'),
    categoryId: WorkoutCategoryEnum.RIDING,
    unit: '小时',
    calorie: 497
  } as RecordItemIO),
  new RecordItem({
    id: 10005,
    name: '动感单车',
    image: $r('app.media.ic_ridding'),
    categoryId: WorkoutCategoryEnum.RIDING,
    unit: '小时',
    calorie: 587
  } as RecordItemIO),
  new RecordItem({
    id: 10006,
    name: '瑜伽',
    image: $r('app.media.ic_aerobics'),
    categoryId: WorkoutCategoryEnum.AEROBICS,
    unit: '小时',
    calorie: 172
  } as RecordItemIO),
  new RecordItem({
    id: 10007,
    name: '健身操',
    image: $r('app.media.ic_aerobics'),
    categoryId: WorkoutCategoryEnum.AEROBICS,
    unit: '小时',
    calorie: 429
  } as RecordItemIO),
  new RecordItem({
    id: 10008,
    name: '游泳',
    image: $r('app.media.ic_swimming'),
    categoryId: WorkoutCategoryEnum.SWIMMING,
    unit: '小时',
    calorie: 472
  } as RecordItemIO),
  new RecordItem({
    id: 10009,
    name: '冲浪',
    image: $r('app.media.ic_swimming'),
    categoryId: WorkoutCategoryEnum.SWIMMING,
    unit: '小时',
    calorie: 429
  } as RecordItemIO),
  new RecordItem({
    id: 10010,
    name: '篮球',
    image: $r('app.media.ic_basketball'),
    categoryId: WorkoutCategoryEnum.BALLGAME,
    unit: '小时',
    calorie: 472
  } as RecordItemIO),
  new RecordItem({
    id: 10011,
    name: '足球',
    image: $r('app.media.ic_football'),
    categoryId: WorkoutCategoryEnum.BALLGAME,
    unit: '小时',
    calorie: 515
  } as RecordItemIO),
  new RecordItem({
    id: 10012,
    name: '排球',
    image: $r("app.media.ic_volleyball"),
    categoryId: WorkoutCategoryEnum.BALLGAME,
    unit: '小时',
    calorie: 403
  } as RecordItemIO),
  new RecordItem({
    id: 10013,
    name: '羽毛球',
    image: $r("app.media.ic_badminton"),
    categoryId: WorkoutCategoryEnum.BALLGAME,
    unit: '小时',
    calorie: 386
  } as RecordItemIO),
  new RecordItem({
    id: 10014,
    name: '乒乓球',
    image: $r("app.media.ic_table_tennis"),
    categoryId: WorkoutCategoryEnum.BALLGAME,
    unit: '小时',
    calorie: 257
  } as RecordItemIO),
  new RecordItem({
    id: 10015,
    name: '哑铃飞鸟',
    image: $r("app.media.ic_dumbbell"),
    categoryId: WorkoutCategoryEnum.STRENGTH,
    unit: '小时',
    calorie: 343
  } as RecordItemIO),
  new RecordItem({
    id: 10016,
    name: '哑铃卧推',
    image: $r("app.media.ic_dumbbell"),
    categoryId: WorkoutCategoryEnum.STRENGTH,
    unit: '小时',
    calorie: 429
  } as RecordItemIO),
  new RecordItem({
    id: 10017,
    name: '仰卧起坐',
    image: $r("app.media.ic_sit_up"),
    categoryId: WorkoutCategoryEnum.STRENGTH,
    unit: '小时',
    calorie: 515
  } as RecordItemIO)
]

class ItemModel {
  getById(id: number, isFood: boolean = true) {
    return isFood ? foods[id] : workouts[id - 10000]
  }

  list(isFood: boolean = true): RecordItem[] {
    return isFood ? foods : workouts
  }

  listItemGroupByCategory(isFood: boolean = true) {
    // 1.判断要处理的是食物还是运动
    let categories = isFood ? FoodCategories : WorkoutCategories
    let tempItems = isFood ? foods : workouts
    // 2.创建空的分组
    // map: 遍历categories数组，为每一个元素创建一个GroupInfo对象并覆盖原数值，然后返回一个新数组
    // 迭代每个元素，并根据其传入的回调方法的返回值，返回一个新数组。
    let groups = categories.map((itemCategory: ItemCategory) => {
      return new GroupInfo({ type: itemCategory, items: [], calorie: 0 })
    })
    // 3.遍历记录项列表，将食物添加到对应的分组
    tempItems.forEach((temp: RecordItem) => {
      (groups[temp.categoryId].items as Array<RecordItem>).push(temp)
    })
    // 4.返回结果
    return groups
  }
}

let itemModel = new ItemModel()

export default itemModel as ItemModel