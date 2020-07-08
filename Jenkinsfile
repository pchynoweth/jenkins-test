pipeline {
    agent none
    stages {
        stage('run') {
            agent any

            environment { 
                GITHUB_SECRET = credentials('github-token') 
            }
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
                    sh 'bash ./run.sh success test2'
                }
                failure {
                    sh 'bash ./run.sh failure test2'
                }
            }
        }
    }
}
