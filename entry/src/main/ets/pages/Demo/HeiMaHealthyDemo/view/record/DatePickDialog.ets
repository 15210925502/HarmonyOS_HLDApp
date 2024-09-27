import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export default struct DatePickDialog {
  controller: CustomDialogController
  selectedDate: Date = new Date()

  build() {
    Column({ space: CommonConstants.SPACE_12 }) {
      // 日期选择器
      DatePicker({
        start: new Date('1997-09-07'),
        end: new Date('3050-12-12'),
        selected: this.selectedDate
      }).onDateChange((value: Date) => {
        this.selectedDate = value
      })
      //     按钮
      Row({ space: CommonConstants.SPACE_12 }) {
        Button('取消')
          .width(120)
          .backgroundColor($r('app.color.light_gray'))
          .onClick(() => {
            this.controller.close()
          })
        Button('确定')
          .width(120)
          .backgroundColor($r('app.color.primary_color'))
          .onClick(() => {
            // 保存日期到全局存储器
            AppStorage.setOrCreate('selectedDate', this.selectedDate.getTime())
            this.controller.close()
          })
      }
    }
    .padding(CommonConstants.SPACE_12)
  }
}