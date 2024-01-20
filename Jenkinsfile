pipeline {
  environment{ 
        withRegistry = "todddocker/duck-clinic-dhub"
        registryCredential = 'todddocker'        
    }
  agent any
  tools {
    maven 'maven-3'
    jdk 'Java17'
    'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'docker'
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
        sh 'mvn test -Dmaven.test.failure.ignore=true'
      }
    }
    stage('Package') {
      steps {
        sh 'mvn clean package'
        }
      }
    stage('Docker') {
      steps {
        script {
          docker.build("my-image")
          //dockerImage = docker.build registry + ":$BUILD_NUMBER"
          }
        }
      }
    stage('Push image') {
      steps {
        script {
          docker.withRegistry('', 'docker-hub-credentials') {
          docker.push("my-image")}
        }
      }
    }
  }
}
