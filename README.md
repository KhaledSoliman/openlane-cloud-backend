# Backend

## Prerequistes
- nodejs v12+ & npm (https://github.com/nvm-sh/nvm#installing-and-updating)
- openlane (http://openlane.io)
- docker (https://docs.docker.com/desktop/#download-and-install)
- git (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- gcp account and firebase project

## Installation & Setup
- Clone the repo
- Run the following command in the root directory:
`npm install --save`
- Retrieve your service account json file from firebase and add it to root directory
- Change the GOOGLE_APPLICATION_CREDENTIALS path in the .env to match the service account json file
- Run the openlane-git.sh to install openlane


