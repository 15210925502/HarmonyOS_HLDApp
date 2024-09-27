import { describe, it } from '@ohos/hypium'
import DateUtil from '../main/ets/pages/Demo/HeiMaHealthyDemo/common/utils/DateUtil'

//测试脚本名字：就是函数名字
export default function DemoTest() {
  // 定义一个测试套件，两个参数：1.测试套件的名字，2.测试套件函数
  describe('my_demo',()=>{
    // 定义一个测试用例，三个参数：1.用例名称，2.标记，3.方法
    it('testDemo',0,()=>{
      // 真正的测试代码
      console.log('HLD','我的测试调试1已启动')
      console.log('HLD',DateUtil.beginTimeOfDay(new Date()))
    })

    it('testDemo1',0,()=>{
      // 真正的测试代码
      console.log('HLD','我的测试调试2已启动')
    })
  })
}
