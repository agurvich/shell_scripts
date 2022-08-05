here=`pwd`
REPONAME=`basename $here`
TOKEN=$HOME/.github.token
TOKEN=`cat $TOKEN`

## create a new remote repository
curl -u ${USER}:${TOKEN} https://api.github.com/user/repos -d "{\"name\": \"${REPONAME}\""
