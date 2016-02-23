echo "Build is done by now. Copying dependencies..."
mvn dependency:copy-dependencies || { echo "Error: maven dependency:copy-dependencies failed"; exit 1; }
echo "Cleaning up existing zip if any..."
rm -f libs.zip || { echo "Error: Cleaning lib zip"; exit 1; }
rm -f build.zip || { echo "Error: Cleaning binaries zip"; exit 1; }
echo "Zipping artifacts begin..."
zip libs.zip $(git ls-files -o | grep -e target/dependency/.*jar) || { echo "Error: Zipping libs failed"; exit 1; }
zip build.zip $(git ls-files -o | grep -e target/classes/.*class) || { echo "Error: Zipping binaries failed"; exit 1; }
echo "Zipping artifacts DONE!!!"
# Modified by Insights Service at 2016-02-23 18:56:22.368761
