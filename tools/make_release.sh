
# Stop and exit on error
set -e

VERSION="1.3.0"

cd ..
sed 's/$VERSION/'$VERSION'/g' tools/README.template.md > README.md

# Generate documentation
dub --build=docs
mkdir docs/$VERSION
mv docs/weather_forecast.html docs/$VERSION/index.html
git add docs/$VERSION/

# Create release
git commit -a -m "Release $VERSION"
git push

# Create and push tag
git tag v$VERSION -m "Release $VERSION"
git push --tags
