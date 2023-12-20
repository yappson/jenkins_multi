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
