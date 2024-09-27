import Bottom from "../../component/Bottom"
import TopComponent from "../../component/TopComponent"

@Entry
@Component
struct Test11 {
  build() {
    Column() {

      TopComponent()
      .width('100%')
      .height(50)
      .backgroundColor(Color.Brown)
      List(){
        ForEach(Array.from({length:20}),()=>{
          ListItem(){
            Text()
              .width('100%')
              .height(100)
              .backgroundColor(Color.Brown)
          }.padding(10)

        })
      }.layoutWeight(1)
      .width('100%')
      .backgroundColor(Color.Red)
      Bottom()
        .height(50)
        .backgroundColor(Color.Brown)
        .padding({ left:20,right:20 })
        .width('100%')
    }
  }
}