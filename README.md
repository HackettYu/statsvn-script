# 生成 svn 项目的代码行统计脚本

## 快速入门

命令行下执行:
```bash.exe statsvn.sh```

## 测试环境

- bash `cmd 需要换`
- win10 X64
- 确认 `/c/statsvn/statsvn.jar` 存在
- 确认 `/c/statsvn/qd-manager-sys` 建议拷贝一份项目里所有的文件进入该目录

## 官网 readme.txt

```md
StatSVN README
==============
    StatSVN is a statistics tool for SVN repositories. It generates
    HTML reports from SVN log files.
The StatSVN Manual
    The StatSVN manual is located here: http://svn.statsvn.org/statsvnwiki/index.php/UserManual
Quick Start
    * Download the latest release from http://sourceforge.net/projects/statsvn/
    * Expand the zip file into some directory, e.g c:\statsvn
    * Check out a working copy of the desired SVN module into
      some directory, e.g. c:\myproject.
    * Change into that directory and type
      'svn log --xml -v > svn.log'
    * Change back to the c:\statsvn directory
    * type 'java -jar statsvn.jar c:\myproject\svn.log c:\myproject'
    * Open c:\statsvn\index.html in your web browser
    You can tweak the output of StatSVN in various ways. Run
    'java -jar statsvn.jar' for an overview of the command line
    parameters, and check the manual for full information.
```

## 脚本

```bash
# 进入 statsvn 路径
cd /c/statsvn
# 创建一个 project 目录
mkdir -p project
# 进入工程目录
cd /c/workplace/eclipse/qd-manager-sys
# cp -R -f /c/workplace/eclipse/qd-manager-sys/* /c/statsvn/project/ 不能复制隐藏文件
# 复制文件 包括隐藏的 .svn
cp -rf `ls -A1 --color=never` /c/statsvn/project/
# 进入生成文件的目录
cd /c/statsvn/project
# 在新的工程目录生成 svn.log
svn log --xml -v > svn.log
# 进入 jar 目录
cd /c/statsvn
# 执行 statsvn.jar ${svn.log} ${project root}
java -jar statsvn.jar /c/statsvn/project/svn.log /c/statsvn/project/
# 打开网页
start /c/statsvn/index.html
```

## 纯脚本

- 可以直接执行 `statsvn.sh` 文件

```bash
cd /c/statsvn
mkdir -p project
cd /c/workplace/eclipse/qd-manager-sys
cp -rf `ls -A1 --color=never` /c/statsvn/project/
cd /c/statsvn/project
svn log --xml -v > svn.log
cd /c/statsvn
java -jar statsvn.jar /c/statsvn/project/svn.log /c/statsvn/project/
start /c/statsvn/index.html
```

## 注意事项

- 会生成很多文件, 不建议在工程下使用
- svn.log 要在 svn 项目下
- `java -jar statsvn.jar` 运行时不能是  `/c/statsvn.jar`
- `Repository root not available` `svn switch --relocate svn://oldserver/ http://newserver/svn/goteam/` 切换版本
- `根目录` `java -jar statsvn.jar c:\myproject\svn.log c:\myproject` `都是项目内`

## 截图

![screen-short](screen-short.gif)
