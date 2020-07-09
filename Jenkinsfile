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
				    steps {
				        echo 'parallel'
				    }
				}
				stage('Test2') {
					agent any
				    steps {
				        echo 'parallel'
				        sh 'sleep 60'
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
