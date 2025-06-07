pipeline {
    agent {
        label 'server2'
    }
    
    environment {
        REPO_LINK = 'https://github.com/tshamsrakhmanov/jenkins_jmeter_multiple_run.git'
        REPO_BRANCH = 'main'
		REPO_FODLER = 'jenkins_jmeter_multiple_run'
    }
    
    stages {
	
        stage('step1 - copy git') {
            steps {
                git url: REPO_LINK,
				branch: REPO_BRANCH
            }
        }
		
		stage('step2 - run the script') {
            steps {

				sh 'bash test_script.sh'

            }
        }

    }

}