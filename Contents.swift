

//スロットマシーンの作成
//Aタイプの作成を目指す
//大当たり確率(子役が成立した何%での抽選)、子役の確率、払い出しの枚数を決める。
//一回転に必要なメダルの枚数は３枚、天井は100G
//大当たり成立時は子役のベル確率が100％で、20G続く。
//大当たり終了後は全てリセットし0Gからスタート。

//要件
//自分の持ちメダルと一回転に必要なメダルを比較し、持ちメダルが必要メダルを超えていた場合にのみ実行される回転メソッドを作る。
//上記のメソッドが実行され、ランダムで選ばれた数字に対応する子役が選ばれる乱数メソッドを作る。
//子役は『大当たり(直撃)、ベル、リプレイ、チェリーとする。それ以外はハズレ
//回転メソッドが実行されたタイミングで総回転の数字に＋１とする
//総回転が100Gに到達した場合、大当たりに直撃する
//大当たりのメソッドを作る
//大当たり終了後は総回転に0を代入する

//子役詳細
//大当たり　100％の確率で20Gのみのベル確率100％に突入
//ベル　自分の持ちメダルに＋8
//リプレイ　自分の持ちメダルを消費せずもう一回転できる
//チェリー　自分の持ちメダル＋2、次回転で大当たり確率50％

class SlotMachine {
    
    //子役・大当たりの種類
    enum koyakuType {
           case bounus
           case bell
           case replay
           case chelly
    }
    //必要メダル
    var inputedMedal: Int = 3
    var myMedal: Int = 250
    var slotRotation = 0
    //抽選乱数
    var random = 0
    //抽選乱数の大まかなメソッド
    func normalRamdomNumber() {
    random = Int.random(in: 0...50)
    print(random)
    switch random {
        case 0:
           bigBounus()
        case 1...5:
           replay()
        case 6...10:
           bell()
        case 11...13:
           cherry()
    default:
        print("ハズレ")
    }
   
}
    
    //メダルを消費し一回転させるメソッド
    func judgement() -> Bool {
        let betMedal = false
        if myMedal >= inputedMedal && slotRotation <= 100 {
            myMedal -= 3
            slotMachine.normalRamdomNumber()
            slotRotation += 1
            print(myMedal)
        } else if myMedal <= inputedMedal {
            print("gameover")
            print(myMedal)
        } else if slotRotation > 100 {
            slotRotation = 0
            
        }
        return betMedal
    }

    func bigBounus() {
        for _ in 1...20 {
            if myMedal >= inputedMedal {
                myMedal -= 3
                bell()
            } else if myMedal <= inputedMedal {
                print("gameover")
            }
            
        }
             slotRotation = 0
    }
    
    
    func bell() {
        slotRotation += 1
        myMedal += 8
    }
    
    func replay() {
        slotRotation += 1
    }
    
    func cherry() {
        slotRotation += 1
        cherryRamdom()
    }
    
    func cherryRamdom() {
        random = Int.random(in: 0...1)
        print(random)
        switch random {
            case 0:
               bigBounus()
        default:
            print("ハズレ")
        }    }
    
}
//インスタンス化
let slotMachine = SlotMachine()
let kekka = slotMachine.judgement()


//イレギュラー
//メダル以外に
