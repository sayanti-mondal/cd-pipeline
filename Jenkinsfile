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
             sh 'chmod u+x check_aws_cli.sh'
             sh './check_terraform.sh'
        }
     }

        stage('Check AWs Cli') {
            steps {
               sh 'chmod +x check_aws_cli.sh'
               sh './check_aws_cli.sh'
            }
        }
    }
}
