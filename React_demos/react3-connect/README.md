## react-connect

这是一个 react 组件通信的demo。

通过修改`src/index.js`文件的`import App from './component{x}/parent';`字段即可运行不同的demo。

> 注意`{x}` 是数字

## Usage

```sh
yarn install   # 安装依赖

yarn run start	# 运行项目
```

### component1

父组件向子组件通信
子组件向父组件通信

父组件通过属性方式将值传给子组件
子组件通过回调函数传值回父组件

### component2

父组件向子组件通信
子组件向父组件通信

### component3

跨级组件之间通信

-   父组件需要声明自己支持 context 对象，并提供 context 中属性的 PropTypes
-   子组件需要声明自己需要使用 context，并提供其需要使用的 context 属性的 PropTypes
-   父组件需提供一个 getChildContext 函数，以返回一个初始的 context 对象

### component4

同样是跨级组件之间通信

### component5

非嵌套组件间通信
可以表达为兄弟组件之间的通信

-   利用二者共同父组件的 context 对象进行通信
-   使用自定义 events 事件的方式
