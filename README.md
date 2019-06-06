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

#### 1_add_annotation.ipynb
Information about paths for each TE type  has to be set in  _paths_fasta_ dictionary. 