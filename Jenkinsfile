pipeline {
    agent none
    environment { 
        GITHUB_SECRET = credentials('github-token') 
    }
    stages {
        stage('Abort stale jobs') {
            agent none

            steps {
                milestone label: '', ordinal:  Integer.parseInt(env.BUILD_ID) - 1
                milestone label: '', ordinal:  Integer.parseInt(env.BUILD_ID)
            }
        }
        stage('Locked') {
            agent none

            options {
                lock('test-lock')
            }
            stages {
                stage('Test') {
                    agent any
                    steps {
                        echo 'parallel'
                        sh 'bash ./up-to-date.sh'
                    }
                    post {
                        failure {
                            echo 'This branch is out-of-date'
                        }
                    }
                }
                stage('Test2') {
                    agent any
                    steps {
                        echo 'parallel'
                        sh 'env'
                    }
                }
                stage('Deploy') {
                    steps {
                        echo 'Deploying....'
                        echo "${BUILD_NUMBER}"
                    }
                }
            }
        }
    }
}
