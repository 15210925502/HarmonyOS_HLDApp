@Entry
@Component
struct Test12 {
  list: Array<string> = ['1','2','3','4','5','6']
  build() {
    Column(){
      Text('123456')
        .backgroundColor(Color.Red)

      Stack({alignContent:Alignment.BottomEnd}){
        List({space:20}){
          ForEach(this.list,(item:string)=>{
            ListItem(){
              Text(item)
                .fontSize(26)
                .fontColor(Color.Gray)
                .textAlign(TextAlign.Center)
                .width('100%')
            }
          })
        }.backgroundColor(Color.Orange)
        .height(500)
        Button("+")
          .fontSize(30)
          .backgroundColor(Color.Blue)
          .fontColor(Color.White)
          .margin({bottom:30,right:30})
      }
    }

  }
}