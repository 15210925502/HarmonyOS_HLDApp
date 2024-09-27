import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import { JSON } from '@kit.ArkTS';

function addAction(){
  // 添加请求拦截器
  axios.interceptors.request.use((config: InternalAxiosRequestConfig) => {
    // 对请求数据做点什么
    return config
  }, (error: AxiosError) => {
    // 对请求错误做些什么
    return Promise.reject(error)
  })

  //添加响应拦截
  axios.interceptors.response.use((response: AxiosResponse) => {
    //对响应数据做点什么
    return response
  }, (error: AxiosError) => {
    //对响应错误做点什么
    return Promise.reject(error)
  })
}

function getAction(url: string, params: object) {
  // 方式一
  axios.get(url, { params: params }).then((res: AxiosResponse) => {
    console.log(JSON.stringify(JSON.parse(res.data)))
  })
    .catch((err: AxiosError) => {
      console.log(err.message)
    })

  // 方式二
  axios({
    method: 'get',
    url: url,
    params: params,
    timeout: 5000
  }).then((res: AxiosResponse) => {

  })
    .catch((err: Error) => {

    })
}

@Entry
@Component
struct HttpPage {
  @State message: string = 'Hello World';

  postAction(url: string, params: object) {
    // 方式一
    axios.post(url, params).then((res: AxiosResponse) => {
      console.log(JSON.stringify(JSON.parse(res.data)))
    })
      .catch((err: Error) => {
        console.log(err.message);
      })

    // 方式二
    axios({
      method: 'post',
      url: url,
      params: params,
    }).then((res: AxiosResponse) => {

    })
      .catch((err: Error) => {

      })
  }

  build() {
    Column() {
      Button('get获取请求')
        .width(200)
        .margin({ top: 30 })
        .onClick(() => {
          const url = "http://www.xxx.com/info"
          const params: object = Object({ 'page': 0, 'limit': 10 })
          addAction()
          getAction(url, params)
        })

      Button('post获取请求')
        .width(200)
        .margin({ top: 30 })
        .onClick(() => {
          const url = "https://hkbt.jbhloan.com/api/appHomePage"
          const params: object = Object({
            'content': Object({
              'body': Object({
                'versionNo': '1.2.6',
                'platform': 'iOS',
                'AppToken': ''
              })
            }),
            'requestDate': '2024-08-22',
            'requestTime': '2024-08-22',
            'signature': ''
          })
          addAction()
          this.postAction(url, params)
        })
    }
    .height('100%')
    .width('100%')
  }
}