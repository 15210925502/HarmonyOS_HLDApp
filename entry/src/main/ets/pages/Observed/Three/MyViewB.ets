import MyClassA from './MyClassA';
import MyViewA from './MyViewA';

@Entry
@Component
struct MyViewB {
  // ViewB中有@State装饰的ClassA[]
  @State arrA: MyClassA[] = [new MyClassA(0), new MyClassA(0)];

  build() {
    Column() {
      ForEach(this.arrA, (item: MyClassA) => {
          MyViewA({ label: `#${item.id}`, a: item })
        }, (item: MyClassA): string => item.id.toString()
      )
      // 使用@State装饰的数组的数组项初始化@ObjectLink，其中数组项是被@Observed装饰的ClassA的实例
      MyViewA({ label: `ViewA this.arrA[first]`, a: this.arrA[0] })
      MyViewA({ label: `ViewA this.arrA[last]`, a: this.arrA[this.arrA.length - 1] })

      Button(`ViewB: reset array`)
        .width(320)
        .margin(10)
        .onClick(() => {
          this.arrA = [new MyClassA(1), new MyClassA(2),new MyClassA(3)];
        })
      Button(`ViewB: push`)
        .width(320)
        .margin(10)
        .onClick(() => {
          this.arrA.push(new MyClassA(0))
        })
      Button(`ViewB: shift`)
        .width(320)
        .margin(10)
        .onClick(() => {
          if (this.arrA.length > 0) {
            this.arrA.shift()
          } else {
            console.log("length <= 0")
          }
        })
      Button(`ViewB: chg item property in middle`)
        .width(320)
        .margin(10)
        .onClick(() => {
          this.arrA[Math.floor(this.arrA.length / 2)].c = 10;
        })
      Button(`ViewB: chg item property in middle`)
        .width(320)
        .margin(10)
        .onClick(() => {
          this.arrA[Math.floor(this.arrA.length / 2)] = new MyClassA(11);
        })
    }
  }
}