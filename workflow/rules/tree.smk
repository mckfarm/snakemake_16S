rule tree:
    input:
        "qiime_outputs/merged/rep_seqs_dada2.qza"
    output:
        alignment = "qiime_outputs/merged/aligned_rep_seqs_dada2.qza",
        masked_alignment = "qiime_outputs/merged/masked_aligned_rep_seqs_dada2.qza",
        tree = "qiime_outputs/merged/unrooted_tree.qza",
        rooted_tree = "qiime_outputs/merged/rooted_tree.qza"
    resources:
        time = "05:00:00",
        mem = "20gb"
    shell:
        """
        module purge all
        module load qiime2/2021.11

        qiime phylogeny align-to-tree-mafft-fasttree \
        --i-sequences {input} \
        --o-alignment {output.alignment} \
        --o-masked-alignment {output.masked_alignment} \
        --o-tree {output.tree} --o-rooted-tree {output.rooted_tree}
        """