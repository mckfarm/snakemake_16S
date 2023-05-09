# manually change p trunc lengths based on read quality visualization from trim step
# using median quality of 20
rule dada2:
    input:
        "qiime_outputs/reads_trimmed.qza"
    output:
        seqs = "qiime_outputs/round3/rep_seqs_dada2.qza",
        table = "qiime_outputs/round3/table_dada2.qza",
        stats = "qiime_outputs/round3/stats_dada2.qza"
    resources:
        time = "12:00:00",
        mem = "20gb"
    shell:
        """
        module purge all
        module load qiime2/2021.11

        qiime dada2 denoise-paired --verbose \
        --i-demultiplexed-seqs {input} \
        --p-trunc-len-f 240 --p-trunc-len-r 240 \
        --o-representative-sequences {output.seqs} \
        --o-table {output.table} \
        --o-denoising-stats {output.stats}
        
        """