#!/usr/bin/env bash

set -eu

VERSION=25.0.2_10

if [[ "$(id -u)" != 0 ]]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

echo "Installing OpenJDK $VERSION to $JAVA_HOME"

mkdir -p $JAVA_HOME
mkdir -p $JAVA_HOME/bin
cat >$JAVA_HOME/bin/java <<EOF
#!/usr/bin/env bash

echo "Fake OpenJDK $VERSION"
EOF
chmod 555 $JAVA_HOME/bin/java

echo "Done!"
