複雑怪奇な xslt(XSL{Extensible Stylesheet Language} Transformations) のエクササイズ

###### xslt

- xslt is a simple(?) language to transform XML
- xslt's syntax is XML (<-> semantic)
- not poplar now (but supported in most browsers)

参考

[短め解説](http://takuya-1st.hatenablog.jp/entry/2015/08/31/120000)  
https://www.w3.org/TR/2008/REC-xml-20081126/  
http://www.atmarkit.co.jp/ait/articles/0109/18/news002.html  
http://www.atmarkit.co.jp/fxml/tanpatsu/xslt/xslt05.html  


参考(雑多)

http://stackoverflow.com/questions/6953265/list-of-xslt-instructions-functions-that-change-the-context-node  
https://msdn.microsoft.com/ja-jp/library/ms256086%28v=vs.120%29.aspx?f=255&MSPPError=-2147217396  
http://stackoverflow.com/questions/928935/index-in-loop-xsl  
http://stackoverflow.com/questions/11393111/use-wildcard-to-match-attribute-in-xpath  
http://www.abe.or.jp/yuragi/gsxslt/p001/p001.asp  
http://www6.airnet.ne.jp/manyo/xml/  

###### 状況説明(適当なのでおおいに間違っている可能性があります)

[xmlの仕様](https://www.w3.org/TR/REC-xml/)はxmlでかかれている。ドキュメントはXMLとXHTMLの2種類用意されており、[XMLの方](https://www.w3.org/TR/REC-xml/REC-xml-20081126.xml) のソースをクリックしたとき送られてくるファイル一覧をchromeのディベロッパーツールでみると以下のようになっている(画像、css除く)。

- REC-sml-20081126.xml
- xmlspec.dtd
- REC-xml.xsl
- diffspec.xsl
- xmlspec.xsl

dtd(document data definition)ファイルはxmlの仕様に制限を加えている。xmlファイルからxslファイルを読み込むことでxmlファイルを変換して最終結果がブラウザに表示される。

##### やったこと

REC-sml-20081126.xmlに自前のxslを適用させて、結果をhtmlで吐き出した。

- ass1 : xml文書から、chapter/subchpater/subsubchapter を抜き出す
- ass2 : xmlのうち、termdef-elementを抜き出してindex作成
- ass3a: ass1を改良して、chapterのみ表示、subchapterまで表示、subsub,,, を切り替えられるようにする。
- ass3b: ass2のおまけとして、termdefされた単語がどこで使われていたかを抜き出す

各フォルダに xmlspec.xsl, xmlspec.dtd, REC-sml-20081126.xml を配置したうえで、 REC-sml-20081126.xml の

    <?xml-stylesheet type="text/xsl" href="REC-xml.xsl"?>
の部分を

    <?xml-stylesheet type="text/xsl" href="ass1.xsl"?>

などと、該当する xslファイルを読み込ませるように書き換える。そのうえで、xmlファイルをブラウザでひらけば、変換された内容がブラウザに表示されてくれる。chromeの場合は、セキュリティの関係でxslの読み込みがブロックされるので、[Web Server for Chrome](https://chrome.google.com/webstore/detail/web-server-for-chrome/ofhbbkphhbklhfoeikjpcbhemlocgigb)を用いる必要があった。

おわり
