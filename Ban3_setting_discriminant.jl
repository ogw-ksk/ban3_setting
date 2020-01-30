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
    A1 = 0
    A2 = 0
    A3 = 0
    A4 = 0
    A5 = 0
    A6 = 0

    if pA <= x
        A1 += 3
        A2 += 3
        A3 += 3
        A5 += 3
    elseif pA > x && pA < y
        A1 += 2
        A2 += 2
        A3 += 2
        A4 += 2
        A5 += 2
    elseif pA == y
        A4 += 4
    elseif pA > y && pA < z
        A4 += 3
        A6 += 3
    elseif pA >= z
        A6 += 4
    end

    aDict = Dict{String,Int64}("1" => A1,"2" => A2,"3" => A3,"4" => A4,"5" => A5,"6" => A6)

    return aDict
end

function BellB_discriminant(pB)
    x = 1 / 103.4
    y = 1 / 97.8
    z = 1 / 91.5
    B1 = 0
    B2 = 0
    B3 = 0
    B4 = 0
    B5 = 0
    B6 = 0

    if pB <= x
        B1 += 3
        B2 += 3
        B3 += 3
        B5 += 3
    elseif pB > x && pB < y
        B1 += 2
        B2 += 2
        B3 += 2
        B4 += 2
        B5 += 2
    elseif pB == y
        B4 += 4
    elseif pB > y && pB < z
        B4 += 3
        B6 += 3
    elseif pB >= z
        B6 += 4
    end

    bDict = Dict{String,Int64}("1" => B1,"2" => B2,"3" => B3,"4" => B4,"5" => B5,"6" => B6)

    return bDict
end

function BellC_discriminant(pC)
    x = 1 / 152.4
    y = 1 / 139.4
    z = 1 / 123.7
    C1 = 0
    C2 = 0
    C3 = 0
    C4 = 0
    C5 = 0
    C6 = 0

    if pC <= x
        C1 += 3
        C2 += 3
        C3 += 3
        C5 += 3
    elseif pC > x && pC < y
        C1 += 2
        C2 += 2
        C3 += 2
        C4 += 2
        C5 += 2
    elseif pC == y
        C4 += 4
    elseif pC > y && pC < z
        C4 += 3
        C6 += 3
    elseif pC >= z
        C6 += 4
    end

    cDict = Dict{String,Int64}("1" => C1,"2" => C2,"3" => C3,"4" => C4,"5" => C5,"6" => C6)

    return cDict
end

function ChBattle_discriminant(pBattle)
    CB1 = 0
    CB2 = 0
    CB3 = 0
    CB4 = 0
    CB5 = 0
    CB6 = 0

    if pBattle <= 0.1563
        CB1 += 4
        CB2 += 4
    elseif pBattle > 0.1563 && pBattle < 0.1875
        CB1 += 2
        CB2 += 2
        CB3 += 2
        CB4 += 2
    elseif pBattle >= 0.1875 && pBattle <= 0.20
        CB3 += 3
        CB4 += 3
        CB5 += 1
        CB6 += 1
    elseif pBattle > 0.20 && pBattle < 0.2266
        CB3 += 1
        CB4 += 1
        CB5 += 3
        CB6 += 3
    elseif pBattle >= 0.2266
        CB5 += 4
        CB6 += 4
    end

    ChBattleDict = Dict{String,Int64}("1" => CB1,"2" => CB2,"3" => CB3,"4" => CB4,"5" => CB5,"6" => CB6)

    return ChBattleDict
end

function NBB_discriminant(pNBB)
    a = 1 / 7499.2
    b = 1 / 4966.1
    c = 1 / 3270.4
    d = 1 / 2529.9
    e = 1 / 1812.0
    NBB1 = 0
    NBB2 = 0
    NBB3 = 0
    NBB4 = 0
    NBB5 = 0
    NBB6 = 0

    if pNBB <= a
        NBB1 += 4
        NBB2 += 4
    elseif pNBB > a && pNBB <= b
        NBB1 += 2
        NBB2 += 2
        NBB3 += 3
    elseif pNBB > b && pNBB <= c
        NBB3 += 2
        NBB5 += 3
    elseif pNBB > c && pNBB <= d
        NBB5 += 2
        NBB4 += 3
    elseif pNBB > d && pNBB < e
        NBB4 += 2
        NBB6 += 3
    elseif pNBB >= e
        NBB6 += 4
    end
end

function Zettyou_discriminant(pZettyou)
    Z1 = 0
    Z2 = 0
    Z3 = 0
    Z4 = 0
    Z5 = 0
    Z6 = 0

    if pZettyou <= 0.0625
        Z1 += 4
        Z2 += 4
        Z3 += 4
        Z4 += 4
        Z6 += 4
    elseif pZettyou > 0.0625 && pZettyou <= 0.1
        Z1 += 2
        Z2 += 2
        Z3 += 2
        Z4 += 2
        Z5 += 1
        Z6 += 2
    elseif pZettyou > 0.1 && pZettyou <= 0.15
        Z1 += 1
        Z2 += 1
        Z3 += 1
        Z4 += 1
        Z5 += 2
        Z6 += 1
    elseif pZettyou > 0.15 && pZettyou <= 0.25
        Z1 += 1
        Z2 += 1
        Z3 += 1
        Z4 += 1
        Z5 += 6
        Z6 += 1
    elseif pZettyou > 0.25
        Z5 += 8
    end

    zDict = Dict{String,Int64}("1" => Z1,"2" => Z2,"3" => Z3,"4" => Z4,"5" => Z5,"6" => Z6)

    return zDict
end

function PullBack_discriminant(pPullBack)
    P1 = 0
    P2 = 0
    P3 = 0
    P4 = 0
    P5 = 0
    P6 = 0

    if pPullBack <= 0.057
        P1 += 2
        P2 += 1
        P3 += 1
        P5 += 1
    elseif pPullBack > 0.057 && pPullBack <= 0.061
        P1 += 1
        P2 += 1
        P3 += 2
        P5 += 1
    elseif pPullBack > 0.061 && pPullBack <= 0.063
        P1 += 1
        P2 += 1
        P3 += 1
        P5 += 2
    elseif pPullBack > 0.063 && pPullBack <= 0.087
        P1 += 1
        P2 += 1
        P3 += 2
        P5 += 1
    elseif pPullBack > 0.087 && pPullBack <= 0.11
        P2 += 2
        P4 += 2
    elseif pPullBack > 0.11 && pPullBack <= 0.15
        P4 += 3
        P6 += 2
    elseif pPullBack > 0.15 && pPullBack <= 0.203
        P4 += 2
        P6 += 3
    elseif pPullBack > 0.203
        P6 += 6
    end

    pDict = Dict{String,Int64}("1" => P1,"2" => P2,"3" => P3,"4" => P4,"5" => P5,"6" => P6)

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

    print("設定は")
    for i in 1:6
        if settingDict["$i"] == P
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