function Count(a,b,c,ch,battle,nbb,bb,Z,art,P,q)
    print("共通ベルA=A 共通ベルB=B 共通ベルC=C チェリー=Ch BB(通常時からの直撃)=NBB BB(通常時からじゃない)=BB ART終了=ART 終わり=end\n")
    X = chomp(readline())
    if X == "A"
        a += 1
    elseif X == "B"
        b += 1
    elseif X == "C"
        c += 1
    elseif X == "Ch"
        ch += 1
        count = 0
        while count < 1
            print("対決入った? y/n\n")
            YN = chomp(readline())
            if YN == "y" || YN == "Y"
                battle += 1
                count += 1
            elseif YN == "n" || YN == "N"
                print("残念\n")
                count += 1
            else
                print("Please Enter y/n\n")
            end
        end
    elseif X == "NBB"
        nbb += 1
    elseif X == "BB"
        bb += 1
        count = 0
        while count < 1
            print("絶頂? y/n\n")
            YN = chomp(readline())
            if YN == "y" || YN == "Y"
                Z += 1
                count += 1
            elseif YN == "n" || YN == "N"
                print("残念\n")
                count += 1
            else
                print("Please Enter y/n\n")
            end
        end
    elseif X == "ART"
        art += 1
        count = 0
        while count < 1
            print("引き戻せた? y/n\n")
            YN = chomp(readline())
            if YN == "y" || YN == "Y"
                P += 1
                count += 1
            elseif YN == "n" || YN == "N"
                print("残念\n")
                count += 1
            else
                print("Please Enter y/n\n")
            end
        end
    elseif X == "end"
        q += 1
    else
        print("Please Enter A,B,C,CC or End\n")
    end
    
    return a,b,c,ch,battle,nbb,bb,Z,art,P,q
end

function probability(A,B,C,Ch,Battle,NBB,bb,Z,art,P)
    print("ここまでのゲーム数を入力してください\n")
    Game = parse(Float64,chomp(readline()))
    pA = A / Game
    pB = B / Game
    pC = C / Game
    pBattle = Battle / Ch
    pNBB = NBB / Game
    pZettyou = Z / bb
    pPullBack = P / art

    return pA,pB,pC,pBattle,pNBB,pZettyou,pPullBack,Game
end

function BellA_discriminant(pA)
    x = 1 / 52.9
    y = 1 / 49.6
    z = 1 / 45.8
    aDict = Dict{String,Int64}("1" => 0,"2" => 0,"3" => 0,"4" => 0,"5" => 0,"6" => 0)

    if pA <= x
        aDict["1"] += 3
        aDict["2"] += 3
        aDict["3"] += 3
        aDict["5"] += 3
    elseif pA > x && pA < y
        aDict["1"] += 2
        aDict["2"] += 2
        aDict["3"] += 2
        aDict["4"] += 2
        aDict["5"] += 2
    elseif pA == y
        aDict["4"] += 4
    elseif pA > y && pA < z
        aDict["4"] += 3
        aDict["6"] += 3
    elseif pA >= z
        aDict["6"] += 4
    end

    return aDict
end

function BellB_discriminant(pB)
    x = 1 / 103.4
    y = 1 / 97.8
    z = 1 / 91.5
    bDict = Dict{String,Int64}("1" => 0,"2" => 0,"3" => 0,"4" => 0,"5" => 0,"6" => 0)

    if pB <= x
        bDict["1"] += 3
        bDict["2"] += 3
        bDict["3"] += 3
        bDict["5"] += 3
    elseif pB > x && pB < y
        bDict["1"] += 2
        bDict["2"] += 2
        bDict["3"] += 2
        bDict["4"] += 2
        bDict["5"] += 2
    elseif pB == y
        bDict["4"] += 4
    elseif pB > y && pB < z
        bDict["4"] += 3
        bDict["6"] += 3
    elseif pB >= z
        bDict["6"] += 4
    end

    return bDict
end

function BellC_discriminant(pC)
    x = 1 / 152.4
    y = 1 / 139.4
    z = 1 / 123.7
    cDict = Dict{String,Int64}("1" => 0,"2" => 0,"3" => 0,"4" => 0,"5" => 0,"6" => 0)

    if pC <= x
        cDict["1"] += 3
        cDict["2"] += 3
        cDict["3"] += 3
        cDict["5"] += 3
    elseif pC > x && pC < y
        cDict["1"] += 2
        cDict["2"] += 2
        cDict["3"] += 2
        cDict["4"] += 2
        cDict["5"] += 2
    elseif pC == y
        cDict["4"] += 4
    elseif pC > y && pC < z
        cDict["4"] += 3
        cDict["6"] += 3
    elseif pC >= z
        cDict["6"] += 4
    end

    return cDict
end

function ChBattle_discriminant(pBattle)
    ChBattleDict = Dict{String,Int64}("1" => 0,"2" => 0,"3" => 0,"4" => 0,"5" => 0,"6" => 0)

    if pBattle <= 0.1563
        ChBattleDict["1"] += 4
        ChBattleDict["2"] += 4
    elseif pBattle > 0.1563 && pBattle < 0.1875
        ChBattleDict["1"] += 2
        ChBattleDict["2"] += 2
        ChBattleDict["3"] += 2
        ChBattleDict["4"] += 2
    elseif pBattle >= 0.1875 && pBattle <= 0.20
        ChBattleDict["3"] += 3
        ChBattleDict["4"] += 3
        ChBattleDict["5"] += 1
        ChBattleDict["6"] += 1
    elseif pBattle > 0.20 && pBattle < 0.2266
        ChBattleDict["3"] += 1
        ChBattleDict["4"] += 1
        ChBattleDict["5"] += 3
        ChBattleDict["6"] += 3
    elseif pBattle >= 0.2266
        ChBattleDict["5"] += 4
        ChBattleDict["6"] += 4
    end

    return ChBattleDict
end

function NBB_discriminant(pNBB)
    a = 1 / 7499.2
    b = 1 / 4966.1
    c = 1 / 3270.4
    d = 1 / 2529.9
    e = 1 / 1812.0
    NBBDict = Dict{String,Int64}("1" => 0,"2" => 0,"3" => 0,"4" => 0,"5" => 0,"6" => 0)

    if pNBB <= a
        NBBDict["1"] += 4
        NBBDict["2"] += 4
    elseif pNBB > a && pNBB <= b
        NBBDict["1"] += 2
        NBBDict["2"] += 2
        NBBDict["3"] += 3
    elseif pNBB > b && pNBB <= c
        NBBDict["3"] += 2
        NBBDict["5"] += 3
    elseif pNBB > c && pNBB <= d
        NBBDict["5"] += 2
        NBBDict["4"] += 3
    elseif pNBB > d && pNBB < e
        NBBDict["4"] += 2
        NBBDict["6"] += 3
    elseif pNBB >= e
        NBBDict["6"] += 4
    end

    return NBBDict    
end

function Zettyou_discriminant(pZettyou)
    zDict = Dict{String,Int64}("1" => 0,"2" => 0,"3" => 0,"4" => 0,"5" => 0,"6" => 0)

    if pZettyou <= 0.0625
        zDict["1"] += 4
        zDict["2"] += 4
        zDict["3"] += 4
        zDict["4"] += 4
        zDict["6"] += 4
    elseif pZettyou > 0.0625 && pZettyou <= 0.1
        zDict["1"] += 2
        zDict["2"] += 2
        zDict["3"] += 2
        zDict["4"] += 2
        zDict["5"] += 1
        zDict["6"] += 2
    elseif pZettyou > 0.1 && pZettyou <= 0.15
        zDict["1"] += 1
        zDict["2"] += 1
        zDict["3"] += 1
        zDict["4"] += 1
        zDict["5"] += 2
        zDict["6"] += 1
    elseif pZettyou > 0.15 && pZettyou <= 0.25
        zDict["1"] += 1
        zDict["2"] += 1
        zDict["3"] += 1
        zDict["4"] += 1
        zDict["5"] += 6
        zDict["6"] += 1
    elseif pZettyou > 0.25
        zDict["5"] += 8
    end

    return zDict
end

function PullBack_discriminant(pPullBack)
    pDict = Dict{String,Int64}("1" => 0,"2" => 0,"3" => 0,"4" => 0,"5" => 0,"6" => 0)

    if pPullBack <= 0.057
        pDict["1"] += 2
        pDict["2"] += 1
        pDict["3"] += 1
        pDict["5"] += 1
    elseif pPullBack > 0.057 && pPullBack <= 0.061
        pDict["1"] += 1
        pDict["2"] += 1
        pDict["3"] += 2
        pDict["5"] += 1
    elseif pPullBack > 0.061 && pPullBack <= 0.063
        pDict["1"] += 1
        pDict["2"] += 1
        pDict["3"] += 1
        pDict["5"] += 2
    elseif pPullBack > 0.063 && pPullBack <= 0.087
        pDict["1"] += 1
        pDict["2"] += 2
        pDict["3"] += 1
        pDict["5"] += 1
    elseif pPullBack > 0.087 && pPullBack <= 0.11
        pDict["2"] += 2
        pDict["4"] += 2
    elseif pPullBack > 0.11 && pPullBack <= 0.15
        pDict["4"] += 3
        pDict["6"] += 2
    elseif pPullBack > 0.15 && pPullBack <= 0.203
        pDict["4"] += 2
        pDict["6"] += 3
    elseif pPullBack > 0.203
        pDict["6"] += 6
    end

    return pDict
end

function main()
    BellA = 0
    BellB = 0
    BellC = 0
    Ch = 0
    Battle = 0
    NBB = 0
    BB = 0
    Zettyou = 0
    ART = 0
    PullBack = 0
    q = 0
    setting = [0,0,0,0,0,0,0]
    settingDict = Dict()
    flag = 0

    while q < 1
        BellA,BellB,BellC,Ch,Battle,NBB,BB,Zettyou,ART,PullBack,q = Count(BellA,BellB,BellC,Ch,Battle,NBB,BB,Zettyou,ART,PullBack,q)
    end

    pA,pB,pC,pBattle,pNBB,pZettyou,pPullBack,Game = probability(BellA,BellB,BellC,Ch,Battle,NBB,BB,Zettyou,ART,PullBack)
    aDict = BellA_discriminant(pA)
    bDict = BellB_discriminant(pB)
    cDict = BellC_discriminant(pC)

    if Ch != 0
        ChBattleDict = ChBattle_discriminant(pBattle)
    end

    if Game >= 3270
        NBBDict = NBB_discriminant(pNBB)
    end

    zDict = Zettyou_discriminant(pZettyou)
    pDict = PullBack_discriminant(pPullBack)

    for i in 1:6
        if Ch != 0 && Game >= 3270
            settingDict["$i"] = aDict["$i"] + bDict["$i"] + cDict["$i"] + ChBattleDict["$i"] + NBBDict["$i"] + zDict["$i"] + pDict["$i"]
        elseif Ch == 0 && Game >= 3270
            settingDict["$i"] = aDict["$i"] + bDict["$i"] + cDict["$i"] + NBBDict["$i"] + zDict["$i"] + pDict["$i"]
        elseif Ch != 0 && Game < 3270
            settingDict["$i"] = aDict["$i"] + bDict["$i"] + cDict["$i"] + ChBattleDict["$i"] + zDict["$i"] + pDict["$i"]
        else
            settingDict["$i"] = aDict["$i"] + bDict["$i"] + cDict["$i"] + zDict["$i"] + pDict["$i"]
        end
    end

    P,W = findmax(settingDict)
    W = parse(Int,"$W")

    print("設定は")
    for i in 1:6
        if settingDict["$i"] == P && i != W
            print("$i,")
            flag += 1
        else
        end
    end

    if flag >= 1
        print("のどれかじゃないかなぁ\n")
    else
        print("$W っぽいですね。\n")
    end
end

main()
