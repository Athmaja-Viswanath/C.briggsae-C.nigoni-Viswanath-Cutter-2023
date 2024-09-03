# [**Regulatory Divergence as a Mechanism for X-Autosome Incompatibilities in _Caenorhabditis_ Nematodes**](https://academic.oup.com/gbe/article/15/4/evad055/7103311?login=false#403739588)

## Authors

**Athmaja Viswanath**  
Email: [athmaja96@gmail.com](mailto:athmaja96@gmail.com)  

**Asher Cutter**  
Email: [asher.cutter@utoronto.ca](mailto:asher.cutter@utoronto.ca)  
[Asher Cutter's Lab at the University of Toronto](https://cutter.eeb.utoronto.ca/)



## Citation
Viswanath A, Cutter AD. 2023. Regulatory Divergence as a Mechanism for X-Autosome Incompatibilities in Caenorhabditis Nematodes. Genome Biol. Evol. 15:evad055. doi: 10.1093/gbe/evad055.

## Abstract
The world's astounding biodiversity results from speciation, the process of formation of distinct species. Hybrids between species often have reduced fitness due to negative epistatic interactions between divergent genetic factors, as each lineage accumulated substitutions independently in their evolutionary history. Such negative genetic interactions can manifest as gene misexpression due to divergence in gene regulatory controls from mutations in cis-regulatory elements and trans-acting factors. Gene misexpression due to differences in regulatory controls can ultimately contribute to incompatibility within hybrids through developmental defects such as sterility and inviability. We sought to quantify the contributions of regulatory divergence to postzygotic reproductive isolation using sterile interspecies hybrids of two Caenorhabditis nematodes: Caenorhabditis briggsae and Caenorhabditis nigoni. We analyzed previous transcriptome profiles for two introgression lines with distinct homozygous X-linked fragments from C. briggsae in a C. nigoni genomic background that confers male sterility, owing to defects in spermatogenesis (Li R, et al. 2016. Specific down-regulation of spermatogenesis genes targeted by 22G RNAs in hybrid sterile males associated with an X-chromosome introgression. Genome Res. 26:1219–1232). Our analysis identified hundreds of genes that show distinct classes of nonadditive expression inheritance and regulatory divergence. We find that these nonoverlapping introgressions affect many of the same genes in the same way and demonstrate that the preponderance of transgressive gene expression is due to regulatory divergence involving compensatory and joint effects of cis- and trans-acting factors. The similar transcriptomic responses to nonoverlapping genetic perturbations of the X-chromosome implicate multiway incompatibilities as an important feature contributing to hybrid male sterility in this system.

## Repository Overview
This repository contains the code and data needed to replicate the analyses, results, and figures from Viswanath & Cutter (2023).

## Repository Structure

### 1. Input Data
- **`Cbr_fc_counts_AJ.txt`**: Read counts from aligning all samples (_C. briggsae_, _C. nigoni_, HIL1, and HIL2) to the _C. briggsae_ genome.
- **`Cni_fc_counts_AJ.txt`**: Read counts from aligning all samples (_C. briggsae_, _C. nigoni_, HIL1, and HIL2) to the _C. nigoni_ genome.
- **`orthologs_dnds2_athmaja_wb.txt`**: Contains 1:1 orthologous gene pairs between _C. briggsae_ and _C. nigoni_.

### 2. Processing
- **`DGE_Analysis.Rmd`**: RMarkdown file with code for differential gene expression analysis and categorization of genes into different inheritance and regulatory divergence categories.
- **`Preliminary_figures.Rmd`**: RMarkdown file with code for generating figures. Note that these figures were further edited using Adobe Illustrator. Only the code for data figures (Figures 2-4) is included; Figure 1 (experimental design/summary) is not provided.

### 3. Output
- Contains all the generated figures and additional files resulting from the analyses.

## Usage
1. **Download or clone the repository.**
2. **Run the RMarkdown files** (`DGE_Analysis.Rmd` and `Preliminary_figures.Rmd`) in RStudio or another R environment to reproduce the analyses and figures.
3. **Refer to the output files** for the results and figures.

