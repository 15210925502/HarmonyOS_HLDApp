import { CommonConstants } from '../../common/constants/CommonConstants'

interface GeneratedTypeLiteralInterface_1 {
  label: string;
  value: number;
  recommend: number;
  color: ResourceStr;
}

@Component
export default struct NutrientStats {
  @Prop carbon: number
  @Prop protein: number
  @Prop fat: number
  recommendCarbon: number = CommonConstants.RECOMMEND_CARBON
  recommendProtein: number = CommonConstants.RECOMMEND_PROTEIN
  recommendFat: number = CommonConstants.RECOMMEND_FAT

  build() {
    Row({ space: CommonConstants.SPACE_6 }) {
      this.statsBuilder({
        label: '碳水化合物',
        value: this.carbon,
        recommend: this.recommendCarbon,
        color: $r('app.color.carbon_color')
      })
      this.statsBuilder({
        label: '蛋白质',
        value: this.protein,
        recommend: this.recommendProtein,
        color: $r('app.color.protein_color')
      })
      this.statsBuilder({
        label: '脂肪',
        value: this.fat,
        recommend: this.recommendFat,
        color: $r('app.color.fat_color')
      })
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .padding({ top: 30, bottom: 35 })
  }

  @Builder
  statsBuilder($$: GeneratedTypeLiteralInterface_1) {
    Column({ space: CommonConstants.SPACE_6 }) {
      Stack() {
        Progress({
          value: $$.value,
          total: $$.recommend,
          type: ProgressType.Ring
        }).width(95)
          .style({ strokeWidth: CommonConstants.DEFAULT_6 })
          .color($$.color)
        Column({ space: CommonConstants.SPACE_6 }) {
          Text('摄入推荐')
            .fontSize(12)
            .fontColor($r('app.color.gray'))
          Text(`${$$.value.toFixed(0)}/${$$.recommend.toFixed(0)}`)
            .fontSize(18)
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
        }
      }

      Text(`${$$.label}(克)`)
        .fontSize(12)
        .fontColor($r('app.color.light_gray'))
    }
  }
}