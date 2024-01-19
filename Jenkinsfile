pipeline {
  environment {
    JAVA_HOME = '/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home/bin'
     PATH = '$PATH:$JAVA_HOME'
  }
  agent any
  tools {
    maven 'maven-3'
    jdk 'Java21'
  } 
  stages {
    stage('Cloning Git') {
      steps {
        git branch: 'main', changelog: false, poll: false, url: 'https://github.com/todd-duck/duck-clinic.git'
      }
    }
    stage('Compile') {
       steps {
         sh 'mvn compile' //only compilation of the code
       }
    }
  }
}
