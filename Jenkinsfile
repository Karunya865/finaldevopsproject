pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'karunya08/finaldevopsproject'
    }

    stages {
        stage('Build with Maven') {
            steps {
                script {
                    docker.image('maven:latest').inside("-v ${env.WORKSPACE}/.m2:/home/jenkins/.m2") {
                        // Use a writable local repo path
                        sh 'mvn -T 4 -Dmaven.repo.local=/home/jenkins/.m2/repository clean install'
                    }
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}
