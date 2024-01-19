pipeline {
  environment {
  }
  agent any
  tools {
    maven 'maven-3'
    jdk 'Java21'
  } 
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/todd-duck/duck-clinic.git'
      }
    }
    stage('Compile') {
       steps {
         sh 'mvn compile' //only compilation of the code
       }
    }
  }
}
