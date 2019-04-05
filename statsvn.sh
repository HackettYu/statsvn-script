echo "Please wait"
echo "comfirm /c/statsvn/statsvn.jar"
cd /c/statsvn
mkdir -p project
echo "comfirm /c/workplace/eclipse/qd-manager-sys/\${your project}"
cd /c/workplace/eclipse/qd-manager-sys
echo "start>copy ......"
cp -rf `ls -A1 --color=never` /c/statsvn/project/
cd /c/statsvn/project
echo "start>svn.log ......"
svn log --xml -v > svn.log
cd /c/statsvn
echo "start>statsvn.jar ......"
java -jar statsvn.jar /c/statsvn/project/svn.log /c/statsvn/project/
echo "have fun"
start /c/statsvn/index.html