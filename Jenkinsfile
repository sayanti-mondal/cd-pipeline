pipeline {
    agent { label 'agent1' }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('stage1') {
            steps {
                sh 'whoami'
                sh 'chmod +x script.sh'
                sh './script.sh'
            }
        }
        stage('stage2') {
            steps {
                echo 'Hello Sayanti'
            }
        }
    }
}
