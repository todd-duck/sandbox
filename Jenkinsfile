pipeline {
  environment{ 
        registry = "todddocker/duck-clinic-dhub"
        registryCredential = 'todddocker'        
    }
  agent any
  tools {
    maven 'maven-3'
    jdk 'Java17'
    //'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'docker'
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
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
          }
        }
      }
    stage('Dockerpush') {
      steps {
        //withDockerRegistry(credentialsId: 'todddocker', url: 'hub.docker.com') {
        script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
          }
        }
      }
    }
  }  
