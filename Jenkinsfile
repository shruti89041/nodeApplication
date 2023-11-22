pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    git 'https://github.com/shruti89041/nodeApplication.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('nodeapp')
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image('nodeapp').push()
                    }
                }
            }
        }

        stage('Pull and Run Docker Image') {
            steps {
                script {
                    docker.image('nodeapp').withRun('-p 4000:4000')
                }
            }
        }
    }
}
