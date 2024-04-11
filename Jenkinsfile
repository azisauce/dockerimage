pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t phpcomposer .'
        sh 'docker images'
      }
    }
    stage('Test') {
      steps {
        agent { 
          docker {
            image 'phpcomposer'
          }
        }
        sh 'composer --version'
        sh 'php --version'
      }
    }
  }
}
