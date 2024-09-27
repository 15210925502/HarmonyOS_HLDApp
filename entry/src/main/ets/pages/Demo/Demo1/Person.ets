import DataModel from './DataModel'

let idNum: number = -1

export default class  Person implements DataModel{
  idNum: number
  image: ResourceStr
  name: string
  isLove: boolean
  phone: string

  constructor(model:DataModel) {
    this.idNum = ++ idNum
    this.image = model.image
    this.name = model.name
    this.isLove = model.isLove
    this.phone = model.phone
  }
}