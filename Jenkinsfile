pipeline {
    agent {
        label 'docker'
        dockerfile true
    }
    
    stages {
        stage('test') {
            steps {
                sh '''
                echo Hello, World
                '''
            }
        }
    }
}
