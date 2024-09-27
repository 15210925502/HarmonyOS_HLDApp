import Bag from './Bag';

@Observed
export default class User {
  public bag: Bag;

  constructor(bag: Bag) {
    this.bag = bag;
  }
}