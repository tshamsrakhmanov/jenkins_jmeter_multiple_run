pipeline {
    agent {
        label 'server2'  // Targets a specific agent
        // or use 'any' to run on any available agent
    }
    
    environment {
        TEST_VALUE_1 = '1'
        TEST_VALUE_2 = '2'
    }
    
    stages {
	
        stage('step1 - copy git') {
            steps {
                git url: 'https://github.com/tshamsrakhmanov/jenkins_jmeter_multiple_run.git',
				branch: 'your-branch-name'
            }
        }
		
		stage('step2 - run the script') {
            steps {
                sh test_script.sh
            }
        }

    }

}