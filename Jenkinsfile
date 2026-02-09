pipeline {
    agent { label 'agent1' }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
      stage('Check Terraform') {
         steps {
             sh 'whoami'
             sh 'chmod u+x check_terraform.sh'
             sh './check_terraform.sh'
        }
     }

        stage('Check AWs Cli') {
            steps {
               sh 'chmod +x check_aws_cli.sh'
               sh './check_aws_cli.sh'
            }
        }

        /*
        stage('terraform apply') {
          steps {
            dir('terraforrm') {
             withCredentials([
               [$class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'aws-creds']
             ]) {
                 sh '''
                   aws sts get-caller-identity
                   terraform init
                   terraform plan
                   terraform apply --auto-approve
                '''
             }
          }
       }
    }

         stage('install/Check ansible') {
           steps {
               dir('ansible'){
                 sh 'whoami'
                 sh 'chmod u+x check_ansible.sh'
                 sh './check_ansible.sh'
               }
           }   
         }

    */
        stage('Ansible Configure') {
          steps {
             dir('ansible'){
             sh 'ansible-inventory --graph'
             sh 'ansible-playbook playbooks/main.yml'
             }
          }
        }
    
    }
}
