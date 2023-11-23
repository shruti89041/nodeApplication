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

                    // Save the customImage variable for later stages
                    env.CUSTOM_IMAGE = customImage.imageName()
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: registryCredentials, passwordVariable: 'QWEASDzx78@$', usernameVariable: 'shrutifarkya')]) {
                        docker.withRegistry('https://hub.docker.com/repository/docker/shrutifarkya/nodeapp/general', registryCredentials) {
                            // Use the CUSTOM_IMAGE environment variable saved in the Build Docker Image stage
                            docker.image(env.CUSTOM_IMAGE).push()
                        }
                    }
                }
            }
        }

        stage('Pull and Run Docker Image') {
            steps {
                script {
                    // Use the CUSTOM_IMAGE environment variable saved in the Build Docker Image stage
                    docker.image(env.CUSTOM_IMAGE).run('-p 4000:4000')
                }
            }
        }
    }
}

