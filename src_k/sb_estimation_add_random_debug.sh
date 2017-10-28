#!/bin/bash -x
#
#PJM --rsc-list "rscgrp=small"
#PJM --rsc-list "node=179"
#PJM --rsc-list "elapse=03:00:00"
#PJM --mpi "shape=1"
#PJM --mpi "proc=8"
#PJM --stg-transfiles all
#PJM --stgin "./estimate_main ./"
#PJM --stgin "./make_neuro_spawn ./"
#PJM --stgin "../hocfile_forSB/* ./"
#PJM --stgin "../hocfile_forSB/list/* ./list/"
#PJM --stgin "../hocfile_forSB/standardbrain_swcs/* ./standardbrain_swcs/"
#PJM --stgin "../hocfile_forSB/synlist.tar.gz ./"
#PJM --stgin "../data/* ./data/"
#PJM --stgin "../data/rev_potential.dat ./"
#PJM --stgin "../data/params_onlyWeight.txt ./"
#PJM --stgin "../data/conMat.txt ./"

#PJM --stgin "/home/hp120263/k01792/workspace/github/sb_estimation/hocfile_forSB/sparc64/special ./"
#PJM --stgin "/home/hp120263/k01792/neuron_kplus/stgin/* ./"

#PJM -s
#PJM -m "e"
#PJM --mail-list "fukuda@g.brain.imi.i.u-tokyo.ac.jp"
#

. /work/system/Env_base

export PARALLEL=8
export OMP_NUM_THREADS=$PARALLEL

MPIEXEC="mpiexec -mca mpi_print_stats 1"
NPROC="-n 1"
PROF=""
EXEC_FILE="./estimate_main 16 8 16 15 86"

echo "extract synlist.tar.gz"
time mpiexec -n 1 /work/system/bin/msh "/bin/tar -zxf ./synlist.tar.gz"
echo "rm synlist.tar.gz"
time mpiexec -n 1 /work/system/bin/msh "/bin/rm -f ./synlist.tar.gz"

echo "${PROF} ${MPIEXEC} ${NPROC} ${EXEC_FILE}"
time  ${PROF} ${MPIEXEC} ${NPROC} ${EXEC_FILE}

sync