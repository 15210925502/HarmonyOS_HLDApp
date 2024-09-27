@Entry
@Component
struct  UITest1 {
  @State aa: number = 100
  build(){
    Column(){
      Text(this.aa.toString())
      Divider()
      Text('hello test2')

      Button(this.aa.toString())
        .onClick(() => {
          this.aa += 1
        })
      childComponent({aa:$aa})
    }
  }
}

@Component
struct  childComponent {
  @Link aa: number
  build() {
    Column(){
      Button(this.aa.toString())
        .onClick(() => {
          this.aa += 1
        })
    }
  }
}