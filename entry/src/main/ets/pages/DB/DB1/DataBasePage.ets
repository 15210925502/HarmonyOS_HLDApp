import { common } from '@kit.AbilityKit';
import { DBManager } from './DBManager';

@Entry
@Component
struct DataBasePage {
  private context = getContext(this) as common.UIAbilityContext

  build() {
    Column({ space: 20 }) {
      Button('创建数据库')
        .onClick(() => {
          // 初始化数据库
          DBManager.share.initTaskDB()
        })

      Button('插入数据')
        .onClick(() => {
          DBManager.share.addTask('张三')
            .then((result) => {
              console.log('TestTag', '增加数据成功')
            })
            .catch((err:Error)=>{
              console.log('TestTag',err.message)
            })
        })
      Button('查询数据')
        .onClick(() => {
          DBManager.share.selectTaskList('张三')
        })
      Button('更新数据')
        .onClick(() => {

        })

      Button('删除数据')
        .onClick(() => {

        })
    }
    .height('100%')
    .width('100%')
  }
}