@Entry
@Component

struct Test10 {
  build(){
/*    Column({space:300}){
      Row().width('80%').height(50).backgroundColor(Color.Green).margin({top:200})
      Row().width('80%').height(50).backgroundColor(Color.Red)
      Row().width('80%').height(50).backgroundColor(Color.Blue)
    }.width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.SpaceEvenly)*/

/*    Stack() {
      Text('1').backgroundColor(Color.Green).width(300).height(300)
      Text('2').backgroundColor(Color.Red).width(200).height(200)
      Text('3').backgroundColor(Color.Orange).width(100).height(100)
    }.width('100%').height('100%').alignContent(Alignment.Bottom)*/

/*    Column(){
      Text('1').width('100%').height(100).backgroundColor(Color.Orange).margin({top:50,left:30})
      Blank()
      Text('2').width('100%').height(100).backgroundColor(Color.Pink).margin({bottom:50})
    }.height('100%')*/

/*    Grid(){
      ForEach([1,2,3,4,5,6],() =>{
        GridItem()
          .backgroundColor(Color.Orange)
          // .width(80)
          // .height(80)
      })
    }.width('100%')
    .height(400)
    .backgroundColor(Color.Grey)
    .rowsGap(10)
    .columnsGap(10)
    .rowsTemplate('1fr 2fr 1fr 1fr')
    .columnsTemplate('1fr 1fr')*/



    Column({space:10}){
      Text().backgroundColor(Color.Red)
        .width('100%')
        .height(50)

      Text().backgroundColor(Color.Green)
        .width('100%')
        .height(50)
      Column({space:10}){
      Text().backgroundColor(Color.Orange)
        .width('100%')
        .height(50)

      Text().backgroundColor(Color.Yellow)
        .width('100%')
        .height(50)


        Row({space:10}){
          Text().backgroundColor(Color.Pink)
            .width('50%')
            .height('100%')

          Text().backgroundColor(Color.Grey)
            .width('50%')
            .height('100%')
        }.height(200)
    }

    }
  }
}