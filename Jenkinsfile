pipeline {
    agent any 
    stages {
        stage('Static Analysis') {
            steps {
                echo 'Run the static analysis to the code' 
            }
        }
        stage('Compile') {
            steps {
                echo 'Compile the source code'
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Build docker image') {
            steps {
                echo 'Build docker image'
                sh "docker build -t christophecheret/tomcathelloworld:0.1 ."
            }
    }
        stage('Push docker image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'dockerPass', usernameVariable: 'dockerUser')]) {
                sh "docker login -u christophecheret -p ${dockerPass}"
            }
                
                sh "docker push christopchecheret/tomcathelloworld:0.1 ."
            }
    }
}
}