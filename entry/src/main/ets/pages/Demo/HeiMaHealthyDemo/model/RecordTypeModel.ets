import { RecordType, RecordTypeIO } from '../viewmodel/RecordType'

enum RecordTypeEnum {
  /**
   * 早餐
   */
  BREAKFAST,
  /**
   * 午餐
   */
  LUNCH,
  /**
   * 晚餐
   */
  DINNER,
  /**
   * 加餐
   */
  EXTRA_MEAL,
  /**
   * 运动
   */
  WORKOUT
}

/**
 * 记录类型常量
 */
const RecordTypes: RecordType[] = [
  new RecordType({id:0, name:$r("app.string.breakfast"), icon: $r("app.media.ic_breakfast"), min: 421, max: 592}),
  new RecordType({id:1, name:$r("app.string.lunch"), icon:$r("app.media.ic_lunch"), min: 592, max:761}),
  new RecordType({id:2, name:$r("app.string.dinner"), icon:$r("app.media.ic_dinner"), min:423, max:592}),
  new RecordType({id:3, name:$r("app.string.extra_meal"), icon:$r("app.media.ic_extra_m"), min:0, max:169}),
  new RecordType({id:4, name:$r("app.string.workout"), icon:$r("app.media.ic_workout")} as RecordTypeIO),
]

export {RecordTypes, RecordTypeEnum}