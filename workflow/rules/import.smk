rule import:
    input: 
        "data/manifest_r3.csv"
    output: 
        "qiime_outputs/reads.qza"
    shell:
        """
        module purge all
        module load qiime2/2021.11

        qiime tools import --input-path {input} \
        --input-format PairedEndFastqManifestPhred33 \
        --output-path {output} \
        --type SampleData[PairedEndSequencesWithQuality]
        """
        
rule read_viz_raw:
    input:
        "qiime_outputs/reads.qza"
    output: 
        "qiime_outputs/readquality_raw.qzv"
    shell:
        """
        module purge all
        module load qiime2/2021.11
        
        qiime demux summarize --i-data {input}  \
        --o-visualization {output}
        """
