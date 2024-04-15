pipeline {
  agent none
  stages {
    stage('Build') {
      agent any
      steps {
        
        sh 'docker build -f Dockerfile -t phpcomposer .'
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
        sh 'php artisan key:generate '
      }
    }
  }
}
