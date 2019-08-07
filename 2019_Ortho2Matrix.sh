## This is a parsing script for Orthofinder > v2.
## Takes a species lists that is related to the headers of the genes (ex. Blumeria graminis has headers BLGH)
## and generates a melted matrix of counts to import in R in order to generate a heatmap.
## The output is going to be the mtx file

# Give the Orthofinder txt output file:
orthoout='Orthogroups.secreted.txt'

# Give species list with species ids, alternatively
# can be generated from Statistics_PerSpecies.csv if filenames are set accordingly.
# In this specific case for Ascochyta do
# head -n1 Statistics_PerSpecies.csv | sed -e 's/ascorab-iv.contigs.v1.all.prot/ASRAB/g' -e 's/.headch//g' -e 's/  /;/g' | tr ';' '\n' | sed '/^$/d' > species.lst

species=species.lst

# Script starts below

cut -f1 -d ':' $orthoout > orthog.lst
rm $orthoout.mtx

for orthog in `cat orthog.lst`;do
echo $orthog
grep $orthog $orthoout > orthog.tmp
	for speciez in `cat species.lst`;do
	count=$(cat orthog.tmp | tr ' ' '\n' | grep $speciez | wc -l | awk '{print $1}')
	echo $orthog $speciez $count >> $orthoout.mtx
	done
done














# Clean-up
rm orthog.lst orthog.tmp species.lst
