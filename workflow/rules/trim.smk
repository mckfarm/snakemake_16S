rule trim:
    input:
        "qiime_outputs/reads.qza"
    output:
        "qiime_outputs/reads_trimmed.qza"
    shell:
        """
        module purge all
        module load qiime2/2021.11

        qiime cutadapt trim-paired --i-demultiplexed-sequences {input}  \
        --p-front-f GTGYCAGCMGCCGCGGTAA \
        --p-front-r CCGYCAATTYMTTTRAGTTT \
        --p-error-rate 0.1 \
        --p-overlap 3 \
        --o-trimmed-sequences {output}
        """


rule read_viz_trimmed:
    input:
        "qiime_outputs/reads_trimmed.qza"
    output: 
        "qiime_outputs/readquality_trimmed.qzv"
    shell:
        """
        module purge all
        module load qiime2/2021.11

        qiime demux summarize --i-data {input}  \
        --o-visualization {output}
        """