import MyClassA from './MyClassA';

@Component
export default struct MyViewA {
  // 子组件ViewA的@ObjectLink的类型是ClassA
  @ObjectLink a: MyClassA;
  label: string = 'ViewA1';

  build() {
    Row() {
      Button(`ViewA [${this.label}] this.a.c = ${this.a ? this.a.c : "undefined"}`)
        .width(320)
        .margin(10)
        .onClick(() => {
          this.a.c += 1;
        })
    }
  }
}