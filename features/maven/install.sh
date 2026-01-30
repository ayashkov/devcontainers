#!/usr/bin/env bash

set -eu

VERSION=3.9.12

if [[ "$(id -u)" != 0 ]]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

echo "Installing Maven $VERSION to $MAVEN_HOME"

mkdir -p $MAVEN_HOME
mkdir -p $MAVEN_HOME/bin
cat >$MAVEN_HOME/bin/mvn <<EOF
#!/usr/bin/env bash

echo "Fake Maven $VERSION"
EOF
chmod 555 $MAVEN_HOME/bin/mvn

echo "Done!"
