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
                sh "mvn clean package -DskipTests"
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
                sh "docker push christophecheret/tomcathelloworld:0.1"
            }
    }
        stage('Ansible playbook') {
            steps {
               //ansiblePlaybook credentialsId: 'ac56aa1a-89f1-475a-b2b5-bae2ef84e72c', installation: 'ansible', inventory: 'Inventory.txt', playbook: 'DeployHello.yml'
               //ansiblePlaybook become: true, credentialsId: 'paraPW', installation: 'ansible', inventory: 'Inventory.txt', playbook: 'DeployHello.yml'
                //ansiblePlaybook become: true, colorized: true, credentialsId: 'AnsibleSSH', installation: 'ansible', inventory: 'Inventory.txt', playbook: 'DeployHello.yml', sudoUser: null
                ansiblePlaybook become: true, credentialsId: 'paraPW', disableHostKeyChecking: true, installation: 'ansible', inventory: 'Inventory.txt', playbook: 'DeployHello.yml'
            }
    }

}
}