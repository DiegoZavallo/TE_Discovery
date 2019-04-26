awk '{ if ($1 != "ChrUn") { print } }' data/results/all.gff > data/results/all.noun.gff
echo "" > data/results/coverage.txt
grep "TRIM_id" data/results/all.noun.gff > data/results/all_trim.gff
grep "LINE_id" data/results/all.noun.gff > data/results/all_line.gff
grep "SINE_id" data/results/all.noun.gff > data/results/all_sine.gff
grep "MITE_id" data/results/all.noun.gff > data/results/all_mite.gff
grep "LARD_id" data/results/all.noun.gff > data/results/all_lard.gff
grep "LTR_id" data/results/all.noun.gff > data/results/all_ltr.gff
grep "helitron_id" data/results/all.noun.gff > data/results/all_helitron.gff
grep "TIR_id" data/results/all.noun.gff > data/results/all_tir.gff

grep "RLG" data/results/all_ltr.gff > data/results/all_rlg.gff
grep "RLC" data/results/all_ltr.gff > data/results/all_rlc.gff
grep "RLX" data/results/all_ltr.gff > data/results/all_rlx.gff
grep "DTM" data/results/all.noun.gff > data/results/all_dtm.gff
grep "DTC" data/results/all.noun.gff > data/results/all_dtc.gff
grep "DTT" data/results/all.noun.gff > data/results/all_dtt.gff
grep "DTA" data/results/all.noun.gff > data/results/all_dta.gff
grep "DTH" data/results/all.noun.gff > data/results/all_dth.gff
grep "DTX" data/results/all.noun.gff > data/results/all_dtx.gff


python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all.noun.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_rlc.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_rlx.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_rlg.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_dtm.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_dtc.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_dtt.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_dta.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_dth.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_dtx.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_trim.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_line.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_sine.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_mite.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_lard.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_ltr.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_helitron.gff >> data/results/coverage.txt
python gff2coverage.py -r data/Stuberosum_genome.gff3 -a data/results/all_tir.gff >> data/results/coverage.txt

