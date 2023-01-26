using Revise
using MPAGS_Slides_Examples
Revise.track(MPAGS_Slides_Examples)

rows = init_vector(128, 10);
csv_output = serialise(rows);

using Profile
Profile.Allocs.clear()
Profile.Allocs.@profile sample_rate=1 serialise(rows);

using PProf
PProf.Allocs.pprof(from_c=false)


Profile.Allocs.clear()
serialise_fast(rows);
Profile.Allocs.@profile sample_rate=1 serialise_fast(rows);
PProf.Allocs.pprof(from_c=false)