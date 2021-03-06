@echo off
REM 构建类库
call yarn lib
call git add dist
call git commit -m"chore: npm 发布前构建"

REM 更新版本
call yarn standard-version

REM 发布到 npm 仓库
call npm login --registry="https://registry.npmjs.org/"
call npm publish --registry="https://registry.npmjs.org/"

REM 推送 git
call git push origin --tags

REM 合并 master
call git checkout master
call git merge dev
call git push
call git checkout dev