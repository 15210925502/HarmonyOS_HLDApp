import MyComponent from './MyComponent';
import { StudentModel } from './StudentModel';
import { WorkerModel, WorkerModelIO } from './WorkerModel';

@Entry
@Component
struct ObjectLinkPage {
  @State list: Array<WorkerModelIO> = []

  aboutToAppear(): void {
    this.list.push(new WorkerModel({
      name: '张三',
      age: 18,
      sex: false,
      student: new StudentModel({ name: '张三学生', age: 12, sex: true })
    }))
    this.list.push(new WorkerModel({
      name: '李四',
      age: 28,
      sex: true,
      student: new StudentModel({ name: '李四学生', age: 13, sex: false })
    }))
    this.list.push(new WorkerModel({
      name: '王五',
      age: 39,
      sex: false,
      student: new StudentModel({ name: '王五学生', age: 19, sex: true })
    }))
    this.list.push(new WorkerModel({
      name: '赵六',
      age: 87,
      sex: true,
      student: new StudentModel({ name: '赵六学生', age: 22, sex: false })
    }))
    this.list.push(new WorkerModel({
      name: '孙琪',
      age: 67,
      sex: false,
      student: new StudentModel({ name: '孙琪学生', age: 28, sex: true })
    }))
  }

  build() {
    Column() {
      List() {
        ForEach(this.list, (item: WorkerModel) => {
          ListItem() {
            MyComponent({ model: item })
          }
        })
      }.margin({ bottom: 40 })

      Button('变更数据中的内容')
        .onClick(() => {
          this.list[2].student.name = '华华'
        }).margin({bottom: 20})

      Button('删除某条数据')
        .onClick(() => {
          this.list.pop()
        })
    }
    .height('100%')
    .width('100%')
  }
}