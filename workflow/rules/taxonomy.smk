rule taxonomy:
    input:
        "qiime_outputs/merged/rep_seqs_dada2.qza"
    output:
        "qiime_outputs/merged/taxonomy.qza"
    params:
        classifier_path = "/projects/p31629/midas_4.8.1_classifier.qza"
    resources:
        time = "24:00:00",
        mem = "10gb"
    shell:
        """
        module purge all
        module load qiime2/2021.11

        qiime feature-classifier classify-sklearn \
        --i-classifier {params.classifier_path} \
        --i-reads {input} \
        --o-classification {output}
        """

# rule taxonomy_viz:
#     input: 
#         "qiime_outputs/merged/taxonomy.qza"
#     output: 
#         "qiime_outputs/merged/taxonomy.qzv"
#     shell:
#         """
#         module purge all
#         module load qiime2/2021.11

#         qiime metadata tabulate --m-input-file {input} \
#         --o-visualization {output}
#         """