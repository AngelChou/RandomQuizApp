//
//  ViewController.swift
//  RandomQuizApp
//
//  Created by Shun-Ching, Chou on 2018/10/19.
//  Copyright © 2018 Shun-Ching, Chou. All rights reserved.
//

import UIKit

struct Country {
    var flag : String!
    var name : String!
}

class ViewController: UIViewController {
    var question = [Country]()
    var questionList = [Country]()
    var questionNum = 10
    var currentQuestion: Country?
    
    @IBOutlet weak var questionNumLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBAction func showAnswerButton(_ sender: UIButton) {
        answerLabel.isHidden = false
        answerLabel.text = currentQuestion?.name
    }
    
    @IBAction func nextQuestionButton(_ sender: UIButton) {
        getQuestion()
    }
    
    //隨機選取一個題目
    func getQuestion(){
        
        //更新題號，若出到第10題則重來一次
        if questionNum == 10 {
            questionNum = 1
            //還原題庫
            setQuestion()
        } else {
            questionNum += 1
        }
        questionNumLabel.text = "\(questionNum)"
        
        //取得題目總數，並從中隨機選一個數字
        let count = question.count - 1
        var num = 0
        if count != 0 {
            num = Int.random(in: 0...count)
        }
        
        //根據隨機選取的數字從問題集中找出題目
        currentQuestion = question[num]
        flagImage.image = UIImage(named: currentQuestion!.flag)
        
        //將出過的題目從題庫中刪除
        question.remove(at: num)
        
        //隱藏解答
        answerLabel.isHidden = true
    }
    
    func setQuestion() {
        // 初始化題庫
        if questionList.count == 0 {
            createQuestionList()
        }
        // 將題庫重新洗牌
        questionList.shuffle()
        
        // 取題庫的前10項當題目
        question = Array(questionList[0...9])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //建立題庫
        setQuestion()
        
        //將題目顯示在畫面上
        getQuestion()
    }
    
    func createQuestionList() {
        questionList = [
            // 東亞
            Country(flag: "200px-Flag_of_Taiwan.svg.png", name: "臺灣"),
            Country(flag: "200px-Flag_of_North_Korea.svg.png", name: "朝鮮"),
            Country(flag: "200px-Flag_of_China.svg.png", name: "中國"),
            Country(flag: "200px-Flag_of_Mongolia.svg.png", name: "蒙古"),
            Country(flag: "200px-Flag_of_South_Korea.svg.png", name: "韓國"),
            Country(flag: "200px-Flag_of_Japan.svg.png", name: "日本"),
            // 東南亞
            Country(flag: "200px-Flag_of_Thailand.svg.png", name: "泰國"),
            Country(flag: "200px-Flag_of_Indonesia.svg.png", name: "印尼"),
            Country(flag: "200px-Flag_of_Vietnam.svg.png", name: "越南"),
            Country(flag: "230px-Flag_of_Brunei.svg.png", name: "汶萊"),
            Country(flag: "200px-Flag_of_Singapore.svg.png", name: "新加坡"),
            Country(flag: "230px-Flag_of_Malaysia.svg.png", name: "馬來西亞"),
            Country(flag: "200px-Flag_of_Laos.svg.png", name: "寮國"),
            Country(flag: "200px-Flag_of_Cambodia.svg.png", name: "柬埔寨"),
            Country(flag: "230px-Flag_of_the_Philippines.svg.png", name: "菲律賓"),
            Country(flag: "230px-Flag_of_East_Timor.svg.png", name: "東帝汶"),
            Country(flag: "200px-Flag_of_Myanmar.svg.png", name: "緬甸"),
            // 南亞
            Country(flag: "200px-Flag_of_India.svg.png", name: "印度"),
            Country(flag: "200px-Flag_of_Pakistan.svg.png", name: "巴基斯坦"),
            Country(flag: "230px-Flag_of_Sri_Lanka.svg.png", name: "斯里蘭卡"),
            Country(flag: "186px-Flag_of_Nepal.svg.png", name: "尼泊爾"),
            Country(flag: "200px-Flag_of_Maldives.svg.png", name: "馬爾地夫"),
            Country(flag: "200px-Flag_of_Bhutan.svg.png", name: "不丹"),
            Country(flag: "210px-Flag_of_Bangladesh.svg.png", name: "孟加拉"),
            // 中亞
            Country(flag: "230px-Flag_of_Uzbekistan.svg.png", name: "烏茲別克"),
            Country(flag: "Flag_of_Kyrgyzstan.svg.png", name: "吉爾吉斯"),
            Country(flag: "230px-Flag_of_Kazakhstan.svg.png", name: "哈薩克"),
            Country(flag: "230px-Flag_of_Tajikistan.svg.png", name: "塔吉克"),
            Country(flag: "200px-Flag_of_Turkmenistan.svg.png", name: "土庫曼"),
            // 西亞
            Country(flag: "200px-Flag_of_Turkey.svg.png", name: "土耳其"),
            Country(flag: "230px-Flag_of_Jordan.svg.png", name: "約旦"),
            Country(flag: "230px-Flag_of_Israel.svg.png", name: "以色列"),
            Country(flag: "230px-Flag_of_Kuwait.svg.png", name: "科威特"),
            Country(flag: "260px-Flag_of_Qatar.svg.png", name: "卡達"),
            Country(flag: "Flag_of_the_United_Arab_Emirates.svg.png", name: "阿拉伯"),
            Country(flag: "200px-Flag_of_Syria.svg.png", name: "敘利亞"),
            Country(flag: "216px-Flag_of_Iran.svg.png", name: "伊朗"),
            Country(flag: "200px-Flag_of_Saudi_Arabia.svg.png", name: "沙烏地阿拉伯"),
            Country(flag: "200px-Flag_of_the_Turkish_Republic_of_Northern_Cyprus.svg.png", name: "北塞普勒斯"),
            Country(flag: "200px-Flag_of_Yemen.svg.png", name: "葉門"),
            Country(flag: "230px-Flag_of_Armenia.svg.png", name: "亞美尼亞"),
            Country(flag: "230px-Flag_of_South_Ossetia.svg.png", name: "南奧塞提亞"),
            Country(flag: "230px-Flag_of_Artsakh.svg.png", name: "阿爾扎赫"),
            Country(flag: "230px-Flag_of_the_Republic_of_Abkhazia.svg.png", name: "阿布哈茲"),
            Country(flag: "230px-Flag_of_Oman.svg", name: "阿曼蘇丹"),
            Country(flag: "200px-Flag_of_Lebanon.svg.png", name: "黎巴嫩"),
            Country(flag: "210px-Flag_of_Bahrain.svg.png", name: "巴林"),
            Country(flag: "200px-Flag_of_Georgia.svg.png", name: "喬治亞"),
            Country(flag: "230px-Flag_of_Palestine.svg.png", name: "巴勒斯坦"),
            Country(flag: "210px-Flag_of_Cyprus.svg.png", name: "賽普勒斯"),
            Country(flag: "200px-Flag_of_Iraq.svg.png", name: "伊拉克"),
            Country(flag: "200px-Flag_of_Afghanistan.svg.png", name: "阿富汗"),
            Country(flag: "230px-Flag_of_Azerbaijan.svg.png", name: "亞塞拜然"),
            // 西歐
            Country(flag: "200px-Flag_of_France.svg.png", name: "法國"),
            Country(flag: "230px-Flag_of_the_United_Kingdom.svg.png", name: "英國"),
            Country(flag: "200px-Flag_of_the_Netherlands.svg.png", name: "荷蘭"),
            Country(flag: "182px-Flag_of_Belgium.svg.png", name: "比利時"),
            Country(flag: "182px-Flag_of_Monaco.svg.png", name: "摩納哥"),
            Country(flag: "230px-Flag_of_Ireland.svg.png", name: "愛爾蘭"),
            Country(flag: "210px-Flag_of_Luxembourg.svg.png", name: "盧森堡"),
            // 北歐
            Country(flag: "188px-Flag_of_Denmark.svg.png", name: "丹麥"),
            Country(flag: "192px-Flag_of_Norway.svg.png", name: "挪威"),
            Country(flag: "206px-Flag_of_Sweden.svg.png", name: "瑞典"),
            Country(flag: "192px-Flag_of_Iceland.svg.png", name: "冰島"),
            Country(flag: "208px-Flag_of_Finland.svg.png", name: "芬蘭"),
            // 中歐
            Country(flag: "164px-Flag_of_Switzerland.svg.png", name: "瑞士"),
            Country(flag: "206px-Flag_of_Poland.svg.png", name: "波蘭"),
            Country(flag: "200px-Flag_of_the_Czech_Republic.svg.png", name: "捷克"),
            Country(flag: "200px-Flag_of_Austria.svg.png", name: "奧地利"),
            Country(flag: "210px-Flag_of_Germany.svg.png", name: "德國"),
            Country(flag: "210px-Flag_of_Liechtenstein.svg.png", name: "列支敦斯登"),
            Country(flag: "230px-Flag_of_Hungary.svg.png", name: "匈牙利"),
            Country(flag: "200px-Flag_of_Slovakia.svg.png", name: "斯洛伐克"),
            // 東歐
            Country(flag: "230px-Flag_of_Latvia.svg.png", name: "拉脫維亞"),
            Country(flag: "230px-Flag_of_Moldova.svg.png", name: "摩爾多瓦"),
            Country(flag: "204px-Flag_of_Estonia.svg.png", name: "愛沙尼亞"),
            Country(flag: "200px-Flag_of_Ukraine.svg.png", name: "烏克蘭"),
            Country(flag: "200px-Flag_of_Chuvashia.svg.png", name: "楚瓦什"),
            Country(flag: "200px-Flag_of_Russia.svg.png", name: "俄羅斯"),
            Country(flag: "210px-Flag_of_Crimea.svg.png", name: "克里米亞"),
            Country(flag: "200px-Flag_of_Karelia.svg.png", name: "卡累利阿"),
            Country(flag: "200px-Flag_of_Altai_Republic.svg.png", name: "阿爾泰"),
            Country(flag: "230px-Flag_of_Transnistria_(state).svg.png", name: "聶斯特河沿岸摩爾達維亞"),
            Country(flag: "210px-Flag_of_Lithuania.svg.png", name: "立陶宛"),
            Country(flag: "230px-Flag_of_Belarus.svg.png", name: "白俄羅斯"),
            Country(flag: "210px-Flag_of_Lugansk_People's_Republic.svg.png", name: "盧干斯克"),
            Country(flag: "230px-Flag_of_Donetsk_People's_Republic.svg.png", name: "頓內次克"),
            // 南歐
            Country(flag: "200px-Flag_of_Portugal.svg.png", name: "葡萄牙"),
            Country(flag: "164px-Flag_of_the_Vatican_City.svg.png", name: "梵蒂岡"),
            Country(flag: "200px-Flag_of_Italy.svg.png", name: "義大利"),
            Country(flag: "200px-Flag_of_Malta.svg.png", name: "馬爾他"),
            Country(flag: "200px-Flag_of_Greece.svg.png", name: "希臘"),
            Country(flag: "200px-Flag_of_Spain.svg.png", name: "西班牙"),
            Country(flag: "200px-Flag_of_Romania.svg.png", name: "羅馬尼亞"),
            Country(flag: "210px-Flag_of_Bulgaria.svg.png", name: "保加利亞"),
            Country(flag: "230px-Flag_of_Croatia.svg.png", name: "克羅埃西亞"),
            Country(flag: "230px-Flag_of_Slovenia.svg.png", name: "斯洛維尼亞"),
            Country(flag: "194px-Flag_of_Albania.svg.png", name: "阿爾巴尼亞"),
            Country(flag: "230px-Flag_of_Macedonia.svg.png", name: "馬其頓"),
            Country(flag: "200px-Flag_of_Andorra.svg.png", name: "安道爾"),
            Country(flag: "230px-Flag_of_Bosnia_and_Herzegovina.svg.png", name: "波士尼亞和赫塞哥維納"),
            Country(flag: "230px-Flag_of_Montenegro.svg.png", name: "蒙特內哥羅"),
            Country(flag: "200px-Flag_of_Kosovo.svg.png", name: "科索沃"),
            Country(flag: "200px-Flag_of_Serbia.svg.png", name: "塞爾維亞"),
            Country(flag: "230px-Flag_of_Republika_Srpska.svg.png", name: "塞族"),
            Country(flag: "188px-Flag_of_San_Marino.svg.png", name: "聖馬利諾"),
            // 北非
            Country(flag: "200px-Flag_of_Morocco.svg.png", name: "摩洛哥"),
            Country(flag: "200px-Flag_of_Algeria.svg.png", name: "阿爾及利亞"),
            Country(flag: "230px-Flag_of_Sudan.svg.png", name: "蘇丹"),
            Country(flag: "230px-Flag_of_the_Sahrawi_Arab_Democratic_Republic.svg.png", name: "撒拉威阿拉伯"),
            Country(flag: "200px-Flag_of_Egypt.svg.png", name: "埃及"),
            Country(flag: "200px-Flag_of_Tunisia.svg.png", name: "突尼西亞"),
            Country(flag: "230px-Flag_of_South_Sudan.svg.png", name: "南蘇丹"),
            Country(flag: "230px-Flag_of_Libya.svg.png", name: "利比亞"),
            // 東非
            Country(flag: "200px-Flag_of_Uganda.svg.png", name: "烏干達"),
            Country(flag: "200px-Flag_of_Kenya.svg.png", name: "肯亞"),
            Country(flag: "200px-Flag_of_Tanzania.svg.png", name: "坦尚尼亞"),
            Country(flag: "200px-Flag_of_Djibouti.svg.png", name: "吉布地"),
            Country(flag: "210px-Flag_of_Burundi.svg.png", name: "蒲隆地"),
            Country(flag: "230px-Flag_of_Eritrea.svg.png", name: "厄利垂亞"),
            Country(flag: "230px-Flag_of_Seychelles.svg.png", name: "塞席爾"),
            Country(flag: "230px-Flag_of_Somaliland.svg.png", name: "索馬利亞蘭"),
            Country(flag: "200px-Flag_of_Rwanda.svg.png", name: "盧安達"),
            Country(flag: "230px-Flag_of_Ethiopia.svg.png", name: "衣索比亞"),
            Country(flag: "200px-Flag_of_Somalia.svg.png", name: "索馬利亞"),
            // 西非
            Country(flag: "224px-Flag_of_Liberia.svg.png", name: "賴比瑞亞"),
            Country(flag: "200px-Flag_of_Guinea.svg.png", name: "幾內亞"),
            Country(flag: "Flag_of_Chad.svg.png", name: "查德"),
            Country(flag: "176px-Flag_of_Niger.svg.png", name: "尼日"),
            Country(flag: "Flag_of_Côte_d'Ivoire.svg.png", name: "象牙海岸"),
            Country(flag: "210px-Flag_of_Togo.svg.png", name: "多哥"),
            Country(flag: "200px-Flag_of_Senegal.svg.png", name: "塞內加爾"),
            Country(flag: "230px-Flag_of_Nigeria.svg.png", name: "奈及利亞"),
            Country(flag: "200px-Flag_of_Mali.svg.png", name: "馬利"),
            Country(flag: "200px-Flag_of_Sierra_Leone.svg.png", name: "獅子山"),
            Country(flag: "200px-Flag_of_The_Gambia.svg.png", name: "甘比亞"),
            Country(flag: "200px-Flag_of_Ghana.svg.png", name: "迦納"),
            Country(flag: "230px-Flag_of_Guinea-Bissau.svg.png", name: "幾內亞比索"),
            Country(flag: "200px-Flag_of_Burkina_Faso.svg.png", name: "布吉納法索"),
            Country(flag: "200px-Flag_of_Benin.svg.png", name: "貝南"),
            Country(flag: "210px-Flag_of_Cape_Verde.svg.png", name: "維德角"),
            Country(flag: "200px-Flag_of_Mauritania.svg.png", name: "茅利塔尼亞"),
            // 中非
            Country(flag: "200px-Flag_of_the_Central_African_Republic.svg.png", name: "中非"),
            Country(flag: "188px-Flag_of_Gabon.svg.png", name: "加彭"),
            Country(flag: "200px-Flag_of_Cameroon.svg.png", name: "喀麥隆"),
            Country(flag: "230px-Flag_of_Sao_Tome_and_Principe.svg.png", name: "聖多美及普林西比"),
            Country(flag: "200px-Flag_of_Equatorial_Guinea.svg.png", name: "赤道幾內亞"),
            Country(flag: "200px-Flag_of_the_Republic_of_the_Congo.svg.png", name: "剛果"),
            Country(flag: "188px-Flag_of_the_Democratic_Republic_of_the_Congo.svg.png", name: "民主剛果"),
            // 南非
            Country(flag: "200px-Flag_of_Madagascar.svg.png", name: "馬達加斯加"),
            Country(flag: "206px-Flag_of_Botswana.svg.png", name: "波札那"),
            Country(flag: "200px-Flag_of_Swaziland.svg.png", name: "史瓦帝尼"),
            Country(flag: "200px-Flag_of_Mauritius.svg.png", name: "模里西斯"),
            Country(flag: "200px-Flag_of_Angola.svg.png", name: "安哥拉"),
            Country(flag: "230px-Flag_of_Zimbabwe.svg.png", name: "辛巴威"),
            Country(flag: "200px-Flag_of_Mozambique.svg.png", name: "莫三比克"),
            Country(flag: "200px-Flag_of_Namibia.svg.png", name: "納米比亞"),
            Country(flag: "200px-Flag_of_South_Africa.svg.png", name: "南非"),
            Country(flag: "200px-Flag_of_Zambia.svg.png", name: "尚比亞"),
            Country(flag: "210px-Flag_of_the_Comoros.svg.png", name: "葛摩"),
            Country(flag: "200px-Flag_of_Lesotho.svg.png", name: "賴索托"),
            Country(flag: "200px-Flag_of_Malawi.svg.png", name: "馬拉威"),
            // 北美
            Country(flag: "224px-Flag_of_the_United_States.svg.png", name: "美國"),
            Country(flag: "230px-Flag_of_Canada.svg.png", name: "加拿大"),
            Country(flag: "216px-Flag_of_Mexico.svg.png", name: "墨西哥"),
            // 中美
            Country(flag: "200px-Flag_of_Panama.svg.png", name: "巴拿馬"),
            Country(flag: "210px-Flag_of_Nicaragua.svg.png", name: "尼加拉瓜"),
            Country(flag: "224px-Flag_of_El_Salvador.svg.png", name: "薩爾瓦多"),
            Country(flag: "230px-Flag_of_Honduras.svg.png", name: "宏都拉斯"),
            Country(flag: "206px-Flag_of_Guatemala.svg.png", name: "瓜地馬拉"),
            Country(flag: "200px-Flag_of_Belize.svg.png", name: "貝里斯"),
            Country(flag: "210px-Flag_of_Costa_Rica.svg.png", name: "哥斯大黎加"),
            // 加勒比
            Country(flag: "206px-Flag_of_the_Dominican_Republic.svg.png", name: "多明尼加"),
            Country(flag: "230px-Flag_of_Cuba.svg.png", name: "古巴"),
            Country(flag: "230px-Flag_of_Jamaica.svg.png", name: "牙買加"),
            Country(flag: "210px-Flag_of_Trinidad_and_Tobago.svg.png", name: "千里達及托巴哥"),
            Country(flag: "200px-Flag_of_Barbados.svg.png", name: "巴貝多"),
            Country(flag: "200px-Flag_of_Antigua_and_Barbuda.svg.png", name: "安地卡及巴布達"),
            Country(flag: "230px-Flag_of_the_Bahamas.svg.png", name: "巴哈馬"),
            Country(flag: "210px-Flag_of_Grenada.svg.png", name: "格瑞那達"),
            Country(flag: "200px-Flag_of_Saint_Kitts_and_Nevis.svg.png", name: "聖克里斯多福與尼維斯"),
            Country(flag: "200px-Flag_of_Saint_Vincent_and_the_Grenadines.svg.png", name: "聖文森及格瑞納丁"),
            Country(flag: "210px-Flag_of_Haiti.svg.png", name: "海地"),
            Country(flag: "230px-Flag_of_Dominica.svg.png", name: "多米尼克"),
            Country(flag: "230px-Flag_of_Saint_Lucia.svg.png", name: "聖露西亞"),
            // 南美
            Country(flag: "200px-Flag_of_Chile.svg.png", name: "智利"),
            Country(flag: "200px-Flag_of_Uruguay.svg.png", name: "烏拉圭"),
            Country(flag: "200px-Flag_of_Peru.svg.png", name: "祕魯"),
            Country(flag: "200px-Flag_of_Bolivia.svg.png", name: "玻利維亞"),
            Country(flag: "200px-Flag_of_Colombia.svg.png", name: "哥倫比亞"),
            Country(flag: "204px-Flag_of_Argentina.svg.png", name: "阿根廷"),
            Country(flag: "210px-Flag_of_Guyana.svg.png", name: "蓋亞"),
            Country(flag: "200px-Flag_of_Suriname.svg.png", name: "蘇利南"),
            Country(flag: "196px-Flag_of_Brazil.svg.png", name: "巴西"),
            Country(flag: "200px-Flag_of_Venezuela.svg.png", name: "委內瑞拉"),
            Country(flag: "200px-Flag_of_Ecuador.svg.png", name: "厄瓜多"),
            Country(flag: "210px-Flag_of_Paraguay.svg.png", name: "巴拉圭"),
            // 大洋洲
            Country(flag: "230px-Flag_of_Tonga.svg.png", name: "東加"),
            Country(flag: "230px-Flag_of_New_Zealand.svg.png", name: "紐西蘭"),
            Country(flag: "230px-Flag_of_Australia.svg.png", name: "澳大利亞"),
            Country(flag: "230px-Flag_of_Samoa.svg.png", name: "薩摩亞"),
            Country(flag: "230px-Flag_of_Nauru.svg.png", name: "諾魯"),
            Country(flag: "230px-Flag_of_Fiji.svg.png", name: "斐濟"),
            Country(flag: "188px-Flag_of_Papua_New_Guinea.svg.png", name: "巴布亞紐幾內亞"),
            Country(flag: "230px-Flag_of_the_Solomon_Islands.svg.png", name: "索羅門"),
            Country(flag: "224px-Flag_of_the_Marshall_Islands.svg.png", name: "馬紹爾"),
            Country(flag: "230px-Flag_of_Kiribati.svg.png", name: "吉里巴斯"),
            Country(flag: "224px-Flag_of_the_Federated_States_of_Micronesia.svg.png", name: "密克羅尼西亞"),
            Country(flag: "210px-Flag_of_Vanuatu.svg.png", name: "萬那杜"),
            Country(flag: "206px-Flag_of_Palau.svg.png", name: "帛琉"),
            Country(flag: "230px-Flag_of_Tuvalu.svg.png", name: "吐瓦魯"),
        ]
    }
    
    
}

