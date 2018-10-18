pipeline {
    agent {
        dockerfile {
            label 'docker'
        }
    }
    
    stages {
        stage('test') {
            steps {
                sh '''
                echo Hello, World
                '''
            }
        }
        stage('java version') {
            steps {
                sh '''
                java -version
                '''
            }
        }
    }
}
