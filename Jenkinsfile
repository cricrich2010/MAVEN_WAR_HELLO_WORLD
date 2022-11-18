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
                echo 'Compile the source code'
                sh "docker build -t tomcatHelloworld:0.1 ."
            }
    }
}
}