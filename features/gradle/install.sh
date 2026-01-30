#!/usr/bin/env bash

set -eu

VERSION=9.3.1

if [[ "$(id -u)" != 0 ]]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

echo "Installing Gradle $VERSION to $GRADLE_HOME"

mkdir -p $GRADLE_HOME/bin
cat >$GRADLE_HOME/bin/gradle <<EOF
#!/usr/bin/env bash

echo "Fake Gradle $VERSION"
EOF
chmod 555 $GRADLE_HOME/bin/gradle

echo "Done!"
