pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'parallel'
            }
        }
        stage('Test2') {
            steps {
                echo 'parallel'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    post {
        success {
          githubNotify gitApiUrl: 'https://github.mycompany.com/api/v3', context: 'other test', description: 'It works', credentialsId: 'pchynoweth', status: 'SUCCESS'
        }
        failure {
          githubNotify gitApiUrl: 'https://github.mycompany.com/api/v3', context: 'other test', description: 'This commit cannot be built', credentialsId: 'pchynoweth', status: 'FAILURE'
        }
    }
}
