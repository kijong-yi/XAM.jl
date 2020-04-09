module XAM

export
    SAM,
    BAM,
	BAM.ismapped

include("sam/sam.jl")
include("bam/bam.jl")

using .SAM
using .BAM

end # module
