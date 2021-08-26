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
        script {
          sudo chmod 777 ./jenkins/build.sh
        }
        sh './jenkins/build.sh'
      }
    }
    stage('Login') {
      steps {
        script {
          sudo chmod 777 ./jenkins/login.sh
        }
        sh './jenkins/login.sh'
      }
    }
    stage('Push') {
      steps {
        script {
          sudo chmod 777 ./jenkins/push.sh
        }
        sh './jenkins/push.sh'
      }
    }
  }
  post {
    always {
      script {
          sudo chmod 777 ./jenkins/logout.sh
        }
      sh './jenkins/logout.sh'
    }
  }
}