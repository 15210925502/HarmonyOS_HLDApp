@Entry
@Component
struct FlexPage {
  @State listArray: Array<String> = ['你好','电视剧','练市连史学家','啊会计助理水底纳瓜哦iu','是的呢哟张宁波额URL加大分','阿斯兰阿萨德','练市连史学d士大夫家','是的呢哟张宁波额URL加大分阿斯兰阿萨德练市连史学d士大夫家']
    build() {
      Flex({
        direction:FlexDirection.Row,
        wrap:FlexWrap.Wrap,
        alignItems:ItemAlign.Center,
        justifyContent:FlexAlign.Start,
        alignContent:FlexAlign.Start
      }){
        ForEach(this.listArray,(item:string) => {
          Text(item)
            .fontSize(20)
            .flexBasis('auto')
            .backgroundColor(Color.Pink)
            .textAlign(TextAlign.Center)
            .margin(10)
            .maxLines(1)
            .textOverflow({overflow:TextOverflow.Ellipsis})
        })
      }.width('100%')
      .height(500)
      .backgroundColor(Color.Gray)
    }
}