pipeline {

	agent none
    
    
    environment {
        REPO_LINK = 'https://github.com/tshamsrakhmanov/jenkins_jmeter_multiple_run.git'
        REPO_BRANCH = 'main'
		REPO_FODLER = 'jenkins_jmeter_multiple_run'
    }
    
    stages {
		
		// stage('SERVER3 - JMETER NODE1 - SCRIPT') {
			// agent { label 'server3' }
            // steps {
				// cleanWs()
				// timeout(time: 10, unit: 'MINUTES') { 
                    // git url: REPO_LINK,
					// branch: REPO_BRANCH
                // }
				// sh 'bash prereq_checker.sh'
				// sh 'bash jmeter_node.sh'
            // }
        // }
		
		// stage('SERVER4 - JMETER NODE2 - SCRIPT') {
			// agent { label 'server4' }
            // steps {
				// cleanWs()
				// timeout(time: 10, unit: 'MINUTES') { 
                    // git url: REPO_LINK,
					// branch: REPO_BRANCH
                // }
				// sh 'bash prereq_checker.sh'
				// sh 'bash jmeter_node.sh'
            // }
        // }
		
		stage('SERVER5 - STUB HOST - SCRIPT') {
			agent { label 'server5' }
            steps {
				cleanWs()
				timeout(time: 10, unit: 'MINUTES') { 
                    git url: REPO_LINK,
					branch: REPO_BRANCH
                }
				sh 'bash prereq_checker.sh'
				sh 'bash script_stub_host.sh'
            }
        }
		
		stage('SERVER2 - JMETER HEAD - SCRIPT') {
			agent { label 'server2' }
            steps {
				cleanWs()
				timeout(time: 10, unit: 'MINUTES') { 
                    git url: REPO_LINK,
					branch: REPO_BRANCH
                }
				sh 'bash prereq_checker.sh'
				sh 'bash jmeter_base.sh'
				timeout(time: 1, unit: 'MINUTES') { 
                    sh 'jmeter -n -t performance_test.jmx'
                }
            }
        }
    }
}