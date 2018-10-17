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
    }
}
