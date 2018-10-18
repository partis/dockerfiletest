#!/usr/bin/env groovy

// GLOBAL PROPERTIES
String  VERSION = "" // e.g. 1.1.1
String  RELEASE      = "" // e.g. 1.1
Boolean VERIFY       = false
Boolean REBUILD      = false
Boolean PUBLISH      = false
String  BRANCH       = env.BRANCH_NAME // Special Multi-Branch variable

String CHECKOUT_BRANCH  = "*/"+BRANCH
String CHECKOUT_REFSPEC = "refs/heads/"+BRANCH

pipeline {
    agent {
        dockerfile {
            label 'docker'
        }
    }
    parameters {
        booleanParam(name: 'PUBLISH', defaultValue: false, description: 'Whether to build and publish artifacts')
        booleanParam(name: 'REBUILD', defaultValue: false, description: 'To rebuild an old Version, put the version number in the branch varaible')
        choice(name: 'VERSION_UPDATE', choices: "DOT\nMINOR\nMAJOR", description: 'Choose the type of version update')
        string(name: 'TAG', defaultValue: "1.0.1", description: 'Tag to build (If REBUILD Ticked)')
    }
    
    stages {
        stage("Get Version"){
            steps { script {
                println "UPDATE_VERSION: ${VERSION_UPDATE}"
                if(BRANCH.equals("master")){
                    OLD_RELEASE = sh(script: 'git branch -r | sed -n "s# *origin/\\(archive/\\)*R##p" | sort -V | tail -1', returnStdout: true).trim()
                    if(OLD_RELEASE.equals('')){
                        RELEASE = "1.0"
                    }else{
                        String[] versions = OLD_RELEASE.split('\\.')
                        RELEASE = versions[0]+"."+(Integer.parseInt(versions[1])+1)
                    }
                }else if(BRANCH.matches(/R[0-9]*\.[0-9]*/)){
                    RELEASE = BRANCH.replace('R', '')
                }else{
                    OLD_RELEASE = sh(script: 'git branch -r | sed -n "s# *origin/\\(archive/\\)*R##p" | sort -V | tail -1', returnStdout: true).trim()
                    if(OLD_RELEASE.equals('')){
                        RELEASE = "1.0.0-SNAPSHOT"
                    }else{
                        String[] versions = OLD_RELEASE.split('\\.')
                        RELEASE = versions[0]+"."+(Integer.parseInt(versions[1])+1) + "-SNAPSHOT"
                    }
                }
                println "RELEASE: ${RELEASE}"
                OLD_VERSION = sh(script: """git tag | grep "^${RELEASE}.[0-9]*\$" | sort -V | tail -1 | cat""", returnStdout: true).trim()
                println "OLD_VERSION: ${OLD_VERSION}"
                if(OLD_VERSION.equals('')){
                    VERSION = "${RELEASE}.0"
                }else{
                    PATCH = OLD_VERSION.split('\\.')[2]
                    VERSION = "${RELEASE}."+(Integer.parseInt(PATCH)+1)
                }
                println "Using VERSION: ${VERSION}"
                currentBuild.displayName = currentBuild.displayName+": "+VERSION
            }}
        }
        stage('test') {
            steps {
                sh '''
                echo Hello, World
                '''
            }
        }
        stage('java version') {
            steps {
                sh '''
                java -version
                '''
            }
        }
    }
}
