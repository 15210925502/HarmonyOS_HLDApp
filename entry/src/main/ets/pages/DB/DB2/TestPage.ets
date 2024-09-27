import { userDao } from './UserDao';

@Entry
@Component
struct TestPage {

  build() {
    Column() {
     Button('插入数据')
       .onClick(()=>{
         userDao.insert(100, "name100")
       })
    }
    .height('100%')
    .width('100%')
  }
}