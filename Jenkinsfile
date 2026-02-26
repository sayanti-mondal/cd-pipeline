pipeline {
    agent { label 'agent1' }
    tools { 
        terraform 'terraform 1.13.5'
    }
     environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
    }
    stages {
        stage('check terraform') {
            steps {
                sh 'terraform version'
            }
        }
        stage('checkout code') {
            steps {
                git branch: 'main', url: 'https://github.com/sayanti-mondal/terraform-demo.git'
            }
        }
        stage('terraform destroy') {
            steps {
                dir('ec2'){
                   sh 'terraform destroy --auto-approve'
                  }
               }
        //    }
        // // stage('initialize terraform') {
        // //     steps {
        // //         dir('ec2'){
        // //           sh 'terraform init'
        // //           }
        // //       }
        // //   }
        // //     stage('terraform plan') {
        // //     steps {
        // //         dir('ec2'){
        // //           sh 'terraform plan -out=tfplan'
        // //           //sh 'terraform show tfplan'
        // //           }
        // //       }
        // //   }
        // //   stage('Manual approval') {
        // //       //when {
        // //       // branch 'main'
        // //       // }
        // //     steps {
        // //           input message: "Approve infrastructure changes?", ok: "Apply"
        // //           }
        // //   }
        // //   stage('Terraform Apply') {
        // //     steps {
        // //         dir('ec2') {
        // //             sh 'terraform apply -input=false tfplan'
        // //         }
        // //     }
        // // }
        }
   }
