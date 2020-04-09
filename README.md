## Personal modifications by kjyi
This is a modified julia package for personal convenience. Following functions are added. Nothing is changed in other parts.
```@docs
inferquerylength(record::Record)::Int # pysam `infer_query_length()`

isunmapped(record) # returns !ismapped(record)
```

## ....

```julia
using GenomicFeatures: eachoverlap
using XAM
using XAM.BAM: ismapped, isunmapped, inferquerylength, cigar, flag,
                isprimary, refid, refname, reflen, position,
                rightposition, isnextmapped, nextrefid, nextposition,
                mappingquality, alignment, alignlength, tempname,
                templength, sequence, quality, auxdata
```


## BAM.Record

```@docs
XAM.BAM.flag
XAM.BAM.ismapped
XAM.BAM.isprimary
XAM.BAM.refid
XAM.BAM.refname
XAM.BAM.reflen
XAM.BAM.position
XAM.BAM.rightposition
XAM.BAM.isnextmapped
XAM.BAM.nextrefid
XAM.BAM.nextrefname
XAM.BAM.nextposition
XAM.BAM.mappingquality
XAM.BAM.cigar
XAM.BAM.alignment
XAM.BAM.alignlength
XAM.BAM.tempname
XAM.BAM.templength
XAM.BAM.sequence
XAM.BAM.seqlength
XAM.BAM.quality
XAM.BAM.auxdata
```

## get auxdata
Below is an example of looping over records in a bam file and using indexing syntax to get the data stored in the "NM" tag. Note the UInt8 type assertion to alleviate type instability.

```julia
for record in open(BAM.Reader, "data.bam")
    nm = record["NM"]::UInt8
    # do something
end
```

## get reads in a range

First, make index `samtools index --b *sorted.bam`

```julia
reader =  open(BAM.Reader, "xx.bam", index="xx.bam.bai")
x=[]
for record in eachoverlap(reader, "2", 1000:1001)
	push!(x, record)
end
close(reader)
```


