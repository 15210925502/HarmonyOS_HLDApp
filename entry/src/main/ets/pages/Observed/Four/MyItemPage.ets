@Observed
class StringArray extends Array<String> {

}

@Component
struct MyItemPage {
  @ObjectLink itemArr: StringArray;

  build() {
    Row() {
      Text('ItemPage')
        .width(100).height(100)

      ForEach(this.itemArr, (item: string) => {
        Text(item)
          .width(100).height(100)
      }, (item: string) => item)
    }
  }
}

export {StringArray,MyItemPage}