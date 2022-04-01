@testset "Modules" begin
  _wrap_for_gap(m::MatrixElem) = GAP.Globals.MakeJuliaMatrixRep(m)

    m = matrix(ZZ, [0 1 ; -1 0])
    gapM = _wrap_for_gap(m)
    G = GAP.Globals.Group(gapM)
    @test GAP.Globals.Size(G) == 4
    
    print("Hello World!")
end
