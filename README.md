# your_reader

插件式集成的聚合阅读器。

1. 输入阅读源api
2. 定义数据解析器，解析为 APP 数据格式
3. 定义展示规则，解析为展示格式

## 如何编写 js脚本

1. 脚本需提供 getReaderData(url) 入口函数，APP 会将 url 传入
2. 请求失败时，调用 window.flutter_inappwebview.callHandler('reader-fail'); 通知 APP 失败了
3. 请求成功时，调用 window.flutter_inappwebview.callHandler('reader-success', result); 将结果返回给 APP

## 返回结果的格式
可以参考 rss.html 文件
```
{
  url: "",
  title: "",
  desc: "",
  markdown: "",
  html: "",
  images: [],
  videos: []
}
```
