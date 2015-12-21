assemble=false

if [ $1 -le 3 ]
then
  cmd="tools/HardwareSimulator.sh"
elif [ $1 -gt 3 ] && [ $1 -le 12 ]
then
  cmd="tools/CPUEmulator.sh"
  assemble=true
else
  cmd="tools/CPUEmulator.sh"
fi

if [ $2 ]
then
  path=$1/$2
else
  path=$1
fi


if [ $assemble ]
then
  for file in projects/$path/*.asm
  do
    echo "Assembling..."
    echo $file
    tools/Assembler.sh $file
  done
fi

for file in projects/$path/*.tst
do
  echo "Testing..."
  echo $file
  $cmd $file
done