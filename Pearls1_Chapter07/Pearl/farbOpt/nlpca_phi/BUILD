. ./common.sh

FLAGS="-D$ACTIVATION -std=c99 -O3 -openmp "
FLAGS+=$MAX_RUN
INC=$NLOPT_DIR/include
LIB=$NLOPT_DIR/lib

icc $FLAGS genData.c -o gen_$APP

icc $FLAGS -Wno-unknown-pragmas -xhost ../train.c -I . -I $INC  -L $LIB -lnlopt -lm -o train_$APP.off

icc $FLAGS -Wno-unknown-pragmas -no-offload ../train.c -I . -I $INC \
				-L $LIB -lnlopt -lm -o train_$APP.omp

icc $FLAGS -Wno-unknown-pragmas -no-offload ../pred.c -I . -lm -o pred_$APP

FLAGS+=" -mmic -Wno-unknown-pragmas"
NLOPT_DIR+="_native"
INC=$NLOPT_DIR/include
LIB=$NLOPT_DIR/lib

icc $FLAGS ../train.c -I . -I $INC -L $LIB -lnlopt -lm -o train_$APP.mic

