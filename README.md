# LQHEICToJPG
HEIC 是苹果在iPhone 7 + 设备, iOS 11之后新退出的一种图片格式, 这种文件格式具体介绍可参考[这篇文章](http://blog.csdn.net/olsQ93038o99S/article/details/78238090) 和 [简书的这篇文章](http://www.jianshu.com/p/1377ce63a707).

如果是使用下面的方法获取的图片原始数据(Data), 可能会导致显示不了, 或者传到后台之后, 后台解析不了:

```
PHImageManager.default().requestImageData(for: ass, options: option) { (data, string, orientation, info) in

}
```

工具中封装了几种图片格式的相互转换: HEIC / JPG / PNG, 以及如何加载显示HEIC格式图片, 对UIImage扩展的方法;
代码不复杂, 直接查看源文件即可.
