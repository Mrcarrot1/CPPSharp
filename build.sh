#!/bin/sh

if [ -d "build" ]
then
    rm -rf build
fi
mkdir build

for file in *.csproj
do
    cp $file build
done

for file in *.cs
do
    cpp $file | sed '/^#/d' > build/$file
done

cd build
dotnet build
