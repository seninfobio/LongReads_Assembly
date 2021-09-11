k=open('genes.csv','r')
out=open('karyo.txt','w')
count=1
color='black'
for lines in k:
  r=lines.rstrip()
  d=r.split()
  out.write("band	chr1	"+"band"+str(count)+'\t'+"band"+str(count)+'\t'+d[1]+'\t'+d[2]+'\t'+color+'\n')
  if color=='black':
    color='white'
  else:
    color='black'

  count+=1
