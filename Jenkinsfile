pipeline {
    agent any

    environment {
        TF_VAR_key_name = 'my-key'
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                // Specify the source code to check out
                git branch: 'main',
                url: 'https://github.com/amen123456/Terraform-EC2.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Run Terraform plan to show the execution plan
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform plan
                    sh 'terraform apply -input=false tfplan'
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Optional: Clean up workspace if needed
                    deleteDir()
                }
            }
        }
    }

    post {
        always {
            // Cleanup actions or notifications can be added here
            cleanWs()
        }
        success {
            echo 'Terraform applied successfully!'
        }
        failure {
            echo 'Terraform apply failed.'
        }
    }
}
