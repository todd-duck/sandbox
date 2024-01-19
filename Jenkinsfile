pipeline {
  agent any
  tools {
    maven 'maven-3'
    jdk 'Java17'
  } 
  stages {
    stage('Cloning Git') {
      steps {
        git branch: 'main', changelog: false, poll: false, url: 'https://github.com/todd-duck/duck-clinic.git'
      }
    }
    stage('Compile') {
      steps {
        sh returnStdout: true, script: 'mvn compile'
        }
    }
    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }
    stage('Package') {
      steps {
        sh 'mvn clean package'
        // docker.build image: 'my-image', tag: 'latest'
        }
      }
    }  
  }

