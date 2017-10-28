#!/bin/bash -x
#
#PJM --rsc-list "rscgrp=huge"
#PJM --rsc-list "node=67585"
#PJM --rsc-list "elapse=01:00:00"
#PJM --mpi "shape=1"
#PJM --mpi "proc=8"
#PJM --stg-transfiles all
#PJM --stgin "./estimate_main ./"
#PJM --stgin "./make_neuro_spawn ./"
#PJM --stgin "../hocfile_test/* ./"
#PJM --stgin "../data/* ./data/"
#PJM --stgin "../data/rev_potential.dat ./"
#PJM --stgin "../data/params.txt ./"

#PJM --stgin "/home/hp120263/k01792/neuron_kplus/specials/sparc64/special ./"
#PJM --stgin "/home/hp120263/k01792/neuron_kplus/stgin/* ./"

#PJM --stgout "./lmcma_scaling_stdout.0 ./huge_out_files/%j/"
#PJM --stgout "./lmcma_scaling_errfile.0 ./huge_out_files/%j/"
#PJM --stgout "./lmcma_scaling_stdout.0@* ./huge_out_files/%j/"
#PJM --stgout "./lmcma_scaling_errfile.0@* ./huge_out_files/%j/"

#PJM -s
#PJM -m "e"
#PJM --mail-list "fukuda@g.brain.imi.i.u-tokyo.ac.jp"
#

. /work/system/Env_base

export PARALLEL=8
export OMP_NUM_THREADS=$PARALLEL

MPIEXEC="mpiexec -ofout-proc lmcma_scaling_stdout -oferr-proc lmcma_scaling_errfile -mca mpi_print_stats 1"
NPROC="-n 1"
PROF=""
EXEC_FILE="./estimate_main 16384 2048 16384 30 32"
echo "${PROF} ${MPIEXEC} ${NPROC} ${EXEC_FILE}"
time  ${PROF} ${MPIEXEC} ${NPROC} ${EXEC_FILE}

sync