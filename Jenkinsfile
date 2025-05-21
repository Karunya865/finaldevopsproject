pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'karunya08/finaldevopsproject'
    }

    stages {
        // Maven Build Stage inside Docker
        stage('Build with Maven') {
            steps {
                script {
                    docker.image('maven:latest').inside("-v ${env.WORKSPACE}/.m2:/root/.m2") {
                        // Set local repo explicitly to avoid permission issues
                        sh 'mvn -T 4 -Dmaven.repo.local=/root/.m2/repository clean install'
                    }
                }
            }
        }

        // Docker Image Creation & Push
        stage('Build and Push Docker Image') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}
