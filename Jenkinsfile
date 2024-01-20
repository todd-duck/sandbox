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
    stage('Push') {
      steps {
        // Push the Docker image to GitHub Container Registry
        docker.push("petclinic-app", "ghcr.io/todd-duck/petclinic-app")
      }
    }
  }
}
