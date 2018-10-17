pipeline {
    agent {
        label 'local'
        
    }
    docker {
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
