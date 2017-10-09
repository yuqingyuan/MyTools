# MyTools
闲着的时候码的一些终端小工具

---CountLines.pl---<br>
基于perl实现的统计代码行数的命令行工具,目前可以统计文件夹下以 **.h**,**.m**,**.swift**结尾的文件的代码行数<br>
如果想增加或减少统计文件类型,可以更改以下代码
```
#统计代码行数的文件后缀
@fileSuffix = ("swift","h","m");  #可添加或删除
```
默认是用来统计iOS项目的,所以忽略了Pods文件夹,可以更改以下代码
```
#忽视的文件夹名
@folderIgnored = ("Pods","Assets.xcassets","Base.lproj");  #可添加或删除
```
