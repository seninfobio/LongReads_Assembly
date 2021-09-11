fasta=open('final_genome_scaffolds.fasta','r')
ref=""
for line in fasta:
 seq=line.rstrip()
 if seq[0]!=0:
    ref=ref+seq
fasta.close()
out=open("GC_minus.txt","w")
label=open("Label_minus.txt","r")
for line in label:
  col=line.split()
  sr=int(col[1])
  st=int(col[2])
  
  dna=ref[sr:st+1]
  length=len(dna)
  A=length- len(dna.replace("A",""))
  T=length- len(dna.replace("T",""))
  G=length- len(dna.replace("G",""))
  C=length- len(dna.replace("C",""))
  gc=float(G+C)/length
  out.write("chr1"+'\t'+col[1]+'\t'+col[2]+'\t'+str(gc)+'\n')
