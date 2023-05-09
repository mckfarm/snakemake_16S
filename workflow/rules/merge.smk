# merge tables from multiple sequencing runs
rule merge_tables:
    input:
        round1 = "qiime_outputs/round1/table_dada2.qza",
        round2 = "qiime_outputs/round2/table_dada2.qza",
        round3 = "qiime_outputs/round3/table_dada2.qza"
    output:
        "qiime_outputs/merged/table_dada2.qza"
    shell:
        """
        module purge all
        module load qiime2/2021.11

        qiime feature-table merge \
        --i-tables {input.round1} {input.round2} {input.round3} \
        --o-merged-table {output}
        
        """

# merge seqs from multiple runs
rule merge_seqs:
    input:
        round1 = "qiime_outputs/round1/rep_seqs_dada2.qza",
        round2 = "qiime_outputs/round2/rep_seqs_dada2.qza",
        round3 = "qiime_outputs/round3/rep_seqs_dada2.qza"
    output:
        "qiime_outputs/merged/rep_seqs_dada2.qza"
    shell:
        """
        module purge all
        module load qiime2/2021.11

        qiime feature-table merge-seqs \
        --i-data {input.round1} {input.round2} {input.round3} \
        --o-merged-data {output}
        
        """