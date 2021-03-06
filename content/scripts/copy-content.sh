# CHROMIUM CONTENT LIB - contains org.chromium.content.* source code

# Make sure you setup and run ../../env.sh first

export PROJ=$ACV_HOME/content

# clean up
rm -rf $PROJ/src/org/chromium/content/*
rm -rf $PROJ/res/*

# sources for org.chromium.content
scp -r $BUILD/content/public/android/java/src/* $PROJ/src/

# copy content resources
scp -r $BUILD/content/public/android/java/res/* $PROJ/res/

# remove this file, as it is not necessary for this build and will cause compiler failure
rm $PROJ/src/org/chromium/content/common/common.aidl

# remove these template files
rm $PROJ/src/org/chromium/content/common/*.template
rm $PROJ/src/org/chromium/content/browser/*.template

# strings are generated by chromium build, not by standard android strings.xml
scp -r $BUILD/out/Release/gen/content_java/res_grit/values/* $PROJ/res/values/

# .template files for org.chromium.content generated by chromium build too
scp -r $BUILD/out/Release/gen/templates/org/chromium/content/* $PROJ/src/org/chromium/content/

# need this jar file for some com.google annotation support
scp $BUILD/out/Release/lib.java/guava_javalib.jar $PROJ/libs/
