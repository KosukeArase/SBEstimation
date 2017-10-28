#!/bin/bash -x
#
#PJM --rsc-list "rscgrp=small"
#PJM --rsc-list "node=25"
#PJM --rsc-list "elapse=00:15:00"
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

#PJM --stgin "/home/hp160269/k03367/sb_estimation/hocfile_forSB/sparc64/special ./"
#PJM --stgin "/home/hp160269/k03367/neuron_kplus_cma/stgin/* ./"

#PJM -s
#

. /work/system/Env_base

export PARALLEL=8
export OMP_NUM_THREADS=$PARALLEL

MPIEXEC="mpiexec -mca mpi_print_stats 1"
NPROC="-n 1"
PROF=""
EXEC_FILE="./estimate_main 2 1 2 3 86"

mpiexec -n 1 /work/system/bin/msh "/bin/tar -zxf ./synlist.tar.gz"
mpiexec -n 1 /work/system/bin/msh "/bin/rm -f ./synlist.tar.gz"

echo "${PROF} ${MPIEXEC} ${NPROC} ${EXEC_FILE}"
time  ${PROF} ${MPIEXEC} ${NPROC} ${EXEC_FILE}

sync