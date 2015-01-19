CMAKE_BUILD_TYPE=$1
if [ "-$CMAKE_BUILD_TYPE" = "-" ]; then
    CMAKE_BUILD_TYPE=Release
fi
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

DIR_ALL=$DIR/build_all
rm -rf $DIR_ALL
mkdir -p $DIR_ALL

DIR_INCLUDE=$DIR_ALL/include
DIR_PREBUILT=$DIR_ALL/prebuilt
DIR_SCRIPTS=$DIR_ALL/scripts

LIB_NAME=libpbc.a

function build()
{
    PLATFORM=$1
    ./build_${PLATFORM}.sh $CMAKE_BUILD_TYPE
    DIR_TO=$DIR_PREBUILT/$PLATFORM
    mkdir -p $DIR_TO
    cp $DIR/build_$PLATFORM/$LIB_NAME $DIR_TO/
}

build mac
build ios

./build_android.sh $CMAKE_BUILD_TYPE
DIR_TO_ANDROID=$DIR_PREBUILT/android
function build_android()
{
    ABI=$1
    DIR_TO=$DIR_TO_ANDROID/$ABI
    mkdir -p $DIR_TO
    cp $DIR/build_android/$ABI/$LIB_NAME $DIR_TO/
}

build_android armeabi
build_android armeabi-v7a
build_android x86

cp $DIR/Android.mk $DIR_TO_ANDROID/

cd $DIR
mkdir -p $DIR_INCLUDE
find ../src/ -name '*.h' -maxdepth 1 -exec cp {} $DIR_INCLUDE/ \;
mkdir -p $DIR_SCRIPTS
cp ../binding/lua/parser.lua $DIR_SCRIPTS/
cp ../binding/lua/protobuf.lua $DIR_SCRIPTS/

rm -rf $DIR/build_mac
rm -rf $DIR/build_ios
rm -rf $DIR/build_android
