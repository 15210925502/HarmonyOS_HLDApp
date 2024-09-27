import { CommonConstants } from '../../common/constants/CommonConstants'

interface GeneratedTypeLiteralInterface_1 {
  title: string;
  value: number;
  tips?: number;
}

@Component
export default struct CalorieStats {
  @Prop inTake: number
  @Prop expend: number
  recommend: number = CommonConstants.RECOMMEND_CALORIE

  remainCalorie() {
    return this.recommend - this.inTake + this.expend
  }

  build() {
    Row({ space: CommonConstants.SPACE_6 }) {
      //饮食摄入
      this.statsBuilder({title: '饮食摄入', value: this.inTake})

      // 还可以吃多少
      Stack() {
        Progress({
          value: this.inTake,
          total: this.recommend,
          type: ProgressType.Ring
        }).width(120)
          .style({ strokeWidth: CommonConstants.DEFAULT_10})
          .color($r('app.color.primary_color'))
        this.statsBuilder({title:'还可以吃', value:this.remainCalorie(),tips: this.recommend})
      }
      //运动消耗
      this.statsBuilder({title:'运动消耗', value:this.expend})
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .padding({ top: 30, bottom: 35 })
  }

  // @Builder中默认传入的是指，而不是引用，改成@Component就没问题
  @Builder
  statsBuilder($$: GeneratedTypeLiteralInterface_1) {
    Column({ space: CommonConstants.SPACE_6 }) {
      Text($$.title)
        .fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text($$.value.toFixed(0))
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      if ($$.tips) {
        Text(`推荐${$$.tips}`)
          .fontSize(16)
          .fontColor($r('app.color.light_gray'))
      }
    }
  }
}