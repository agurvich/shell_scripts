#!/bin/sh 
#SBATCH -J nH10_L45_Z1    # Job name
#SBATCH -o log_nH10_L45_Z1.out%j     # Name of stdout output file(%j expands to jobId)
#SBATCH -e log_nH10_L45_Z1.err%j     # Name of stderr output file(%j expands to jobId)
#SBATCH -p normal                 # Submit to the 'normal' or 'development' queue
#SBATCH -N 24                       # Total number of nodes requested (16 cores/node)
#SBATCH -n 24                       # Total number of mpi tasks requested
#SBATCH -t 48:00:00               # Run time (hh:mm:ss)
#SBATCH -A TG-AST160059           # Allocation name to charge job against

# Set the number of threads per task(Default=1)
export OMP_NUM_THREADS=16 

# Run the hybrid application
ibrun tacc_affinity $HOME/gizmo_outflows/gizmo_outflow_chimes_zoom_omp16.cpu run_nH10_L45_Z1.param 
