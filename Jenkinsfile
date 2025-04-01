pipeline{
    
    agent any
    
    stages{
        
        stage('Build'){
            steps{
                echo "Building the war"
            }
        }
        
        stage("Deploy to QA"){
            steps{
                echo "Deploying to QA"
            }
        }
        
        stage('Checkout'){
            steps{
                git url: 'https://github.com/bnchakri38/PostmanAPICollections'
            }
        }
        
        stage('Pull Docker Image'){
            steps{
                echo "Pulling GoRest DataDriven Docker Image"
                bat 'docker pull chakri38/gorestapidd:1.0'
            }
        }
        
        stage("Run API Test Cases"){
            steps{
                echo "Running GoRestAPIDataDriven TestCases"
                bat "docker run -v %CD%/newman:/app/results chakri38/gorestapidd:1.0"
            }
        }

        stage('Publish HTML Extra Reports'){
            steps{
                publishHTML([
                    allowMissing: false,
                    alwaysLinkToLastBuild: false,
                    keepAll: true,
                    reportDir: 'newman',
                    reportFiles: 'gorest.html',
                    reportName: 'Newman HTML Extra API Report',
                    reportTitles: ''
                ])
            }
        }
        
        stage("Deploy to Prod"){
            steps{
                echo "Deploying to Prod"
            }
        }
        
    }
}
