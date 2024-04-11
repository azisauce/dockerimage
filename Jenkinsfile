pipeline {
  agent none
  stages {
    stage('Build') {
      agent any
      steps {
        
        sh 'docker build -t phpcomposer .'
        sh 'docker images'
      }
    }
    stage('Test') {
      agent { 
          docker {
            image 'phpcomposer'
          }
      }
      steps {
        
        sh 'composer --version'
        sh 'php --version'
        sh 'composer install'
        sh 'php artisan serve'
      }
    }
  }
}
