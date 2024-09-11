#!/bin/bash

#SBATCH -p compute                 #specify partition
#SBATCH --nodes=2                     # Number of nodes
#SBATCH --ntasks-per-node=4           # Number of tasks per node
#SBATCH --cpus-per-task=1             # Number of CPU cores per task
#SBATCH -t 0:01:00                 #job time limit <hr:min:sec>
#SBATCH -J hoomd-profiling                #job name
#SBATCH -A lt200291                #specify your account ID

module restore
module load OpenMPI

source /home/trochana/local/env/hoomd-venv/bin/activate

export PYTHONPATH=/home/trochana/local/env/hoomd-venv/lib/python3.12/site-packages:$PYTHONPATH
cd /home/trochana/hoomd-benchmarks/run/profiling/hoomd-profiling

mpirun -np 8 -x PATH -x LD_LIBRARY_PATH ./trace.sh ./pi
