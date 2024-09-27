import DemoTest from './Demo.test';
import localUnitTest from './LocalUnit.test';

export default function testsuite() {
  localUnitTest();
  DemoTest()
}