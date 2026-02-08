pipeline {
    agent { label 'agent1' }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
      stage('Check Terraform') {
         steps {
             sh './check_terraform.sh'
        }
     }

        stage('stage2') {
            steps {
                echo 'Hello Sayanti'
            }
        }
    }
}
