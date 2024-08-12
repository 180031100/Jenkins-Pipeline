pipeline{
    agent any
    
    stages{
        stage("Code Checkout"){
            steps{
                git branch: 'main', url: 'https://github.com/NagendraMotamarri/Docker_Project1.git'
            }
        }
        stage("Image build"){
            steps{
                sh 'docker image build -t nagendramotamarri14/docker_project1:v$BUILD_ID .'
                sh 'docker image tag nagendramotamarri14/docker_project1:v$BUILD_ID nagendramotamarri14/docker_project1:latest'
            }
        }
        stage("Image Push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    sh "docker login -u ${user} -p ${pass}"
                    sh 'docker image push nagendramotamarri14/docker_project1:v$BUILD_ID'
                    sh 'docker image push nagendramotamarri14/docker_project1:latest'
                    sh 'docker image rmi nagendramotamarri14/docker_project1:v$BUILD_ID'
                }
            }
        }
        stage("Container Build"){
            steps{
                sh 'docker run -itd --name DockerProject1 -p 3000:3000 nagendramotamarri14/docker_project1:latest'
            }
        }
    }
}