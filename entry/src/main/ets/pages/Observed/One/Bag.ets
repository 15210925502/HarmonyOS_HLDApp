// objectLinkNestedObjects.ets
let NextID: number = 1;

@Observed
export default class Bag {
  public id: number;
  public size: number;

  constructor(size: number) {
    this.id = NextID++;
    this.size = size;
  }
}