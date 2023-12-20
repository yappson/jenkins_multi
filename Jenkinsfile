pipeline {
    agent any

    tools {
        // Install the Maven version configured as "Jenkins-maven" and add it to the path.
        maven "Jenkins-maven"
    }

    stages {
        stage('git') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/yappson/jenkins_multi.git'
            }
        }

        stage('Build') {
            steps {
                // Run Maven build
                bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }

        stage('Deployment') {
            steps {
                // Deploy to Tomcat using the Tomcat Deploy plugin
                deploy adapters: [tomcat9(credentialsId: 'f9a173d1-f0d7-4723-8812-b16d93f458f0', path: '', url: 'http://localhost:8080/')], contextPath: 'pipline_test', onFailure: false, war: '**/*.war'
            }
        }
    }

    post {
        success {
            // Actions to perform when the build succeeds
            echo 'Build and deployment successful!'
        }

        failure {
            // Actions to perform when the build fails
            echo 'Build or deployment failed!'
        }
    }
}
