pipeline {
  agent none
  stages {
    stage('Checking') {
      agent any
      steps {
        
        sh 'docker build -t phpcomposer .'
        sh 'docker images'
      }
    }
    stage('Building') {
      agent { 
          docker {
            image 'phpcomposer'
          }
      }
      steps {
        
        sh 'composer --version'
        sh 'php --version'
        sh 'composer install'
        sh 'cp .env.example .env'
        sh 'php artisan key:generate'

      }
    }
    stage('Deploying') {
      agent any
      steps {
        
        sh 'docker build -f Dockerfile-Laravel -t laravelproject .'
        sh 'docker run -d -p 8881:80 laravelproject'

      }
    }
  }
}
