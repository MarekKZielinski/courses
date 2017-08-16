mkdir ./data/dogscats/valid
mkdir ./data/dogscats/valid/cat
mkdir ./data/dogscats/valid/dog
mkdir ./data/dogscats/train/cat
mkdir ./data/dogscats/train/dog
mkdir ./data/dogscats/test
mkdir ./data/dogscats/test/unknown
mkdir ./data/dogscats/sample
mkdir ./data/dogscats/sample/train
mkdir ./data/dogscats/sample/train/cat
mkdir ./data/dogscats/sample/train/dog
mkdir ./data/dogscats/sample/valid
mkdir ./data/dogscats/sample/valid/cat
mkdir ./data/dogscats/sample/valid/dog
mkdir ./data/dogscats/sample/test
mkdir ./data/dogscats/sample/test/unknown

mmv ./data/dogscats/train/"cat*.jpg" ./data/dogscats/train/cat/"cat#1.jpg"
mmv ./data/dogscats/train/"dog*.jpg" ./data/dogscats/train/dog/"dog#1.jpg"
mmv ./data/dogscats/test/"*.jpg" ./data/dogscats/test/unknown/"#1.jpg"

find ./data/dogscats/train/cat | shuf -n 1000 | xargs  mv -t ./data/dogscats/valid/cat
find ./data/dogscats/train/dog | shuf -n 1000 | xargs  mv -t ./data/dogscats/valid/dog

find ./data/dogscats/train/cat | shuf -n 200 | xargs -I{}  cp {} ./data/dogscats/sample/train/cat
find ./data/dogscats/train/dog | shuf -n 200 | xargs -I{} cp {} ./data/dogscats/sample/train/dog
find ./data/dogscats/train/cat | shuf -n 40 | xargs -I{} cp {} ./data/dogscats/sample/valid/cat
find ./data/dogscats/train/dog | shuf -n 40 | xargs -I{} cp {} ./data/dogscats/sample/valid/dog

find ./data/dogscats/test | shuf -n 200 | xargs -I{} cp {} ./data/dogscats/sample/test/unknown

