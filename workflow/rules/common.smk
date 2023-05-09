# sample sheet 
# sample_sheet = pd.read_csv(config["sample_sheet"]).set_index("sample_name", drop=False)
# sample_sheet.index.names = ["sample_name"]

# Parse config file to determine output for rule all 
def get_rules(self):

    all_rules = []

    if config["import"]:
        all_rules.append("qiime_outputs/reads.qza")
        all_rules.append("qiime_outputs/readquality_raw.qzv")

    if config["trim"]:
        all_rules.append("qiime_outputs/reads_trimmed.qza")
        all_rules.append("qiime_outputs/readquality_trimmed.qzv")

    if config["dada2"]:
        all_rules.append("qiime_outputs/round3/rep_seqs_dada2.qza")
        all_rules.append("qiime_outputs/round3/table_dada2.qza")
        all_rules.append("qiime_outputs/round3/stats_dada2.qza")

    if config["merge"]:
        all_rules.append("qiime_outputs/merged/rep_seqs_dada2.qza")
        all_rules.append("qiime_outputs/merged/table_dada2.qza")

    if config["taxonomy"]:
        all_rules.append("qiime_outputs/merged/taxonomy.qza")
    
    if config["tree"]: 
        all_rules.append("qiime_outputs/merged/unrooted_tree.qza")
        all_rules.append("qiime_outputs/merged/rooted_tree.qza")
    
    if config["metadata"]:
        all_rules.append("qiime_outputs/round1/stats_dada2.qzv")
        all_rules.append("qiime_outputs/round2/stats_dada2.qzv")
        all_rules.append("qiime_outputs/round3/stats_dada2.qzv")

    return all_rules

