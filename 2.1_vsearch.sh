mkdir data/results
rm -r data/results/clusters_line/ 2> /dev/null
mkdir data/results/clusters_line/
rm -r data/results/clusters_sine/ 2> /dev/null
mkdir data/results/clusters_sine/
rm -r data/results/clusters_mite/ 2> /dev/null
mkdir data/results/clusters_mite/
rm -r data/results/clusters_ltr/ 2> /dev/null
mkdir data/results/clusters_ltr/
rm -r data/results/clusters_helitron/ 2> /dev/null
mkdir data/results/clusters_helitron/
rm -r data/results/clusters_tir/ 2> /dev/null
mkdir data/results/clusters_tir/
rm -r data/results/clusters_trim/ 2> /dev/null
mkdir data/results/clusters_trim/
rm -r data/results/clusters_lard/ 2> /dev/null
mkdir data/results/clusters_lard/


#LINEs
grep ">" data/results/seqs_line.fasta | wc -l
nohup ./sw/vsearch-2.9.1/bin/vsearch --cluster_fast  data/results/seqs_line.fasta --threads 2 --strand both  --clusters data/results/clusters_line/c --iddef 1 -id 0.9 &


#TIRs
grep ">" data/results/seqs_tir.fasta | wc -l
nohup ./sw/vsearch-2.9.1/bin/vsearch --cluster_fast  data/results/seqs_tir.fasta --threads 2 --strand both  --clusters data/results/clusters_tir/c --iddef 1 -id 0.9 &

#SINEs
grep ">" data/results/seqs_sine.fasta | wc -l
nohup ./sw/vsearch-2.9.1/bin/vsearch --cluster_fast  data/results/seqs_sine.fasta --threads 2 --strand both  --clusters data/results/clusters_sine/c --iddef 1 -id 0.9 &

#LTRs
grep ">" data/results/seqs_ltr.fasta | wc -l
nohup ./sw/vsearch-2.9.1/bin/vsearch --cluster_fast  data/results/seqs_ltr.fasta --threads 2 --strand both  --clusters data/results/clusters_ltr/c --iddef 1 -id 0.9 &

#Helitrons
grep ">" data/results/seqs_helitron.fasta | wc -l
nohup ./sw/vsearch-2.9.1/bin/vsearch --cluster_fast  data/results/seqs_helitron.fasta --threads 2 --strand both  --clusters data/results/clusters_helitron/c --iddef 1 -id 0.9 & 

#TIRs
grep ">" data/results/seqs_tir.fasta | wc -l
nohup ./sw/vsearch-2.9.1/bin/vsearch --cluster_fast  data/results/seqs_tir.fasta --threads 2 --strand both  --clusters data/results/clusters_tir/c --iddef 1 -id 0.9 &

#LARDs
grep ">" data/results/seqs_lard.fasta | wc -l
nohup ./sw/vsearch-2.9.1/bin/vsearch --cluster_fast  data/results/seqs_lard.fasta --threads 2 --strand both  --clusters data/results/clusters_lard/c --iddef 1 -id 0.9 &

#TRIMs
grep ">" data/results/seqs_trim.fasta | wc -l
nohup ./sw/vsearch-2.9.1/bin/vsearch --cluster_fast  data/results/seqs_trim.fasta --threads 2 --strand both  --clusters data/results/clusters_trim/c --iddef 1 -id 0.9 &

#MITEs 
grep ">" data/results/seqs_mite.fasta | wc -l
nohup ./sw/vsearch-2.9.1/bin/vsearch --cluster_fast  data/results/seqs_mite.fasta --threads 2 --strand both  --clusters data/results/clusters_mite/c --iddef 1 -id 0.9 &

cd data/results
tar -zcvf clusters_ltr.tar.gz clusters_ltr/
tar -zcvf clusters_mite.tar.gz clusters_mite/
tar -zcvf clusters_line.tar.gz clusters_line/
tar -zcvf clusters_trim.tar.gz clusters_trim/
tar -zcvf clusters_helitron.tar.gz clusters_helitron/
tar -zcvf clusters_lard.tar.gz clusters_lard/
tar -zcvf clusters_sine.tar.gz clusters_sine/
tar -zcvf clusters_tir.tar.gz clusters_tir/
