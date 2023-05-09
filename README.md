# 16S Snakemake workflow

This is my Snakemake workflow for 16S amplicon sequencing runs. Using a Snakemake workflow helps increase reproducibility and access across different computers. These commands can also be broken out into separate bash scripts, but using a Snakemake workflow can provide some level of automation that can be difficult to achieve with the SLURM scheduler, particularly with outputs are used as an input for another script.

## Notes

### QIIME version info
This Snakemake uses Qiime version 2021.11 installed on Quest HPC as a module. 

### Single vs multiple run
This workflow can be used for single or multiple sequencing runs. Currently this is not automated - inputs and outputs of the rule files need to be changed accordingly depending on how the reads and sequencing runs are structured. This example workflow is based on 16S data collected over 3 separate sequencing runs. If used for multiple sequencing runs, the workflow should be run separately on the number of runs until the dada2 step is complete. After this is done for all runs, the merge rule and subsequent actions can be run on the combined tables and sequences. 

I think I could convert this to a more automated system if I used the wildcard system from Snakemake, where each sample is the name of the entire sequencing round - maybe do this when I use it for my CANDO+P data

If this is used for a single sequencing run, the merge rule can be turned off and the Snakemake workflow can be run as a continuous operation rather than waiting for the dada2 step to complete.


### To do list
- sample sheet for automating across sequencing runs
- automatically make manifest file across multiple sequencing runs - could probably do with a python script as the first step of the snakemake
- 