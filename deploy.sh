#!/bin/bash
    echo hi123
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u karunya08 -p karu@2005
    docker tag test karunya08/finaldevopsproject
    docker push karunya08/finaldevopsproject
    
