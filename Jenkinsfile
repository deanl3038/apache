pipeline {
	agent any
	stages {
		stage('Delete the workspace') {
			steps {
				sh "sudo rm -rf $WORKSPACE/*"
			}
		}
		stage('Installing ChefDK') {
			steps {
				script {
					def exists = fileExists '/usr/bin/chef-client'
					if (exists) {
						echo "Skipping ChefDK install - Already Installed"
					} else {

					echo "Install ChefDK"
					sh 'export CHEF_LICENSE=accept'
					sh 'sudo apt-get install -y wget'
					sh 'wget https://packages.chef.io/files/stable/chefdk/3.8.14/ubuntu/16.04/chefdk_3.8.14-1_amd64.deb'
					sh 'sudo dpkg -i chefdk_3.8.14-1_amd64.deb'
					}
				}	
			}
		}
		stage('Third Stage') {
			steps {
				git credentialsId: 'git-repo-creds', url: 'git@github.com:deanl3038/apache.git'
				
			}
		}
		stage ('Install Kitchen Docker Gem') {
			steps {
				sh 'chef gem install kitchen-docker'
				}
		}
		stage ('Run test kitchensh') {
                        steps {
                                sh 'sudo kitchen test'
                                }
                }
	}
}
