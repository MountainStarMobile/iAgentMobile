//
//  DatabaseAccess.m
//  ExamKing
//
//  Created by sinss on 13/5/7.
//  Copyright (c) 2013年 GoodIea. All rights reserved.
//

#import "DatabaseAccess.h"
#import "DatabaseConnection.h"
#import "DateFunction.h"

DatabaseAccess *databaseAccessInstance;

@implementation DatabaseAccess

+ (DatabaseAccess*)databaseAccessInstance
{
    if (databaseAccessInstance == nil)
    {
        databaseAccessInstance = [[DatabaseAccess alloc] init];
    }
    return databaseAccessInstance;
}

- (NSArray*)GetNewsData
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    NewsInfo *record = [NewsInfo new];
    record.title = [NSString stringWithFormat:@"從一人產品到億人產品"];
    record.content = [NSString stringWithFormat:@"想必大家還記得上個月將 Instapaper 賣給 Betawork 的 Marco Arment，其實他還有另外一個著名的身份——Tumblr 的共同創辦人以及 CTO，後來 2010 年時離開公司，成為獨立開發者與科技部落格作者。現在創業 6 年的 Tumblr 被 Yahoo! 以 11 億美元的高價收購，Arment 心中也有所觸動，回顧了 Tumblr 創立初期以及後來的發展。畢竟，他一步一步看著公司以及 David Karp 成長。2006 年，Arment 已經和 Karp 一起為媒體公司開發網站，包括 Frederator、Serious Eats 等等。當年的秋季，尋找新客戶之前的一段時間，Karp 跟 Arment 說他有一個思考了一段時間的想法，打算去實踐。網站的域名已經買好，是 tumblr.com，它將是一個發布「tumblelogs」1的平台。很快他們兩個開發出 Tumblr 的原型，並獲得 Lifehacker 的報導，而這篇報導登上了 Digg 首頁頭條——請注意，當時是 2007 年，Digg 如日中天，地位和如今的 Reddit 的差不多，是網友愛去的地方。可見當時有多少人對 Tumblr 的點子感興趣。趁熱打鐵，Arment 和 Karp 很快就為 Tumblr 增加 reblogging 的功能，這樣網站就不再是單純的內容發布平台，而是摻雜了社群的元素，讓產品的形態變得獨特。緊接著 2007 年的夏天，Karp 決定停止網站外包服務，尋求資金，將所有時間投入 Tumblr——在此之前，兩人的收入來源是 Karp 做咨詢工作的收入和存款，預算十分有限。於是，2007 年 11 月 1 日，兩人宣布籌資並推出 Tumblr 第三次重大設計。隨之而來的是持續而迅速的增長。投資令兩人的合作得以繼續，也讓產品得到更大的生存空間。而隨著 Tumblr 不斷成長，Arment 發現自己之前所擔心、懷疑的東西都證明是錯的，而 Karp 的想法則是正確的。雖然說，Arment 和 Karp 兩者有許多意見相同的地方，比如說對使用者優先順序、極客以及對設計師需求友好等方面。而在產品上，免費綁定使用者的域名以及全 HTML 模板的設計，令 Tumblr 變為有創造力的人群趨之若鶩的地方。雖然 Tumblr 並非是一個人開發出來的，但它給人的感覺總像是一個「一人產品」。Karp 一直知道下一步朝哪裡走。而 Arment 自己，他承認「我從來不是『想法多多的人』。」不過，由於他負責寫程式以及身上背負的責任，他覺得自己更想是一名「點子編輯」。Karp 常常會冒出增加新功能的想法，然後 Arment 就告訴他哪部分是做不到、不切實際的，哪部分是比較棘手的，有哪些小概率的事件是需要考慮的，有哪些細節、微妙的地方是需要考慮增加的。不過，想法往往來自 Karp，而產品的路線圖也來自 Karp。一般來說，Karp 會將自己最新的想法、功能以及設計打磨一遍，直到它們真的可以拿出去見人，才說出來。他是一名工作狂，在 Tumblr 工作，在 Tumblr 呼吸。Arment 從未見過他會自己開發一些別的專案。Karp 希望別人也能夠像他一樣在 Tumblr 工作，而且常常派出「不可能的任務」，驅使 Arment 努力工作。Arment 認為，從對工作品質的挑剔上看，Karp 和賈伯斯有些像。而和許多為賈伯斯工作的人一樣，當 Arment 回頭看自己在 Tumblr 的時光，有複雜的感覺：一方面，他再也不願意回到那個壓力如此之大的環境，另一方面，在 Karp 的推動下，Arment 自己完成了自己從未想過的、了不起的工作。極致的專注，需要忽略其它一切。Karp 專注於推動產品進化，意味著他並不願意思考那些討人厭的東西：客服、等級制、文書工作以及錢。每次 Arment 要求 Karp 融資的時候，會嘗試著說服對方，要麼堅持更長時間，要麼變得有利可圖。但 Karp 會反過來說服 Arment，專注於產品的改進，會更加有利。而每次爭論過後，都證明 Karp 是對的。在 Tumblr 發展早期，Karp 和 Arment 努力維持兩到三個人的規模，他們害怕員工數量增多，所以面對員工招募的問題，他們的做法是不斷拖延。回頭看看，Arment 覺得拖延的時間太長了。最終，Karp 了解到團隊需要擴大，才能承載更多的任務，後來他再雇用了一個人。不過，Karp 的角色並未發生變化，他仍然不是商人。"];
    record.date = [NSString stringWithFormat:@"2013/05/22"];
    record.auth = [NSString stringWithFormat:@"ifanr"];
    record.expiredDate = [NSString stringWithFormat:@"2013/05/31"];
    [array addObject:record];
    DESTORY(record);
    
    record = [NewsInfo new];
    record.title = [NSString stringWithFormat:@"好點子破蛹化蝶，2013 IDEAS Show 七月登場"];
    record.content = [NSString stringWithFormat:@"由資策會舉辦的 IDEAS Show 即將在 7 月 24、25 日兩天於集思台大會議中心登場，這次除了選出國內外約 25 個優秀團隊上台發表，以及約 60 個攤位可供新創團隊展示交流；且另有多場主題 Keynote 及 Panel，邀請各主題領域的國內外相關業者及講師一同參與。去年的活動與參與團隊可見 INSIDE 報導。符合以下資格的團隊，可以報名加入選拔或攤位展示：「IDEAS Show 網路創意展」國內業者：完成營利事業登記之公司行號，且參與徵選之網創新服務未曾於IDEAS Show舞臺進行發表過。國際團隊：參與徵選之網創服務未曾在台灣公開發表過。「IDEAS Expo 網站博覽展」入選參加IDEAS Show網路創意展公開發表之團隊。一般國內外網創業者（含個人團隊），所展示之服務可供現場來賓進行實際操作。評選將分為兩個階段進行，最後獲選的團隊將可以於 24、25 日 IDEAS Show 上登台 Demo，讓更多潛在夥伴或投資人認識你。目前國內團隊的報名截止日至6月07日止，國際團隊的報名截止日為6月15日，而IDEAS Expo的報名則受理至6月28日止，點此可看更多報名資訊。另外IDEAS Show門票也將於6月開始售票。"];
    record.date = [NSString stringWithFormat:@"2013/05/21"];
    record.auth = [NSString stringWithFormat:@"36氪"];
    record.expiredDate = [NSString stringWithFormat:@"2013/05/31"];
    [array addObject:record];
    DESTORY(record);
    
    record = [NewsInfo new];
    record.title = [NSString stringWithFormat:@"寫給工程師看的互動設計"];
    record.content = [NSString stringWithFormat:@"編者按：看到此文時恍惚回到自己學習網頁的時候，那時候只知有程式，不知有設計。各個論壇大多討論的也是如何用 Frame 規劃頁面區塊，如何做出圓角，以及寫一大段 javascript 程式或者做個 Flash 只為讓頁面看起來更炫。後來 css1.0, 2.0 陸續出現，html 4.0 4.1 以及如今的 html 5 也逐漸淘汰掉了表現樣式的標籤。視覺傳達思想開始陸續進入工程師與產品經理的視野，從網頁到現在的 app，經歷過野蠻生長階段後，只有那些功能與視覺傳達同樣優秀的產品才能永久存活。2007 年蘋果給業界帶來了耳目一新的感覺，之後無數 app 展現了幾乎讓人驚豔的新概念，但是，不是每一個新奇的想法都能被稱作設計。設計師需要經過嚴格訓練，才能把想法轉化為最終的設計，而在整個轉化過程中，無數的想法是經不起仔細推敲的。設計師更多的時候在觀察生活，觀察自然，靈感不是隨時就有，但是一個經過嚴格訓練的設計師可以把普通的生活細節經過加工融入設計，最終打造出合格甚至優秀的產品。本文作者 Pasquale D'Silva 是 Elepath 的一位互動設計師兼產品設計師，在本文中，他從互動的角度闡釋了優秀的設計應該具有的一些品質，或者說，突出的產品該如何達到與使用者自然溝通的目標。"];
    record.date = [NSString stringWithFormat:@"2013/05/20"];
    record.auth = [NSString stringWithFormat:@"張星星"];
    record.expiredDate = [NSString stringWithFormat:@"2013/05/31"];
    [array addObject:record];
    DESTORY(record);
    
    record = [NewsInfo new];
    record.title = [NSString stringWithFormat:@"LINE 遭指審查過濾「敏感詞」訊息（更新）"];
    record.content = [NSString stringWithFormat:@"去年底與奇虎 360 合作進軍中國市場的 LINE（名稱為「連我LINE」）1，遭網友 Hiraku 指出他們也會過濾「敏感詞」2，訊息會因此無法傳送至中國大陸。他以台灣帳號、日文語系、未綁定電話號碼與 Facebook 帳號進行測試，即便任一條件都與中國無關，LINE 依然會審查關鍵字，以下是他在測試之後得出結論：LINE 會對你輸入跟接收到的文字內容審查，出去跟進來分別用一個 method 檢查審查不分國家，我測試到的情況是 台灣帳號+日文語系+沒有綁定電話號碼+沒有綁定 Facebook ，即使上面條件一項跟中國都無關， LINE 依然對我進行關鍵字審查。而審查是在本地進行的，LINE 會在網路上下載一個敏感詞列表，之後對內容進行比對，如果有符合的內容，就會出現錯誤（在中國大陸）連結是網友取得的畫面，他也將「敏感詞」列出（連結）。"];
    record.date = [NSString stringWithFormat:@"2013/05/19"];
    record.auth = [NSString stringWithFormat:@"Editor hank"];
    record.expiredDate = [NSString stringWithFormat:@"2013/05/31"];
    [array addObject:record];
    DESTORY(record);
    
    return array;
}

@end
