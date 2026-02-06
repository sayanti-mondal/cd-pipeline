pipeline {
    agent { label 'agent1' }

    stages {
        stage('stage1') {
            steps {
                sh 'whoami'
                sh '$HOME/scripts/script.sh'
            }
        }
        stage('stage2') {
            steps {
                echo 'Hello Sayanti'
            }
        }
    }
}
