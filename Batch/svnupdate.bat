'echo off
echo "SVN Update"
for /D %%i in (*) do (
echo %%i
cd %%i
svn update
cd ..
)