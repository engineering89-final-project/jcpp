pipeline {
  agent { label '' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('eng89_docker')
  }
  stages {
    stage('Build') {
      steps {
        sh '''sudo chmod 777 ./jenkins/build.sh
        ./jenkins/build.sh'''
      }
    }
    stage('Login') {
      steps {
        sh '''sudo chmod 777 ./jenkins/login.sh
        ./jenkins/login.sh'''
      }
    }
    stage('Push') {
      steps {
        sh '''sudo chmod 777 ./jenkins/push.sh
        ./jenkins/push.sh
        '''
      }
    }
  }
  post {
    always {
      sh '''sudo chmod 777 ./jenkins/logout.sh
      ./jenkins/logout.sh
      '''
    }
  }
}