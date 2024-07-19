OUTDIR="$HOME/Downloads/sn-transcripts"

if [ ! -d "$OUTDIR" ];
then
  echo "Output directory not found... Creating..."
  mkdir -p $OUTDIR
fi

for I in {1..979} 
do
  echo "Downloading Show Notes for Episode $I"
  EP=$(printf "%03d\n" $I)
  curl --silent -o $OUTDIR/sn-$EP.txt https://www.grc.com/sn/sn-$EP.txt
done
