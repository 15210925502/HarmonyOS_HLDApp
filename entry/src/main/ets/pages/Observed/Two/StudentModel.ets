interface StudentModelIO {
  name: string
  age: number
  sex: boolean
}

@Observed
class  StudentModel implements StudentModelIO {
  name: string
  age: number
  sex: boolean

  constructor(model: StudentModelIO) {
    this.name = model.name
    this.age = model.age
    this.sex = model.sex
  }
}

export {StudentModelIO,StudentModel}