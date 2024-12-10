pipeline {
    agent any
    tools {
        jdk 'jdk17'
        nodejs 'node'
        maven 'maven'
    }
    stages {
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/srikanth-girimaiahgari/DevOps.git'
            }
        }
        stage('Detect Changes') {
            steps {
                script {
                    def changedFiles = sh(
                        script: 'git diff --name-only HEAD~1 HEAD',
                        returnStdout: true
                    ).trim().split('\n')

                    // Set environment variables for detected changes
                    env.project1_CHANGED = changedFiles.any { it.startsWith('project1/') } ? 'true' : 'false'
                    env.project2_CHANGED = changedFiles.any { it.startsWith('project2/') } ? 'true' : 'false'
                }
            }
        }
        stage('Build Project1') {
            when {
                environment name: 'project1_CHANGED', value: 'true'
            }
            steps {
                sh "npm install"
                script {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                        sh 'pwd'
                        sh 'chmod +x docker_check.sh'
                        sh './docker_check.sh'
                        sh "docker build -t youtube-clone ."
                        sh "docker tag youtube-clone sr79979/youtube-clone:latest"
                        sh "docker push sr79979/youtube-clone:latest"
                        sh "docker run -d --name youtube-clone -p 3000:3000 sr79979/youtube-clone:latest"
                    }
                }
            }
        }
        stage('Build Project2') {
            when {
                environment name: 'project2_CHANGED', value: 'true'
            }
            steps {
                sh '''
                # Install Podman
                sudo apt update
                sudo apt install -y podman
                '''
                sh 'mvn clean package'
                sh 'podman build -t project2 .'
                sh "podman run -d -p 3100:8080 localhost/project2:latest"
            }
        }
    }
}