#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_pop.sh"

#==================================
# Print Section Title
#==================================
print_section "Create Micromamba environment"

mamba_env_install "python enviroment" "py" "python pandas jupyterlab polars numpy \
matplotlib seaborn scikit-learn"
mamba_env_install "r enviroment" "r" "r-tidyverse radian r-ggpubr r-ggsci r-vegan rstudio-desktop \
r-targets r-tarchetypes r-visnetwork r-future r-rstatix r-sjmisc r-ggnetwork r-ggraph r-ggvenndiagram \
bioconductor-phyloseq bioconductor-microbiome bioconductor-ggtree bioconductor-ropls \
bioconductor-deseq2 bioconductor-maaslin2  bioconductor-complexheatmap bioconductor-limma"