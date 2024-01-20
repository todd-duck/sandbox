pipeline {
  environment{ 
        withRegistry = "todddocker/duck-clinic-dhub"
        registryCredential = 'todddocker'
        DOCKER_IMAGE_NAME = "duckclinic.jfrog.io/docker-local/petclinic-app:latest"
    }
  agent any
  tools {
    maven 'maven-3'
    jdk 'Java17'
    'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'docker'
    jfrog 'jfrog-cli'
  } 
  stages {
    stage('Cloning Git') {
      steps {
        git branch: 'main', changelog: false, poll: false, url: 'https://github.com/todd-duck/duck-clinic.git'
      }
    }
    stage('Compile') {
      steps {
        // sh returnStdout: true, script: 'mvn compile'
        sh 'mvn compile'
        }
    }
    stage('Test') {
      steps {
        // sh 'mvn test -Dmaven.test.failure.ignore=true'
        sh 'mvn test'
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
          docker.build("petclinic-app")
          }
        }
      }
    stage('Push to Jfrog') {
      steps {
        jf 'docker push $DOCKER_IMAGE_NAME'
        }
      }
    stage('Publish build info') {
      steps {
        jf 'rt build-publish'
        }
      }
  }
}
