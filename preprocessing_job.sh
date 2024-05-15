#$ -pe smp 8            # Number of cores.
#$ -l h_vmem=11G        # Memory per core (max 11G per GPU).
#$ -l h_rt=1:0:0        # Requested runtime.
#$ -cwd                 # Change to current directory.
#$ -j y                 # Join output and error files.
#$ -o outputs/          # Change default output directory.
#$ -m bea               # Email beginning, end, and aborted.

module load anaconda3
conda activate nn_UNet
cd /data/home/exx851/nnUNetTraining/nnUNet

export nnUNet_raw="/data/scratch/exx851/nnUNetData/nnUNet_raw"
export nnUNet_preprocessed="/data/scratch/exx851/nnUNetData/nnUNet_preprocessed"
export nnUNet_results="/data/scratch/exx851/nnUNetData/nnUNet_results"

nnUNetv2_plan_and_preprocess -d 11 --verify_dataset_integrity