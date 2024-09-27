export interface TaskInfo {
  myId:number | undefined
  name:string | undefined
  finished:boolean
}

export class TaskInfoModel implements TaskInfo {
  myId: number | undefined = undefined
  name: string | undefined = undefined
  finished: boolean = false

  constructor(model: TaskInfo) {
    this.myId = model.myId
    this.name = model.name
    this.finished = model.finished
  }
}