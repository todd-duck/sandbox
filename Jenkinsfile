pipeline {
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
  }
}
