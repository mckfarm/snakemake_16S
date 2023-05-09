rule metadata_stats:
    input:
        round1 = "qiime_outputs/round1/stats_dada2.qza",
        round2 = "qiime_outputs/round2/stats_dada2.qza",
        round3 = "qiime_outputs/round3/stats_dada2.qza"
    output:
        round1 = "qiime_outputs/round1/stats_dada2.qzv",
        round2 = "qiime_outputs/round2/stats_dada2.qzv",
        round3 = "qiime_outputs/round3/stats_dada2.qzv"
    shell:
        """
        module purge all
        module load qiime2/2021.11

        qiime metadata tabulate \
        --m-input-file {input.round1} \
        --o-visualization {output.round1}

        qiime metadata tabulate \
        --m-input-file {input.round2} \
        --o-visualization {output.round2}

        qiime metadata tabulate \
        --m-input-file {input.round3} \
        --o-visualization {output.round3}


        """