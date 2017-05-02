Git是什么？
Git是目前世界上最先进的分布式版本控制系统（没有之一）。
Git有什么特点？简单来说就是：高端大气上档次！

1、创建版本库
```
# mkdir bjwf125
# cd bjwf125
# git init   #初始化仓库
把文件添加到仓库
例如：
	# vim readme.txt
		Git is a version control system.
		Git is free software.
# git add readme.txt   #把文件添加到仓库
# git commit -m 'add file readme.txt'    #把文件提交到仓库
```
2、时光穿梭机
```
要随时掌握工作区的状态，使用git status命令。
如果git status告诉你有文件被修改过，用git diff可以查看修改内容。
HEAD指向的版本就是当前版本，因此，Git允许我们在版本的历史之间穿梭，使用命令git reset --hard commit_id。
穿梭前，用git log可以查看提交历史，以便确定要回退到哪个版本。
要重返未来，用git reflog查看命令历史，以便确定要回到未来的哪个版本。

撤销修改
# git checkout -- readme.txt
命令git checkout -- readme.txt意思就是，把readme.txt文件在工作区的修改全部撤销，这里有两种情况：
一种是readme.txt自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态；
一种是readme.txt已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。
总之，就是让这个文件回到最近一次git commit或git add时的状态。

总结
场景1：当你乱改了工作区某个文件的内容，想直接丢弃工作区的修改时，用命令git checkout --file。
场景2：当你不但乱改了工作区某个文件的内容，还添加到了暂存区时，想丢弃修改，分两步，第一步用命令git reset HEAD file，就回到了场景1，第二步按场景1操作。
场景3：已经提交了不合适的修改到版本库时，想要撤销本次提交，可以使用git reset --hard HEAD^回退上一个版本，不过前提是没有推送到远程库。

删除文件：
# rm file        #先删除文件
# git rm file    #第二步是用命令删掉
# git commit -m 'remove file'   #第三步是从版本库中删除文件
*如果删错了，版本库中还有，可以很轻松地把误删的文件恢复到最新版本
# git checkout -- file
*git checkout其实是用版本库里地版本替换工作区的版本，无论工作区是修改还是删除，都可以“一键还原”。
*命令git rm用于删除一个文件，如果一个文件已经提交到版本库，那么你永远不用担心误删，但是要小心，你只能恢复文件到最新版本，你会丢失最近一次提交后你修改的内容。
```
3、远程仓库
```

```