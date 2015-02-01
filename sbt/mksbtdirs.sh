#!/bin/bash

read -p "Project name: " projectName

# Create sbt directory structure
mkdir -p ${projectName}/src/{main,test}/{java,resources,scala}
mkdir -p ${projectName}/{lib,project,target}

# Create build.scala
echo "import sbt._
import Keys._

object AppBuild extends Build {
  lazy val root = Project(id = \"root\", base = file(\".\")).settings(
    name := \"$projectName\",
    version := \"1.0\"
  )
}" > ${projectName}/project/build.scala

# Create hello.scala
echo "object App {
  def main(args: Array[String]): Unit = {
    println(\"Hello $projectName\")
  }
}" > ${projectName}/src/main/scala/hello.scala

# Create .gitignore
echo "bin/
project/
target/
.cache
.classpath
.project
.settings" > ${projectName}/.gitignore


