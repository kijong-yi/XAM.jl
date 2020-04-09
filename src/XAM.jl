module XAM

export
    SAM,
    BAM

include("sam/sam.jl")
include("bam/bam.jl")

export BAM.ismapped

using .SAM
using .BAM

end # module
