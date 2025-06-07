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
				timeout(time: 10, unit: 'MINUTES') { 
                    git url: REPO_LINK,
					branch: REPO_BRANCH
                }
            }
        }
		
		stage('step2 - run script 1 - make file and write date') {
            steps {
				timeout(time: 10, unit: 'MINUTES') {
				sh 'bash test_script.sh'
				}
            }
        }
		
		stage('step3 - run script 2 - read file with the date') {
            steps {
				timeout(time: 10, unit: 'MINUTES') {
				sh 'bash test_script_2.sh'
				}
            }
        }

    }

}