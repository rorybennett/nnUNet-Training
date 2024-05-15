#$ -pe smp 8            # Number of cores.
#$ -l h_vmem=11G        # Memory per core (max 11G per GPU).
#$ -l h_rt=240:0:0        # Requested runtime.
#$ -cwd                 # Change to current directory.
#$ -j y                 # Join output and error files.
#$ -o outputs/          # Change default output directory.
#$ -l gpu=1             # Request GPU usage.
#$ -t 1-5               # Array job.
#$ -tc 5                # Concurrent jobs.
#$ -m bea               # Email beginning, end, and aborted.

module load anaconda3
conda activate nn_UNet
cd /data/home/exx851/nnUNetTraining/nnUNet

export nnUNet_raw="/data/scratch/exx851/nnUNetData/nnUNet_raw"
export nnUNet_preprocessed="/data/scratch/exx851/nnUNetData/nnUNet_preprocessed"
export nnUNet_results="/data/scratch/exx851/nnUNetData/nnUNet_results"

nnUNetv2_train 011 "2d" $((SGE_TASK_ID - 1)) -tr "nnUNetTrainer_onlyMirror01" --c --npz