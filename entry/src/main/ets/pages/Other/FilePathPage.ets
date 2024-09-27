import { common } from '@kit.AbilityKit'

@Entry
@Component
struct FilePathPage {
private context = getContext(this) as common.UIAbilityContext

  build() {
   Column(){
     Button('获取路径')
       .onClick(()=>{
         let applicationContext = this.context.getApplicationContext()
         let dataBaseDir = applicationContext.databaseDir
         console.log('myTest',dataBaseDir)
       })

    }
    .height('100%')
    .width('100%')
  }
}