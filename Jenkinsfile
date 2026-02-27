pipeline {

    agent { label 'agent1' }
	
    tools { 
        terraform 'terraform 1.13.5'
		//ansible 'ansible'
    }
	
     environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
    }
	
    stages {
        stage('check configurations') {
            steps {
                sh 'terraform version'
				sh 'whoami'
            }
        }
		
        stage('checkout code') {
            steps {
                git branch: 'main', url: 'https://github.com/sayanti-mondal/cd-pipeline.git'
            }
        }
		
       // stage('terraform destroy') {
       //     steps {
       //         dir('terraforrm'){
       //            sh 'terraform destroy --auto-approve'
       //           }
       //        }
       //    }
   
    //     stage('initialize terraforrm') {
    //         steps {
    //             dir('terraform'){
    //               sh 'terraform init'
    //               }
    //           }
    //       }
		  
    //         stage('terraform plan') {
    //         steps {
    //             dir('terraforrm') {
    //               sh 'terraform plan -out=tfplan'
    //               //sh 'terraform show tfplan'
    //               }
    //           }
    //       }
		  
    //       stage('Manual approval') {
    //           //when {
    //           // branch 'main'
    //           // }
    //         steps {
    //               input message: "Approve infrastructure changes?", ok: "Apply"
    //               }
    //        }
		  
    //       stage('Terraform Apply') {
    //         steps {
    //             dir('terraforrm') {
    //                 sh 'terraform apply -input=false tfplan'
    //             }
    //         }
    //       }
		  
		  stage('Ansible Configure') {
			  agent {
                docker {
                  image 'ansible/ansible:latest'
                  args '-u root'
                 }
             }
			  steps {
				 dir('ansible'){
				 sh 'ansible-inventory -i "inventory/multiple_aws_ec2.yml" --graph'
				 sh 'ansible-playbook -i "inventory/multiple_aws_ec2.yml" playbooks/static_website_deployment.yml'
				  }
                }
            }
        }
   }
