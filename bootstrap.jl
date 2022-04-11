(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using Frontend
push!(Base.modules_warned_for, Base.PkgId(Frontend))
Frontend.main()
