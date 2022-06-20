using ScaledNumbersOutput, Test, Aqua
@testset "SI" begin
    @test    to_SI(2.5e11) == "250G"
    @test    to_SI(2.5e10) == "25G"
    @test     to_SI(2.5e9) == "2.5G"
    @test     to_SI(2.5e8) == "250M"
    @test     to_SI(2.5e7) == "25M"
    @test     to_SI(2.5e6) == "2.5M"
    @test  to_SI(250000.0) == "250k"
    @test   to_SI(25000.0) == "25k"
    @test    to_SI(2500.0) == "2.5k"
    @test     to_SI(250.0) == "250"
    @test      to_SI(25.0) == "25"
    @test       to_SI(2.5) == "2.5"
    @test      to_SI(0.25) == "0.25"
    @test     to_SI(0.025) == "25m"
    @test    to_SI(0.0025) == "2.5m"
    @test   to_SI(0.00025) == "250u"
    @test    to_SI(2.5e-5) == "25u"
    @test    to_SI(2.5e-6) == "2.5u"
    @test    to_SI(2.5e-7) == "250n"
    @test    to_SI(2.5e-8) == "25n"
    @test    to_SI(2.5e-9) == "2.5n"

    @test    to_SI(2.5e-19) == "2.5e-19"
    @test    to_SI(2.5e19) == "2.5e19"

    # Negatives:
    @test    to_SI(-2.5e11) == "-250G"
    @test    to_SI(-2.5e10) == "-25G"
    @test     to_SI(-2.5e9) == "-2.5G"
    @test     to_SI(-2.5e8) == "-250M"
    @test     to_SI(-2.5e7) == "-25M"
    @test     to_SI(-2.5e6) == "-2.5M"
    @test  to_SI(-250000.0) == "-250k"
    @test   to_SI(-25000.0) == "-25k"
    @test    to_SI(-2500.0) == "-2.5k"
    @test     to_SI(-250.0) == "-250"
    @test      to_SI(-25.0) == "-25"
    @test       to_SI(-2.5) == "-2.5"
    @test      to_SI(-0.25) == "-0.25"
    @test     to_SI(-0.025) == "-25m"
    @test    to_SI(-0.0025) == "-2.5m"
    @test   to_SI(-0.00025) == "-250u"
    @test    to_SI(-2.5e-5) == "-25u"
    @test    to_SI(-2.5e-6) == "-2.5u"
    @test    to_SI(-2.5e-7) == "-250n"
    @test    to_SI(-2.5e-8) == "-25n"
    @test    to_SI(-2.5e-9) == "-2.5n"

    @test    to_SI(-2.5e-19) == "-2.5e-19"
    @test    to_SI(-2.5e19) == "-2.5e19"
end
@testset "Misc. QA" begin
    Aqua.test_all(ScaledNumbersOutput)
end