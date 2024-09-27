import { StudentModel } from './StudentModel'

interface WorkerModelIO {
  name: string
  age: number
  sex: boolean
  student: StudentModel
}

@Observed
class WorkerModel implements WorkerModelIO {
  name: string
  age: number
  sex: boolean
  student: StudentModel

  constructor(model: WorkerModelIO) {
    this.name = model.name
    this.age = model.age
    this.sex = model.sex
    this.student = model.student
  }
}

export {WorkerModelIO,WorkerModel}