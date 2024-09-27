import { StudentModel } from './StudentModel'
import { WorkerModel } from './WorkerModel'

@Component
export default  struct MyComponent {
  @ObjectLink model: WorkerModel

  build() {
    Row({space: 25}) {
      Row({space: 10}) {
        Text(this.model.name)
        Text(this.model.age.toString())
        Text(this.model.sex ? '男' : '女')
      }
      StudentComponent({model: this.model.student})
    }
  }
}

@Component
struct StudentComponent {
  @ObjectLink model: StudentModel

  build() {
    Row({space: 25}) {
      Row({space: 10}) {
        Text(this.model.name)
        Text(this.model.age.toString())
        Text(this.model.sex ? '男' : '女')
      }.backgroundColor(Color.Red)
    }
  }
}