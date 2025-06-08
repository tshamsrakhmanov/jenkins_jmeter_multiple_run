pipeline {

	agent none
    
    
    environment {
        REPO_LINK = 'https://github.com/tshamsrakhmanov/jenkins_jmeter_multiple_run.git'
        REPO_BRANCH = 'main'
		REPO_FODLER = 'jenkins_jmeter_multiple_run'
    }
    
    stages {
		
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
		
		stage('SERVER2 - JMETER NODE') {
			agent { label 'server2' }
            steps {
				cleanWs()
				timeout(time: 10, unit: 'MINUTES') { 
                    git url: REPO_LINK,
					branch: REPO_BRANCH
                }
				sh 'bash prereq_checker.sh'
				sh 'bash jmeter_base.sh'
                // sh 'java -jar ~/distrib/apache-jmeter-5.6.3/bin/ApacheJMeter.jar -n -t performance_test.jmx'
				sh 'java -jar ~/distrib/apache-jmeter-5.6.3/bin/ApacheJMeter.jar -n -t performance_test.jmx -l results.jtl -r'
            }
        }
    }
}