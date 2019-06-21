This is a series of jupyter notebooks that takes Transposable Elements (TEs) sequences from different sources in .fasta format, classifies and annotates them accordingly and prepare the data for a genome-wide identification. Final result is a gff file containing all TEs and the according identification.


```
#Recommended. Create a virtual environment using python3 and venv
virtualenv --python=python3 venv
#Activate venv
source venv/bin/activate
#make sure the python3 used is in the venv
which python            
#(...)TE_Discovery/venv/bin/python
#Install requirements
pip install -r requirements.txt 
#run jupyter lab
jupyter lab
```

This will start a jupyter lab in your browser. You can start running notebooks in order. Notice that for some of them, special configuration will be required.

#### 1.1_add_annotation.ipynb
Information about paths for each TE type  has to be set in  _paths_fasta_ dictionary. 

#### 2.1_vsearch.sh
Run vsearch for each TE type 

#### 2.2_vsearch_merge.ipynb
Takes one TE from each cluster and create one .fasta file for each TE type 

#### 3.1_blast.sh
Search all sequences against the full genome

#### 3.2_blast_filter.ipynb
Filter the blast results according to user-specified parameters


#### 4.1_annotate.ipynb
Tab-delimited results to a gff3 format file, adding a detailed description for each TE including TE_id (a numeric identifier of the element after clustering) source_name (original id name of the element before clustering) type (family type of the element), source (program or tool from which the TEs was detected) and uinique_id (unique identifier for copy element).

## Extras. Scripts used for plots 

#### 5.1_coverage.sh
Calculate genome coverage

#### 6.1_area_plot.ipynb
Plot TE distribution across genome

#### 6.2_circos_prepare_genes.ipynb
Plot ciros with genes coverage

#### 6.3_circos_prepare.ipynb
Plot ciros with TEs coverage

#### 6.4_tes_genes_distance.ipynb
Calculate distance to closest gene

#### 6.5_ideogram.R
Plot an ideogram with coverage

#### 6.6_plot_tes_genes_distance.ipynb
Plot distance to genes

#### 7.0_tephra_ages.ipynb
Parse ages data from tephra

#### 7.1_ages_part.ipynb
Place ages data into hetero/eu chromatin

#### 7.2_age.R
Plot ages in ideograms




