# Details of all commands with output are in descriptive text files attached with folder

#################### Content Print using Sed ####################

touch one.txt
cat > one.txt
sed -n '1p' 'one.txt'
sed -n '1,10p' 'one.txt'
sed -n '1p;5p' 'one.txt'
sed -n '1,$p' 'one.txt' > output.txt
sed -n '1,100p;150p;200,250p' 'one.txt' > output.txt
cat -n 'hello.txt' | sed -n '1,100p'

#################### Find and Replace using Sed ####################


#################### On Screen Replacement #########################
lscpu | cat -n | sed -n '1,15p' >  cpuspecs.txt
sed '1s/Architecture/Architecture,Architecture,Architecture/' cpuspecs.txt
sed '1s/Architecture/Architecture,Architecture,Architecture/' cpuspecs.txt | head -5
sed '1s/Architecture/Architecture,Architecture,Architecture/' cpuspecs.txt | head -5  > newspecs.txt
cat newspecs.txt
sed '1s/Architecture/Architonics/' newspecs.txt
sed '1s/Architecture/Architonics/g' newspecs.txt
cat newspecs.txt
sed '5s/CPU/Architecture,NumberofCPUs/g' newspecs.txt  > updatedspecs.txt 
sed 's/Architecture/Architonics/g' updatedspecs.txt         #"s means all substitutions"
sed 's/CPU/Architecture/g' updatedspecs.txt
#"1,2s means starting from line 1 making subs till 2nd line"
sed 's/CPU/Architecture/g' updatedspecs.txt | sed '1,2s/Architecture/Architonics/g'                  
#"here i is used with g meaning globaly and insensitive replace architecure,ARCHITECTURE or what so ever be the upper,lower pattern"
sed 's/ARCHITECTURE/Architonics/gi' newspecs.txt    
sed '1s/Architecture/ARchitecTUre/g' newspecs.txt
sed '1s/Architecture/ARchitecTUre/g' newspecs.txt | sed 's/ARCHITECTURE/Architonics/gi' > caseinsensitive.txt
cat caseinsensitive.txt | grep Architonics
#"Replace only 3rd occurance of word in 1st line"
sed '1s/Architonics/Architecture/3' caseinsensitive.txt | grep Architecture
#"Replace first occurance of Architecture in all lines"            
sed 's/Architecture/Architonics/1' updatedspecs.txt | grep -i  Architonics
#Replacing multiple words occurances using single command
cat newspecs.txt | sed 's/Architecture/Architonics/g;s/CPU/CentralProcessingUnit/g' | head -5

#Replacing in original file we use -i flag with sed
sed -i 's/ORDER/SEQUENCE/gi' updatedspecs.txt