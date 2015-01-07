DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_TO=$DIR/build_mac
rm -rf $DIR_TO
mkdir -p $DIR_TO
cd $DIR_TO && cd $_
cmake ../..
make
