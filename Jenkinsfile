pipeline {
    agent any

    environment {
        registryCredentials = 'docker-hub-credentials'
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Make sure the Dockerfile is in the root directory
                    def customImage = docker.build("nodeapp", ".")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: registryCredentials, passwordVariable: 'QWEASDzx78@$', usernameVariable: 'shrutifarkya')]) {
                        docker.withRegistry('https://registry.hub.docker.com', registryCredentials) {
                            customImage.push()
                        }
                    }
                }
            }
        }

        stage('Pull and Run Docker Image') {
            steps {
                script {
                    docker.image('nodeapp').run('-p 4000:4000')
                }
            }
        }
    }
}

